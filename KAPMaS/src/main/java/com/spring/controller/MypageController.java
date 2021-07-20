package com.spring.controller;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Case;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.spring.command.GetDeleteCode;
import com.spring.command.GetDepCodeCommand;
import com.spring.command.GetSmailEmpList;
import com.spring.command.SearchCriteriaById;
import com.spring.command.TrashListCommand;
import com.spring.command.TrashRestoreDeleteCommand;
import com.spring.dto.DepEmpVO;
import com.spring.dto.DepVO;
import com.spring.dto.EmpVO;
import com.spring.dto.RmailVO;
import com.spring.dto.SmailVO;
import com.spring.dto.TrashVO;
import com.spring.service.DepService;
import com.spring.service.EmpService;
import com.spring.service.RankService;
import com.spring.service.RmailService;
import com.spring.service.SmailService;
import com.spring.service.TrashService;

@Controller
@RequestMapping("/mypage")
public class MypageController {

	
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
	
	@RequestMapping(value="/jobShare",method=RequestMethod.POST,produces = "text/plain;charset=utf-8")
	public String jobShare(GetSmailEmpList sm,HttpSession session,HttpServletRequest request)throws Exception{
		String url = "mypage/send_success";
		
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
		String url = "mypage/send_success";
		
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
	public String projecterRegist(GetSmailEmpList sm,HttpSession session,HttpServletRequest request)throws Exception{
		String url = "mypage/send_success";
		
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
		
		return url;
	}
	
	
	
	@RequestMapping(value="/deleteRmailList",method= RequestMethod.POST,produces="application/json;charset=utf-8")
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
	
	
	@RequestMapping(value="/deleteRmail",method= RequestMethod.POST,produces="application/json;charset=utf-8")
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
	
	
	@RequestMapping(value="/deleteSmail",method= RequestMethod.POST,produces="application/json;charset=utf-8")
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
	
	@RequestMapping(value="/deleteSmailList",method= RequestMethod.POST,produces="application/json;charset=utf-8")
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
		String url = "mypage/reSend_success";
		SmailVO smail = sm.toSmailVO();
		RmailVO rmail = sm.toRmailVO();
		
		EmpVO emp=(EmpVO)session.getAttribute("loginUser");

		smail.setEmpId(emp.getEmpId());
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
	
	
	
	@RequestMapping(value="/restoreTrash",method= RequestMethod.POST,produces="application/json;charset=utf-8")
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
	
	
	
	
	@RequestMapping(value="/deleteTrash",method= RequestMethod.POST,produces="application/json;charset=utf-8")
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
	
	
	
	
	public ModelAndView MyActive(ModelAndView mnv, HttpSession session) throws SQLException{
		String url = "mypage/myactive.open";
		return mnv;
	}
	
	
}







