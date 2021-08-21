package com.spring.controller;

import java.io.File;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.common.io.Files;
import com.spring.command.CreateFolderCommand;
import com.spring.command.DeleteDocCommand;
import com.spring.command.DeleteFolderCommand;
import com.spring.command.DocumentInsertCommand;
import com.spring.command.GetDeleteCode;
import com.spring.command.GetDepCodeCommand;
import com.spring.command.GetSmailEmpList;
import com.spring.command.ScrapDeleteCommand;
import com.spring.command.TrashListCommand;
import com.spring.command.TrashRestoreDeleteCommand;
import com.spring.command.projectShareCommand;
import com.spring.command.updateFolderCommand;
import com.spring.dto.AnswerVO;
import com.spring.dto.DepEmpVO;
import com.spring.dto.DepVO;
import com.spring.dto.DfolderVO;
import com.spring.dto.DocumentVO;
import com.spring.dto.EmpVO;
import com.spring.dto.JobVO;
import com.spring.dto.KnowVO;
import com.spring.dto.RmailVO;
import com.spring.dto.ScrapVO;
import com.spring.dto.SmailVO;
import com.spring.dto.TrashVO;
import com.spring.dto.shareProjectVO;
import com.spring.service.AnswerService;
import com.spring.service.CoPService;
import com.spring.service.DepService;
import com.spring.service.DfolderService;
import com.spring.service.DocumentService;
import com.spring.service.EmpService;
import com.spring.service.JobService;
import com.spring.service.KnowService;
import com.spring.service.PRBService;
import com.spring.service.ProService;
import com.spring.service.RankService;
import com.spring.service.RmailService;
import com.spring.service.ScrapService;
import com.spring.service.SmailService;
import com.spring.service.TrashService;

@Controller
@RequestMapping("/mypage")
public class MypageController {

	@Autowired
	private CoPService copService;
	
	@Autowired
	private RmailService rmailService;
	
	@Autowired
	private SmailService smailService;
	
	@Autowired
	private DepService depService;
	
	@Autowired
	private RankService rankService;
	
	@Autowired
	private EmpService empService;
	
	@Autowired
	private TrashService trashService;
	
	@Autowired
	private JobService jobService;
	
	@Autowired
	private ScrapService scrapService;
	
	@Autowired
	private KnowService knowService; 
	
	@Autowired
	private ProService proService;
	
	@Autowired
	private DfolderService dfolderService;
	
	@Autowired
	private DocumentService documentService;
	
	@Autowired
	private PRBService prbService;
	
	@Resource(name = "MeetingUploadPath")
	private String MeetingUploadPath;
	
	@RequestMapping(value="/deleteDoc",method= RequestMethod.POST,produces="text/plain;charset=utf-8")
	@ResponseBody
	public ResponseEntity<String> deleteDoc(@RequestBody DeleteDocCommand dd)throws Exception{
		ResponseEntity<String> entity=null;
		
		
		documentService.deleteDocument(dd.getCode());
		
		try {
			entity=new ResponseEntity<String>("SUCCESS",HttpStatus.OK);
			
		} catch (Exception e) {
			entity = new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		return entity;
	}	
	
	
	
	@RequestMapping(value="/updateFolder",method= RequestMethod.POST,produces="text/plain;charset=utf-8")
	@ResponseBody
	public ResponseEntity<String> updateFolder(@RequestBody updateFolderCommand ud)throws Exception{
		ResponseEntity<String> entity=null;
		
		DocumentVO doc = ud.toDocumentVO();
		
		documentService.updateDocument(doc);
		
		try {
			entity=new ResponseEntity<String>("SUCCESS",HttpStatus.OK);
			
		} catch (Exception e) {
			entity = new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		return entity;
	}	
	
	
	
	@RequestMapping("/myFolder")
	public ModelAndView myFolder(ModelAndView mnv,HttpSession session,String fId) throws SQLException {
		String url = "mypage/myFolder.open";
		EmpVO emp=(EmpVO)session.getAttribute("loginUser");
		String name = fId;
		DocumentVO doc = new DocumentVO();
		doc.setEmpId(emp.getEmpId());
		doc.setDocFolder(name);
		List<DfolderVO> dfList = dfolderService.findFolderById(emp.getEmpId());
		List<DocumentVO> docList = documentService.selectFileListByFolder(doc);
		
		mnv.addObject("name", name);
		mnv.addObject("dfList", dfList);
		mnv.addObject("docList", docList);
		mnv.setViewName(url);
		return mnv;
	}
	
	
	@RequestMapping("/documentDown")
	public String meetingDown(String docCode,Model model) throws Exception {
		String url="downloadFile";
		
		DocumentVO doc =  documentService.selectImfoDocument(docCode);
		
		
		model.addAttribute("savedPath", doc.getDocPath());
		model.addAttribute("fileName", doc.getDocName());
		
		return url;		
	}
	
	
	@RequestMapping(value="/insertDocument",method=RequestMethod.POST,produces="text/plain;charset=utf-8")
	@ResponseBody
	public ResponseEntity<String> insertMeeting(@RequestBody DocumentInsertCommand doci,HttpSession session)throws Exception{
		ResponseEntity<String>  entity=null;
		
		EmpVO emp = (EmpVO)session.getAttribute("loginUser");
		String empId=emp.getEmpId();
		String folder = "전체";
		
		
		DocumentVO doc = doci.toDocumentVO();
		doc.setEmpId(empId);
		doc.setDocFolder(folder);
		
		
		String home = System.getProperty("user.home");
		File file = new File(home+"/Downloads/" + doc.getDocName()); 
		
		File file2 = new File(MeetingUploadPath+"/"+doc.getDocName());
		
		
		try {
			   /*FileUtils.moveFile(file, file2);*/
			   Files.move(file, file2);
			}
			catch (Exception e) {
			   e.printStackTrace();
			}
		
		doc.setDocPath(MeetingUploadPath);
		
		documentService.insertDocument(doc);
		
		try {
			
			entity = new ResponseEntity<String>("완료",HttpStatus.OK);
			
		} catch (Exception e) {
			entity = new ResponseEntity<String>(e.getMessage(),HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		return  entity;
		
	}
	
	
	@RequestMapping(value="/deleteFolder",method= RequestMethod.POST,produces="text/plain;charset=utf-8")
	@ResponseBody
	public ResponseEntity<String> deleteFolder(@RequestBody DeleteFolderCommand df)throws Exception{
		ResponseEntity<String> entity=null;
		
		 dfolderService.deleteFolder(df.getfId());
		
		try {
			entity=new ResponseEntity<String>("SUCCESS",HttpStatus.OK);
			
		} catch (Exception e) {
			entity = new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		return entity;
	}
	
	
	@RequestMapping(value="/createFolder",method= RequestMethod.POST,produces="text/plain;charset=utf-8")
	@ResponseBody
	public ResponseEntity<String> createFolder(@RequestBody CreateFolderCommand df)throws Exception{
		ResponseEntity<String> entity=null;
		
		 DfolderVO dfolder = df.toDfolderVO();
		
		 dfolderService.createFolder(dfolder);
		
		try {
			entity=new ResponseEntity<String>("SUCCESS",HttpStatus.OK);
			
		} catch (Exception e) {
			entity = new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		return entity;
	}
	
	
	
	
	@RequestMapping("/mydocument")
	public ModelAndView mydocument(ModelAndView mnv,HttpSession session) throws SQLException {
		String url = "mypage/mydocument.open";
		EmpVO emp=(EmpVO)session.getAttribute("loginUser");
		String name = "전체";
		DocumentVO doc = new DocumentVO();
		doc.setEmpId(emp.getEmpId());
		doc.setDocFolder(name);
		
		List<DfolderVO> dfList = dfolderService.findFolderById(emp.getEmpId());
		List<DocumentVO> docList = documentService.selectFileListByFolder(doc);
		
		mnv.addObject("docList", docList);
		mnv.addObject("dfList",dfList);
		mnv.setViewName(url);
		return mnv;
	}
	
	
	
	@Autowired
	private AnswerService answerService;
	
	@RequestMapping(value="/jobShare",method=RequestMethod.POST,produces = "text/plain;charset=utf-8")
	public String jobShare(GetSmailEmpList sm,HttpSession session,HttpServletRequest request)throws Exception{
		String url = "mypage/send_success.open";
		
		SmailVO smail = sm.toSmailVO();
		RmailVO rmail = sm.toRmailVO();
		
		EmpVO emp=(EmpVO)session.getAttribute("loginUser");

		smail.setEmpId(emp.getEmpId());
		smail.setSmEnabled(3);
		rmail.setRmSender(emp.getEmpId());
		rmail.setRmEnabled(3);
		String[] empList = sm.getEmpList().split(",");
		
		for(String List : empList) {
			smail.setSmReceiver(List);
			smailService.sendMail(smail);
			rmail.setEmpId(List);
			rmailService.receiveMail(rmail);
		}
		
		return url;
	}
	@RequestMapping("/receivemail")
	public  ModelAndView receiveMailList(ModelAndView mnv,HttpSession session) throws Exception{
		String url="mypage/receiveMailList.open";
		EmpVO emp=(EmpVO)session.getAttribute("loginUser");
		

		List<RmailVO> rmailList=rmailService.selectRMailListById(emp.getEmpId());
		
		mnv.addObject("rmailList",rmailList);
		mnv.setViewName(url);
		return mnv;
		
	}
	
	
	@RequestMapping("/sendmail")
	public ModelAndView sendMailList(ModelAndView mnv,HttpSession session) throws Exception{
		String url="mypage/sendMailList.open";
		
		EmpVO emp=(EmpVO)session.getAttribute("loginUser");
		
		
		List<SmailVO> smailList= smailService.selectSMailListById(emp.getEmpId());
		
		
		mnv.addObject("smailList",smailList);
		mnv.setViewName(url);
		
		return mnv;
		
		
	}
	
	
	@RequestMapping("/SmailRegistForm")
	public ModelAndView SmailRegistForm(ModelAndView mnv)throws Exception{
		String url = "mypage/SmailRegistForm.open";
		
		List<DepVO> depList =depService.getDepList();
		
		
		
		mnv.addObject("depList", depList);
		mnv.setViewName(url);
		
		return mnv;
	}
	
	@RequestMapping("/reSend")
	public ModelAndView reSend(ModelAndView mnv,String sender)throws Exception{
		String url = "mypage/reSend.open";
		
		EmpVO emp = empService.getEmpById(sender);
		
		mnv.addObject("emp",emp);
		mnv.setViewName(url);
		
		return mnv;
	}
	
	@RequestMapping(value="/regist",method=RequestMethod.POST,produces = "text/plain;charset=utf-8")
	public String regist(GetSmailEmpList sm,HttpSession session,HttpServletRequest request)throws Exception{
		String url = "mypage/send_success.open";
		
		SmailVO smail = sm.toSmailVO();
		RmailVO rmail = sm.toRmailVO();
		
		EmpVO emp=(EmpVO)session.getAttribute("loginUser");

		smail.setEmpId(emp.getEmpId());
		smail.setSmEnabled(1);
		rmail.setRmSender(emp.getEmpId());
		rmail.setRmEnabled(1);
		String[] empList = sm.getEmpList().split(",");
		
		for(String List : empList) {
			smail.setSmReceiver(List);
			smailService.sendMail(smail);
			rmail.setEmpId(List);
			rmailService.receiveMail(rmail);
		}
		
		return url;
	}
	
	
	@RequestMapping(value="/projecterRegist",method=RequestMethod.POST,produces = "text/plain;charset=utf-8")
	public String projecterRegist(GetSmailEmpList sm,HttpSession session,HttpServletRequest request, String path, Model model)throws Exception{
		String url = "mypage/send_success.open";
		
		SmailVO smail = sm.toSmailVO();
		RmailVO rmail = sm.toRmailVO();
		
		EmpVO emp=(EmpVO)session.getAttribute("loginUser");

		smail.setEmpId(emp.getEmpId());
		smail.setSmEnabled(2);
		rmail.setRmSender(emp.getEmpId());
		rmail.setRmEnabled(2);
		String[] empList = sm.getEmpList().split(",");
		
		for(String List : empList) {
			smail.setSmReceiver(List);
			smailService.sendMail(smail);
			rmail.setEmpId(List);
			rmailService.receiveMail(rmail);
		}
		if(path != null) {
			model.addAttribute("path", path);
			url = "cop_detail/send_success.open";
		}
		
		return url;
	}
	
	
	
	@RequestMapping(value="/deleteRmailList",method= RequestMethod.POST,produces="text/plain;charset=utf-8")
	@ResponseBody
	public ResponseEntity<String> deleteRmailList(@RequestBody GetDeleteCode dCode,HttpSession session)throws Exception{
		ResponseEntity<String> entity=null;
		EmpVO emp=(EmpVO)session.getAttribute("loginUser");
		String[] deleteList = dCode.getChecked().split(",");
		
		
		for(String List : deleteList) {
			rmailService.deleteRmail(List);
		}
		
		try {
			entity=new ResponseEntity<String>("휴지통으로 보내기",HttpStatus.OK);
			
		} catch (Exception e) {
			entity = new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		return entity;
	}
	
	
	@RequestMapping(value="/deleteRmail",method= RequestMethod.POST,produces="text/plain;charset=utf-8")
	@ResponseBody
	public ResponseEntity<String> deleteRmail(@RequestBody GetDeleteCode dCode,HttpSession session)throws Exception{
		ResponseEntity<String> entity=null;
		EmpVO emp=(EmpVO)session.getAttribute("loginUser");
		String[] deleteList = dCode.getChecked().split(",");
		
		for(String List : deleteList) {
			rmailService.deleteAllRmail(List);
		}
		
		try {
			entity=new ResponseEntity<String>("휴지통으로 보내기",HttpStatus.OK);
			
		} catch (Exception e) {
			entity = new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		return entity;
	}
	
	
	@RequestMapping(value="/deleteSmail",method= RequestMethod.POST,produces="text/plain;charset=utf-8")
	@ResponseBody
	public ResponseEntity<String> deleteSmail(@RequestBody GetDeleteCode dCode,HttpSession session)throws Exception{
		ResponseEntity<String> entity=null;
		EmpVO emp=(EmpVO)session.getAttribute("loginUser");
		String[] deleteList = dCode.getChecked().split(",");
		
		for(String List : deleteList) {
			smailService.deleteAllSmail(List);
		}
		
		try {
			entity=new ResponseEntity<String>("휴지통으로 보내기",HttpStatus.OK);
			
		} catch (Exception e) {
			entity = new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		return entity;
	}
	
	@RequestMapping(value="/deleteSmailList",method= RequestMethod.POST,produces="text/plain;charset=utf-8")
	@ResponseBody
	public ResponseEntity<String> deleteSmailList(@RequestBody GetDeleteCode dCode,HttpSession session)throws Exception{
		ResponseEntity<String> entity=null;
		EmpVO emp=(EmpVO)session.getAttribute("loginUser");
		String[] deleteList = dCode.getChecked().split(",");
		for(String List : deleteList) {
			smailService.deleteSmail(List);
		}
		
		try {
			entity=new ResponseEntity<String>("휴지통으로 보내기",HttpStatus.OK);
			
		} catch (Exception e) {
			entity = new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		return entity;
	}
	
	
	
	
	@RequestMapping(value="/getList",method= RequestMethod.POST,produces="application/json;charset=utf-8")
	@ResponseBody
	public ResponseEntity<Map<String,Object>> getList(@RequestBody GetDepCodeCommand depCode)throws Exception{
		ResponseEntity<Map<String,Object>> entity=null;
		
		DepVO dep= depCode.toDepVO();
		
		List<DepEmpVO> depEmpList = smailService.getDepEmpList(dep.getDepCode());
	
		Map<String ,Object> dataMap = new HashMap<String, Object>();
		
		dataMap.put("depEmpList", depEmpList);
		
		try {
			entity=new ResponseEntity<Map<String,Object>>(dataMap,HttpStatus.OK);
			
		} catch (Exception e) {
			entity = new ResponseEntity<Map<String,Object>>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		return entity;
	}
	
	

	@RequestMapping(value="/reSendMail",method=RequestMethod.POST,produces = "text/plain;charset=utf-8")
	public String reSend(GetSmailEmpList sm,HttpSession session,HttpServletRequest request)throws Exception{
		String url = "mypage/reSend_success.open";
		SmailVO smail = sm.toSmailVO();
		RmailVO rmail = sm.toRmailVO();
		
		EmpVO emp=(EmpVO)session.getAttribute("loginUser");

		smail.setEmpId(emp.getEmpId());
		smail.setSmEnabled(1);
		rmail.setRmSender(emp.getEmpId());
		rmail.setRmEnabled(1);
		String[] empList = sm.getEmpList().split(",");
		
		for(String List : empList) {
			
			smail.setSmReceiver(List);
			smailService.sendMail(smail);
			rmail.setEmpId(List);
			rmailService.receiveMail(rmail);
		}
		
		return url;
	}

	
	@RequestMapping("/SmailDetail")
	public ModelAndView SmailDetail(String smCode ,ModelAndView mnv)throws Exception{
		String url= "mypage/SmailDetail.open";
		
		SmailVO smail = smailService.selectSmailInfo(smCode);
		EmpVO emp = empService.getEmpById(smail.getSmReceiver());
		
		mnv.addObject("emp",emp);
		mnv.addObject("smail",smail);
		mnv.setViewName(url);
		return mnv;
		
	}
	
	
	@RequestMapping("/RmailDetail")
	public ModelAndView RmailDetail(String rmCode ,ModelAndView mnv)throws Exception{
		String url= "mypage/RmailDetail.open";
		
		RmailVO rmail = rmailService.selectRmailInfo(rmCode);
		
		EmpVO emp = empService.getEmpById(rmail.getRmSender());
		
		mnv.addObject("emp",emp);
		mnv.addObject("rmail",rmail);
		mnv.setViewName(url);
		return mnv;
		
	}
	
	
	
	
	@RequestMapping("/trash")
	public ModelAndView Trash(ModelAndView mnv, HttpSession session) throws Exception{
		String url = "mypage/trash.open";
		
		EmpVO emp=(EmpVO)session.getAttribute("loginUser");
		String empId = emp.getEmpId();
		
		TrashVO trash = new TrashVO();
		trash.setEmpId(empId);
		Map<String, Object> dataMap = trashService.getTrashCntAsTrType(trash);
		
		List<String> trTable = (List<String>) dataMap.get("trashTable");
		List<String> trName = new ArrayList<String>();
		for(String table : trTable) {
			String name = "";
			switch(table) {
				case "RECEIVEMAIL": name = "받은 메일";
					break;
				case "SENDMAIL": name = "보낸 메일";
					break;
				case "TOTALKNOWLEDGEBOARD": name = "기타 자료 게시판";
					break;
				case "KNOWHOWBOARD": name = "노하우 게시판";
					break;
				case "PROJECTARCHIEVE": name = "프로젝트 자료실";
					break;
				case "PROJECTREPORTBOARD": name = "프로젝트 보고서 게시판";
					break;
				case "COPARCHIVE": name = "COP 자료실";
					break;
				default: break;
			};
			trName.add(name);
		}
		
		mnv.addObject("trashTable", dataMap.get("trashTable"));
		mnv.addObject("trashName", trName);
		mnv.addObject("trashCnt", dataMap.get("trashCnt"));
		
		mnv.setViewName(url);
		return mnv;
	}

	
	@RequestMapping(value="/getTrashList",method= RequestMethod.POST,produces="application/json;charset=utf-8")
	public ResponseEntity<Map<String, Object>> TrashList(@RequestBody TrashListCommand trTable, HttpSession session) throws Exception{
		ResponseEntity<Map<String, Object>> entity = null;
		
		EmpVO emp=(EmpVO)session.getAttribute("loginUser");
		String empId = emp.getEmpId();
		
		TrashVO trash = trTable.toTrashVO();
		trash.setEmpId(empId);
		
		List<TrashVO> trashList = trashService.getTrashListFromTrTable(trash);
		
		for(int i = 0; i < trashList.size(); i++) {
			String name = "";
			if(trashList.get(i).getCode() != null) {
				switch(trashList.get(i).getCode().substring(0,3)) {
					case "rma": name = "받은 메일";
					break;
					case "sma": name = "보낸 메일";
					break;
					case "tok": name = "기타 자료 게시판";
					break;
					case "koh": name = "노하우 게시판";
					break;
					case "pra": name = "프로젝트 자료실";
					break;
					case "prr": name = "프로젝트 보고서 게시판";
					break;
					case "cpa": name = "COP 자료실";
					break;
					default: break;
				};
			}else {
				name = "알 수 없음"; 
			}
			trashList.get(i).setTrName(name);
		}
		
		Map<String ,Object> dataMap = new HashMap<String, Object>();
		dataMap.put("trashList", trashList);
		
		try {
			entity=new ResponseEntity<Map<String,Object>>(dataMap,HttpStatus.OK);
		} catch (Exception e) {
			entity=new ResponseEntity<Map<String, Object>>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		return entity;
	}
	
	
	
	@RequestMapping(value="/restoreTrash",method= RequestMethod.POST,produces="text/plain;charset=utf-8")
	@ResponseBody
	public ResponseEntity<String> restoreTrash(@RequestBody TrashRestoreDeleteCommand trashControlCommand,HttpSession session)throws Exception{
		ResponseEntity<String> entity=null;
		
		String[] checked = trashControlCommand.getChecked().split(",");
		TrashVO trash = trashControlCommand.toTrashVO();
		trash.setTrTable(trashControlCommand.getTrTable());
		
		for(String check : checked) {
			trash.setCode(check);
			trashService.restoreTrash(trash);
		}
		
		try {
			entity=new ResponseEntity<String>(trash.getTrTable(),HttpStatus.OK);
			
		} catch (Exception e) {
			entity = new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		return entity;
	}
	
	
	
	
	@RequestMapping(value="/deleteTrash",method= RequestMethod.POST,produces="text/plain;charset=utf-8")
	@ResponseBody
	public ResponseEntity<String> deleteTrash(@RequestBody TrashRestoreDeleteCommand trashControlCommand,HttpSession session)throws Exception{
		ResponseEntity<String> entity=null;
		
		String[] checked = trashControlCommand.getChecked().split(",");
		TrashVO trash = trashControlCommand.toTrashVO();
		trash.setTrTable(trashControlCommand.getTrTable());
		
		for(String check : checked) {
			trash.setCode(check);
			trashService.removeTrash(trash);
		}
		
		try {
			entity=new ResponseEntity<String>(trash.getTrTable(),HttpStatus.OK);
			
		} catch (Exception e) {
			entity = new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		return entity;
	}
	
	
	
	
	
	
	
	@RequestMapping("/myactive")
	public ModelAndView MyActive(ModelAndView mnv, HttpSession session) throws SQLException{
		String url = "mypage/myActive.open";
		
		EmpVO emp=(EmpVO)session.getAttribute("loginUser");
		String empId = emp.getEmpId();
		
		List<JobVO> jobList = jobService.getJobListById(empId);
		for(int i = 0; i < jobList.size(); i++) {
			String pName = proService.getProInfo(jobList.get(i).getpCode()).getpName();
			jobList.get(i).setpName(pName);
		}
		List<ScrapVO> scrapList = scrapService.selectScrapList(empId);
		List<KnowVO> knowList = knowService.getKnowListById(empId);
		List<AnswerVO> answerList = answerService.selectAnswerListById(empId);
		List<KnowVO> knowListAll = knowService.getAllKnowList();
		List<String> khTitleList = new ArrayList<>();
		for(int i = 0; i < answerList.size(); i++) {
			for (int j = 0; j < knowListAll.size(); j++) {
				if(answerList.get(i).getKhCode().equals(knowListAll.get(j).getKhCode())) {
					khTitleList.add(knowListAll.get(j).getKhTitle());
				}
			}
		}
		for(int i = 0; i < scrapList.size(); i++) {
			String scrapType = scrapList.get(i).getScUrl().split("/")[5].substring(0,3);
			if(scrapType.equals("prb")) {
				scrapList.get(i).setScTitle(proService.getProInfo(prbService.getPrb(scrapList.get(i).getScUrl().split("=")[1]).getpCode()).getpName());
			}
		}
		
		mnv.addObject("jobList",jobList);
		mnv.addObject("scrapList",scrapList);
		mnv.addObject("knowList",knowList);
		mnv.addObject("answerList",answerList);
		mnv.addObject("khTitleList",khTitleList);
		
		mnv.setViewName(url);
		
		return mnv;
	}
	
	
	@RequestMapping(value="/deleteScrap",method= RequestMethod.POST,produces="text/plain;charset=utf-8")
	@ResponseBody
	public ResponseEntity<String> deleteScrap(@RequestBody ScrapDeleteCommand command,HttpSession session)throws Exception{
		ResponseEntity<String> entity=null;
		
		String[] scUrl = command.getScUrl().split(",");
		ScrapVO scrap = command.toScrapVO();
		scrap.setEmpId(command.getEmpId());
		
		for(String url : scUrl) {
			scrap.setScUrl(url);
			scrapService.deleteScrap(scrap);
		}
		
		try {
			entity=new ResponseEntity<String>("success",HttpStatus.OK);
			
		} catch (Exception e) {
			entity = new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		return entity;
	}
	
	
	@RequestMapping(value = "/shareApprove", method= RequestMethod.POST)
	public String shareApprove(projectShareCommand shareCommand, Model model, HttpSession session) {
		String url = "cop_detail/projectShare_success.open";
		
		shareProjectVO sp = shareCommand.toShareProjectVO();
		
		try {
			copService.projectDirectShare(sp);
		} catch (Exception e) {
			e.printStackTrace();
			url = "cop_detail/duplicateMember.open";
		}
		return url;
	}
	
	@RequestMapping("/myoffice")
	public String myoffice()throws Exception{
		String url = "mypage/myoffice.open";
		return url;
	}
	
	
	@Resource(name = "FormUploadPath")
	private String FormUploadPath;
	
	@RequestMapping("/getOfficeForm")
	public String getOfficeForm(String fileName,Model model)throws Exception{
		String url = "downloadFile";
		
		model.addAttribute("savedPath", FormUploadPath);
		model.addAttribute("fileName", fileName);
		
		return url;
	}
}







