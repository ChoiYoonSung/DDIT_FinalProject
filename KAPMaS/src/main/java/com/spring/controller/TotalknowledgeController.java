package com.spring.controller;

import java.io.File;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

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

import com.spring.command.LikeCommand;
import com.spring.command.ReportCommand;
import com.spring.command.ScrapDeleteCommand;
import com.spring.command.ScrapInsertCommand;
import com.spring.command.SearchCriteria;
import com.spring.command.TkModifyCommand;
import com.spring.command.TkRegistCommand;
import com.spring.dto.DepVO;
import com.spring.dto.EmpVO;
import com.spring.dto.LikeVO;
import com.spring.dto.ReportVO;
import com.spring.dto.ScrapVO;
import com.spring.dto.TkAttachVO;
import com.spring.dto.TkReplyVO;
import com.spring.dto.TotalKnowledgeVO;
import com.spring.service.DepService;
import com.spring.service.EmpService;
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
	
	
	@Resource(name = "TkfileUploadPath")
	private String TkfileUploadPath;
	
	@RequestMapping("/main")
	public String search()throws Exception{
		
		String url="totalKnowledge/search.open";
		return url;
		
	}
	
	@RequestMapping("/pds")
	public ModelAndView list(SearchCriteria cri,ModelAndView mnv, HttpServletRequest req)throws Exception{
		String url = "totalKnowledge/list.open";
		
		Map<String, Object> dataMap = service.getList(cri);
		
		List<TotalKnowledgeVO> list = service.getListList();
		
		
		req.setAttribute("list", list);
		
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
	public ModelAndView detail(ModelAndView mnv, String tkCode, String from ) throws Exception{
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
	
	@RequestMapping("/disable")
	public String remove(String tkCode) throws Exception{
		String url = "totalKnowledge/disable_success";
		
		service.disable(tkCode);
		
		
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
		
		ScrapVO scr = get.toScrapVO();
		
		try { 
			int count = scrapService.scrapCount(scr);
			entity = new ResponseEntity<Integer>(count, HttpStatus.OK);
		} catch (Exception e) {
			entity = new ResponseEntity<Integer>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return entity;
	}
	@RequestMapping(value="/like", method=RequestMethod.POST, produces="text/plain;charset=utf-8")
	@ResponseBody
	public ResponseEntity<String> like(@RequestBody LikeCommand get) throws Exception{
		ResponseEntity<String> entity = null;
		
		LikeVO like = get.toLikeVO();
		String tkCode = get.getTkCode();
		try {
			service.like(tkCode, like);
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
		String tkCode = get.getTkCode();
		try { 
			service.likeCancel(tkCode, like);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			entity = new ResponseEntity<String>(e.getMessage(),HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return entity;
	}	
	
	@RequestMapping(value="/likeCount", method=RequestMethod.POST, produces="application/json;charset=utf-8")
	@ResponseBody
	public ResponseEntity<Integer> likeCount(@RequestBody LikeCommand get) throws Exception{
		ResponseEntity<Integer> entity = null;
		
		LikeVO like = get.toLikeVO();
		
		try { 
			int count = service.likeCount(like);
			entity = new ResponseEntity<Integer>(count, HttpStatus.OK);
		} catch (Exception e) {
			entity = new ResponseEntity<Integer>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return entity;
	}	
	@RequestMapping(value="/report", method=RequestMethod.POST, produces="text/plain;charset=utf-8")
	@ResponseBody
	public ResponseEntity<String> report(@RequestBody ReportCommand get) throws Exception{
		ResponseEntity<String> entity = null;
		
		ReportVO rep = get.toReportVO();
		String tkCode = get.getTkCode();
		try {
			service.report(tkCode, rep);
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
	

}

