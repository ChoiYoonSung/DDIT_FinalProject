	package com.spring.controller;

import java.io.File;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.spring.api.JSONParse;
import com.spring.command.DBPiaCommand;
import com.spring.command.GetKnowListCommand;
import com.spring.command.KnowModifyCommand;
import com.spring.command.LikeCommand;
import com.spring.command.PrbFileDownloadCommand;
import com.spring.command.ReportCommand;
import com.spring.command.ScrapDeleteCommand;
import com.spring.command.ScrapInsertCommand;
import com.spring.command.SearchCriteria;
import com.spring.command.TkModifyCommand;
import com.spring.command.TkRegistCommand;
import com.spring.command.knowRegistCommand;
import com.spring.dto.DepVO;
import com.spring.dto.EmpVO;
import com.spring.dto.KnowVO;
import com.spring.dto.LikeVO;
import com.spring.dto.PRBVO;
import com.spring.dto.ReportVO;
import com.spring.dto.ScrapVO;
import com.spring.dto.TkAttachVO;
import com.spring.dto.TotalKnowledgeVO;
import com.spring.service.AnswerService;
import com.spring.service.DepService;
import com.spring.service.EmpService;
import com.spring.service.KnowService;
import com.spring.service.PRBService;
import com.spring.service.ScrapService;
import com.spring.service.TkReplyService;
import com.spring.service.TotalKnowledgeService;
import com.spring.utils.GetAttachesAsMultipartFiles;

@Controller
@RequestMapping("/kms")
public class TotalknowledgeController {
	
	@Autowired
	private TotalKnowledgeService service;
	
	@Autowired
	private TkReplyService rpService;
	
	@Autowired
	private ScrapService scrapService;
	
	@Autowired
	private EmpService empService;
	
	@Autowired
	private DepService depService;
	
	@Autowired
	private KnowService knowService;
	
	@Autowired
	private PRBService prbService;
	
	@Autowired
	private AnswerService answerService;
	
	@Resource(name = "TkfileUploadPath")
	private String TkfileUploadPath;
	
	@Resource(name = "relegateUploadPath")
	private String relegateUploadPath;
	
	@RequestMapping("/main")
	public ModelAndView search(SearchCriteria cri, ModelAndView mnv, HttpServletRequest req)throws Exception{
		
		String url="totalKnowledge/search.open";
		
		Map<String, Object> dataMap = service.getList2(cri);
		List<KnowVO> knowList = knowService.getAllKnowListViewOrder();
		List<PRBVO> prbList = prbService.selectSearchPrbListViewOrder();
		
		dataMap.put("knowList", knowList);
		dataMap.put("prbList", prbList);
		req.setAttribute("dataMap", dataMap);
		
		mnv.addObject("dataMap",dataMap);
		mnv.setViewName(url);		
		
		return mnv;
		
	}
	
	@RequestMapping("/projectreport")
	public ModelAndView prblist(ModelAndView mnv)throws Exception{
		String url = "projectReport/list.open";
		
		Map<String, Object> dataMap = prbService.getListArr();
		
		mnv.addObject("dataMap",dataMap);
		mnv.setViewName(url);
		
		return mnv;
	}
	@RequestMapping("/prbDetail")
	public ModelAndView prbDetail(ModelAndView mnv, String prCode, @RequestParam(defaultValue="")String from ) throws Exception{
		String url = "projectReport/detail.open";
		
		PRBVO prb = prbService.read(prCode);
		
		String prbFileName = prb.getPrAttachPath();
		String fileName = prbFileName.split(relegateUploadPath + "/")[1];
		
		String empId = prb.getEmpId();
		EmpVO emp = empService.getEmpById(empId);
		String depCode = empService.getEmpById(empId).getDepCode();
		DepVO dep = depService.getDepListByCode(depCode);
		
		mnv.addObject("fileName", fileName);
		mnv.addObject("prb", prb);
		mnv.addObject("emp", emp);
		mnv.addObject("dep", dep);
		mnv.setViewName(url);
		
		return mnv;
	}
	
	@RequestMapping("/prbDisable")
	public String prbDisable(String prCode) throws Exception{
		String url = "projectReport/disable_success";
		
		prbService.disable(prCode);
		scrapService.deleteBdScrap(prCode);
		
		
		return url;
	}	
	@RequestMapping("/searchResult")
	@ResponseBody
	public ModelAndView searchResult(ModelAndView mnv, String arrFromInput) throws Exception{
		String url="totalKnowledge/searchResult.open";
		String[] userArray = arrFromInput.split(",");
		
		Map<String, Object> dataMapArr = service.getListArr(userArray);
		Map<String, Object> dataMapArrKh = knowService.getListArr(userArray);
		Map<String, Object> dataMapArrPrb = prbService.getListArr(userArray);
		
		mnv.addObject("dataMapArr",dataMapArr);
		mnv.addObject("dataMapArrKh",dataMapArrKh);
		mnv.addObject("dataMapArrPrb",dataMapArrPrb);
		mnv.setViewName(url);	
		
		return mnv;
	}
	
	
	@RequestMapping("/searchResultWindow")
	@ResponseBody
	public ModelAndView searchResultWindow(ModelAndView mnv, String arrFromInput) throws Exception{
		String url="totalKnowledge/searchResultWindow.open";
		String[] userArray = arrFromInput.split(",");
		
		Map<String, Object> dataMapArr = service.getListArr(userArray);
		Map<String, Object> dataMapArrKh = knowService.getListArr(userArray);
		Map<String, Object> dataMapArrPrb = prbService.getListArr(userArray);
		
		
		mnv.addObject("dataMapArr",dataMapArr);
		mnv.addObject("dataMapArrKh",dataMapArrKh);
		mnv.addObject("dataMapArrPrb",dataMapArrPrb);
		mnv.setViewName(url);		
		
		return mnv;
	}
	
	
	
	@RequestMapping("/knowDisable")
	public String knowDisable(String khCode)throws Exception{
		String url = "know/knowDisable_success";
		
		knowService.disableKnow(khCode);
		scrapService.deleteBdScrap(khCode);
		
		return url;
	}
	
	
	
	@RequestMapping("/knowModify")
	public String knowModify(KnowModifyCommand km)throws Exception{
		String url = "know/knowModify_success";
		
		KnowVO know =km.toKnow();
		
		knowService.updateKnow(know);
		
		return url;
	}
	
	
	@RequestMapping("/knowModifyForm")
	public ModelAndView knowModifyForm(ModelAndView mnv,String khCode)throws Exception {
		String url = "know/knowModifyForm.open";
		
		
		KnowVO know = knowService.selectInfoKnow(khCode);
		
		mnv.addObject("know",know);
		mnv.setViewName(url);
		return mnv;
	}
	
	
	
	@RequestMapping("/knowRegist")
	public String knowRegist(knowRegistCommand kr)throws Exception{
		String url="know/knowRegist_success.open";
		
		KnowVO know=kr.toKnow();
		
		knowService.insertKnow(know);
		
		return url;
	}
	
	
	
	
	@RequestMapping("/knowDetail")
	public ModelAndView knowDetail(ModelAndView mnv,String khCode)throws Exception{
		String url = "know/Detail.open";
		
		KnowVO know = knowService.selectInfoKnow(khCode);
		
		String Keyword = know.getKhKeyword();
		String[] KeywordArr = null;
		if(Keyword != null) {
			KeywordArr = Keyword.split(",");
		}
		
		
		mnv.addObject("KeywordArr",KeywordArr);
		mnv.addObject("know",know);
		mnv.setViewName(url);
		return mnv;
	}
	
	
	
	
	
	@RequestMapping("/knowRegistForm")
	public String knowRegistForm()throws Exception{
		String url="know/knowRegistForm.open";
		
		
		
		return url;
	}
	
	
	
	@RequestMapping(value="/getKnowList",method= RequestMethod.POST,produces="application/json;charset=utf-8")
	public ResponseEntity<Map<String, Object>> getKnowList(@RequestBody GetKnowListCommand ca, HttpSession session) throws Exception{
		ResponseEntity<Map<String, Object>> entity = null;
		
		KnowVO know = ca.toKnowVO();
		
		Map<String ,Object> dataMap = new HashMap<String, Object>();
		
		if(know.getKhCategory().equals("전체")) {
			
			List<KnowVO> knowList = knowService.getAllKnowList();
			dataMap.put("knowList", knowList);
			
		}else {
			
			List<KnowVO> knowList = knowService.getKnowListByCategory(know.getKhCategory());
			dataMap.put("knowList", knowList);
		}
		
		try {
			entity=new ResponseEntity<Map<String,Object>>(dataMap,HttpStatus.OK);
		} catch (Exception e) {
			entity=new ResponseEntity<Map<String, Object>>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		return entity;
	}
	
	
	
	
	@RequestMapping("/knowhow")
	public ModelAndView KnowMain(ModelAndView mnv)throws Exception{
		String url = "know/main.open";
		
		
		List<KnowVO> knowList = knowService.getAllKnowList();
		
		
		mnv.addObject("knowList",knowList);
		mnv.setViewName(url);
		return mnv;
		
	}
	
	
	@RequestMapping("/externalSearch")
	public String externalSearch()throws Exception{
		
		String url="totalKnowledge/externalSearch.open";
		return url;
		
	}
	
	@RequestMapping("/pds")
	public ModelAndView list(SearchCriteria cri,ModelAndView mnv, HttpServletRequest req)throws Exception{
		String url = "totalKnowledge/list.open";
		
		Map<String, Object> dataMap = service.getList(cri);
		
		
		
		req.setAttribute("dataMap", dataMap);
		
		mnv.addObject("dataMap",dataMap);
		mnv.setViewName(url);
		
		return mnv;
	}
	
	@RequestMapping("/registForm")
	public ModelAndView registForm(ModelAndView mnv) throws Exception{
		String url = "totalKnowledge/registForm.open";
		mnv.setViewName(url);
		
		return mnv;
	}
	
	@RequestMapping("/regist")
	public String paRegist(TkRegistCommand registReq,Model model, HttpServletRequest request)throws Exception {
		String url = "totalKnowledge/regist_success";
		
		TotalKnowledgeVO tk = registReq.toTotalKnowledgeVO();
		List<TkAttachVO> attachList = GetAttachesAsMultipartFiles.tkSave(registReq.getUploadFile(), TkfileUploadPath);
//		pa.setPaTitle((String)request.getAttribute("XSStitle"));
		tk.setAttachList(attachList);
		service.regist(tk);
		
		
		
		return url;		
	}	
	
	@RequestMapping("/detail")
	public ModelAndView detail(ModelAndView mnv, String tkCode, @RequestParam(defaultValue="")String from ) throws Exception{
		String url = "totalKnowledge/detail.open";
		
		TotalKnowledgeVO tk = null;
		if(from != null && from.equals("modify")) {
			tk = service.getTk(tkCode);
		}else {
			tk = service.read(tkCode);
		}
		
		String tkKeyword = tk.getTkKeyword();
		String[] tkKeywordArr = null;
		if(tkKeyword != null) {
			tkKeywordArr = tkKeyword.split(",");
		}
		
		
		List<TkAttachVO> attachList = tk.getAttachList();
		if(attachList != null) {
			for(TkAttachVO attach : attachList) {
				String tkAtName = attach.getTkAtName().split("\\$\\$")[1];
				attach.setTkAtName(tkAtName);
			}
		}
		
		
		int RpCnt = rpService.getTkReplyListCount(tkCode);
		
		String empId = tk.getEmpId();
		EmpVO emp = empService.getEmpById(empId);
		String depCode = empService.getEmpById(empId).getDepCode();
		DepVO dep = depService.getDepListByCode(depCode);
		
		
		mnv.addObject("tk", tk);
		mnv.addObject("emp", emp);
		mnv.addObject("dep", dep);
		mnv.addObject("tkKeywordArr", tkKeywordArr);
		mnv.addObject("RpCnt", RpCnt);
		mnv.setViewName(url);
		
		return mnv;
	}
	
	@RequestMapping("/getTkFile")
	public String getFile(int tkAtNo,Model model) throws Exception {
		String url="downloadFile";
		
		TkAttachVO attach = service.getAttachByTkAtNo(tkAtNo);
		
		model.addAttribute("savedPath", attach.getTkAtPath());
		model.addAttribute("fileName", attach.getTkAtName());
		
		return url;		
	}
	@RequestMapping("/getPrbFile")
	public String getPrbFile(String prCode,Model model) throws Exception {
		String url="downloadFile";
		
		PRBVO prb = prbService.read(prCode);
		String prbName = prb.getPrAttachPath().split(relegateUploadPath)[0];
		model.addAttribute("savedPath", prb.getPrAttachPath());
		model.addAttribute("fileName", prbName);
		
		return url;		
	}
	
	@RequestMapping("/disable")
	public String remove(String tkCode) throws Exception{
		String url = "totalKnowledge/disable_success";
		
		service.disable(tkCode);
		scrapService.deleteBdScrap(tkCode);
		
		return url;
	}
	
	@RequestMapping("/modifyForm")
	public ModelAndView modifyForm(ModelAndView mnv, String tkCode) throws Exception {
		String url = "totalKnowledge/modifyForm.open";

		TotalKnowledgeVO tk = service.getTk(tkCode);

		// 파일명 재정의
		List<TkAttachVO> attachList = tk.getAttachList();
		if (attachList != null) {
			for (TkAttachVO attach : attachList) {
				String tkAtName = attach.getTkAtName().split("\\$\\$")[1];
				attach.setTkAtName(tkAtName);
			}
		}
		
		String tkKeyword = tk.getTkKeyword();
		String[] tkKeywordArr = null;
		if(tkKeyword != null) {
			tkKeywordArr = tkKeyword.split(",");
		}

		mnv.addObject("tk", tk);
		mnv.addObject("tkKeywordArr", tkKeywordArr);
		mnv.setViewName(url);

		return mnv;
	}
	
	@RequestMapping("/modify")
	public ModelAndView modify(TkModifyCommand modifyReq, HttpServletRequest request, ModelAndView mnv) throws Exception {
		
		String url = "totalKnowledge/modify_success";		

		if (modifyReq.getDeleteFile() != null && modifyReq.getDeleteFile().length > 0) {
			for (int tkAtNo : modifyReq.getDeleteFile()) {
				String tkAtName = service.getAttachByTkAtNo(tkAtNo).getTkAtName();
				File deleteFile = new File(TkfileUploadPath, tkAtName);
				service.removeAttachByTkAtNo(tkAtNo); 
				if (deleteFile.exists()) {
					deleteFile.delete(); 
				}
			}
		}

		List<TkAttachVO> attachList = GetAttachesAsMultipartFiles.tkSave(modifyReq.getUploadFile(),TkfileUploadPath);

		TotalKnowledgeVO tk = modifyReq.toTotalKnowledgeVO();
		tk.setAttachList(attachList);

		// DB에 해당 데이터 추가
		service.modify(tk);
		
		mnv.addObject("tk", tk);
		mnv.setViewName(url);
		
		return mnv;
	}
	
	@RequestMapping(value="/InsertScrap", method=RequestMethod.POST, produces="text/plain;charset=utf-8")
	@ResponseBody
	public ResponseEntity<String> InsertScrap(@RequestBody ScrapInsertCommand get) throws Exception{
		ResponseEntity<String> entity = null;
		
		ScrapVO scr = get.toScrapVO();
		
		try { 
			scrapService.insertScrap(scr);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			entity = new ResponseEntity<String>(e.getMessage(),HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return entity;
	}
	
	@RequestMapping(value="/deleteScrap", method=RequestMethod.POST, produces="application/json;charset=utf-8")
	@ResponseBody
	public ResponseEntity<String> deleteScrap(@RequestBody ScrapDeleteCommand get) throws Exception{
		ResponseEntity<String> entity = null;
		
		ScrapVO scr = get.toScrapVO();
		
		try { 
			scrapService.deleteScrap(scr);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			entity = new ResponseEntity<String>(e.getMessage(),HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return entity;
	}
	
	@RequestMapping(value="/scrapCount", method=RequestMethod.POST, produces="application/json;charset=utf-8")
	@ResponseBody
	public ResponseEntity<Integer> scrapCount(@RequestBody ScrapDeleteCommand get) throws Exception{
		ResponseEntity<Integer> entity = null;
		String scUrl = get.getScUrl();
		String empId = get.getEmpId();
		
		ScrapVO scr = get.toScrapVO();
		
		scr.setScUrl(scUrl);
		scr.setEmpId(empId);
		
		try { 
			int count = scrapService.scrapCount(scr);
			entity = new ResponseEntity<Integer>(count, HttpStatus.OK);
		} catch (Exception e) {
			entity = new ResponseEntity<Integer>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return entity;
	}
	@RequestMapping(value="/likeKnow", method=RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<String> likeKnow(@RequestBody LikeCommand get) throws Exception{
		ResponseEntity<String> entity = null;
		LikeVO like = get.toLikeVO();
		String bdCode = like.getBdCode();
		
		String khCode = bdCode;
		try {
			knowService.likeKnow(khCode, like);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(),HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return entity;
	}
	@RequestMapping(value="/likePrb", method=RequestMethod.POST, produces="text/plain;charset=utf-8")
	@ResponseBody
	public ResponseEntity<String> likePrb(@RequestBody LikeCommand get) throws Exception{
		ResponseEntity<String> entity = null;
		
		LikeVO like = get.toLikeVO();
		String bdCode = get.getBdCode();
		try {
			service.like(bdCode, like);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			entity = new ResponseEntity<String>(e.getMessage(),HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		return entity;
	}
	@RequestMapping(value="/like", method=RequestMethod.POST, produces="text/plain;charset=utf-8")
	@ResponseBody
	public ResponseEntity<String> like(@RequestBody LikeCommand get) throws Exception{
		ResponseEntity<String> entity = null;
		
		LikeVO like = get.toLikeVO();
		String bdCode = get.getBdCode();
		try {
			service.like(bdCode, like);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			entity = new ResponseEntity<String>(e.getMessage(),HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return entity;
	}
	
	@RequestMapping(value="/likeCancelKnow", method=RequestMethod.POST, produces="application/json;charset=utf-8")
	@ResponseBody
	public ResponseEntity<String> likeCancelKnow(@RequestBody LikeCommand get) throws Exception{
		ResponseEntity<String> entity = null;
		
		LikeVO like = get.toLikeVO();
		String bdCode = get.getBdCode();
		try { 
			knowService.likeCancelKnow(bdCode, like);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			entity = new ResponseEntity<String>(e.getMessage(),HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return entity;
	}	
	@RequestMapping(value="/likeCancelPrb", method=RequestMethod.POST, produces="application/json;charset=utf-8")
	@ResponseBody
	public ResponseEntity<String> likeCancelPrb(@RequestBody LikeCommand get) throws Exception{
		ResponseEntity<String> entity = null;
		
		LikeVO like = get.toLikeVO();
		String bdCode = get.getBdCode();
		try { 
			service.likeCancel(bdCode, like);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			entity = new ResponseEntity<String>(e.getMessage(),HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return entity;
	}	
	
	@RequestMapping(value="/likeCancel", method=RequestMethod.POST, produces="application/json;charset=utf-8")
	@ResponseBody
	public ResponseEntity<String> likeCancel(@RequestBody LikeCommand get) throws Exception{
		ResponseEntity<String> entity = null;
		
		LikeVO like = get.toLikeVO();
		String bdCode = get.getBdCode();
		try { 
			service.likeCancel(bdCode, like);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			entity = new ResponseEntity<String>(e.getMessage(),HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return entity;
	}	
	
	@RequestMapping(value="/likeCountKnow", method=RequestMethod.POST, produces="application/json;charset=utf-8")
	@ResponseBody
	public ResponseEntity<Integer> likeCountKnow(@RequestBody LikeCommand get) throws Exception{
		ResponseEntity<Integer> entity = null;
		
		String bdCode = get.getBdCode();
		String empId = get.getEmpId();
		
		LikeVO like = get.toLikeVO();
		
		like.setBdCode(bdCode);
		like.setEmpId(empId);
		
		try { 
			int count = service.likeCount(like);
			System.out.println("count : " + count);
			entity = new ResponseEntity<Integer>(count, HttpStatus.OK);
		} catch (Exception e) {
			entity = new ResponseEntity<Integer>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return entity;
	}	
	
	@RequestMapping(value="/likeCountPrb", method=RequestMethod.POST, produces="application/json;charset=utf-8")
	@ResponseBody
	public ResponseEntity<Integer> likeCountPrb(@RequestBody LikeCommand get) throws Exception{
		ResponseEntity<Integer> entity = null;
		
		String bdCode = get.getBdCode();
		String empId = get.getEmpId();
		
		LikeVO like = get.toLikeVO();
		
		like.setBdCode(bdCode);
		like.setEmpId(empId);
		
		try { 
			int count = service.likeCount(like);
			System.out.println("count : " + count);
			entity = new ResponseEntity<Integer>(count, HttpStatus.OK);
		} catch (Exception e) {
			entity = new ResponseEntity<Integer>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return entity;
	}	
	@RequestMapping(value="/likeCount", method=RequestMethod.POST, produces="application/json;charset=utf-8")
	@ResponseBody
	public ResponseEntity<Integer> likeCount(@RequestBody LikeCommand get) throws Exception{
		ResponseEntity<Integer> entity = null;
		
		String bdCode = get.getBdCode();
		String empId = get.getEmpId();
		
		LikeVO like = get.toLikeVO();
		
		like.setBdCode(bdCode);
		like.setEmpId(empId);
		
		try { 
			int count = service.likeCount(like);
			entity = new ResponseEntity<Integer>(count, HttpStatus.OK);
		} catch (Exception e) {
			entity = new ResponseEntity<Integer>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return entity;
	}	
	@RequestMapping(value="/reportKnow", method=RequestMethod.POST, produces="application/json;charset=utf-8")
	@ResponseBody
	public ResponseEntity<String> reportKnow(@RequestBody ReportCommand get) throws Exception{
		ResponseEntity<String> entity = null;
		
		String bdCode = get.getBdCode();
		String empId = get.getEmpId();
		
		ReportVO rep = get.toReportVO();
		
		rep.setBdCode(bdCode);
		rep.setEmpId(empId);
		try {
			knowService.reportKnow(bdCode, rep);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			entity = new ResponseEntity<String>(e.getMessage(),HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return entity;
	}
	@RequestMapping(value="/report", method=RequestMethod.POST, produces="text/plain;charset=utf-8")
	@ResponseBody
	public ResponseEntity<String> report(@RequestBody ReportCommand get) throws Exception{
		ResponseEntity<String> entity = null;
		
		String bdCode = get.getTkCode();
		String empId = get.getEmpId();
		
		ReportVO rep = get.toReportVO();
		String tkCode = get.getTkCode();
		
		rep.setBdCode(bdCode);
		rep.setEmpId(empId);
		try {
			service.report(tkCode, rep);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			entity = new ResponseEntity<String>(e.getMessage(),HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return entity;
	}
	@RequestMapping(value="/reportCancelKnow", method=RequestMethod.POST, produces="application/json;charset=utf-8")
	@ResponseBody
	public ResponseEntity<String> reportCancelKnow(@RequestBody ReportCommand get) throws Exception{
		ResponseEntity<String> entity = null;
		
		ReportVO rep = get.toReportVO();
		String bdCode = get.getBdCode();
		try { 
			knowService.reportCancelKnow(bdCode, rep);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			entity = new ResponseEntity<String>(e.getMessage(),HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return entity;
	}	
	@RequestMapping(value="/reportCancel", method=RequestMethod.POST, produces="application/json;charset=utf-8")
	@ResponseBody
	public ResponseEntity<String> reportCancel(@RequestBody ReportCommand get) throws Exception{
		ResponseEntity<String> entity = null;
		
		ReportVO rep = get.toReportVO();
		String tkCode = get.getTkCode();
		try { 
			service.reportCancel(tkCode, rep);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			entity = new ResponseEntity<String>(e.getMessage(),HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return entity;
	}	
	
	@RequestMapping(value="/reportCountKnow", method=RequestMethod.POST, produces="application/json;charset=utf-8")
	@ResponseBody
	public ResponseEntity<Integer> reportCountKnow(@RequestBody ReportCommand get) throws Exception{
		ResponseEntity<Integer> entity = null;
		
		ReportVO rep = get.toReportVO();
		
		try { 
			int count = service.reportCount(rep);
			entity = new ResponseEntity<Integer>(count, HttpStatus.OK);
		} catch (Exception e) {
			entity = new ResponseEntity<Integer>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return entity;
	}	
	
	@RequestMapping(value="/reportCount", method=RequestMethod.POST, produces="application/json;charset=utf-8")
	@ResponseBody
	public ResponseEntity<Integer> reportCount(@RequestBody ReportCommand get) throws Exception{
		ResponseEntity<Integer> entity = null;
		
		ReportVO rep = get.toReportVO();
		
		try { 
			int count = service.reportCount(rep);
			entity = new ResponseEntity<Integer>(count, HttpStatus.OK);
		} catch (Exception e) {
			entity = new ResponseEntity<Integer>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return entity;
	}	
	@RequestMapping(value="/searchDBPia", method=RequestMethod.GET,  produces = "application/text; charset=utf8")
	@ResponseBody
	public ResponseEntity<String> searchDBPia(String searchall) throws Exception{
		ResponseEntity<String> entity = null;
		String searchResult = JSONParse.jsonCall(searchall);
		
		try { 
			entity = new ResponseEntity<String>(searchResult, HttpStatus.OK);
		} catch (Exception e) {
			entity = new ResponseEntity<String>(e.getMessage(),HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return entity;
	}	
	@RequestMapping(value="/searchDBPiaPage", method=RequestMethod.POST,  produces = "application/text; charset=utf8")
	@ResponseBody
	public ResponseEntity<String> searchDBPiaPage(@RequestBody DBPiaCommand get) throws Exception{
		
		ResponseEntity<String> entity = null;
		String searchall = get.getSearchall();
		int pagenumber = get.getPagenumber();
		String searchResult = JSONParse.jsonCall(searchall, pagenumber);
		
		try { 
			entity = new ResponseEntity<String>(searchResult, HttpStatus.OK);
		} catch (Exception e) {
			entity = new ResponseEntity<String>(e.getMessage(),HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return entity;
	}	
	@RequestMapping(value="/searchDBPiaSort", method=RequestMethod.POST,  produces = "application/text; charset=utf8")
	@ResponseBody
	public ResponseEntity<String> searchDBPiaSort(@RequestBody DBPiaCommand get) throws Exception{
		
		ResponseEntity<String> entity = null;
		String searchall = get.getSearchall();
		String sorttpye = get.getSorttype();
		String searchResult = JSONParse.jsonCall(searchall, sorttpye);
		
		try { 
			entity = new ResponseEntity<String>(searchResult, HttpStatus.OK);
		} catch (Exception e) {
			entity = new ResponseEntity<String>(e.getMessage(),HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return entity;
	}	

}

