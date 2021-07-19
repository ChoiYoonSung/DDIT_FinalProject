package com.spring.controller;

import java.io.File;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.spring.command.SearchCriteria;
import com.spring.command.TkModifyCommand;
import com.spring.command.TkRegistCommand;
import com.spring.dto.TkAttachVO;
import com.spring.dto.TotalKnowledgeVO;
import com.spring.service.TotalKnowledgeService;
import com.spring.utils.GetAttachesAsMultipartFiles;


@Controller
@RequestMapping("/kms")
public class TotalknowledgeController {
	
	@Autowired
	private TotalKnowledgeService service;
	
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
	public ModelAndView detail(ModelAndView mnv, String tkCode, String from) throws Exception{
		String url = "totalKnowledge/detail.open";
		
		TotalKnowledgeVO tk = null;
		if(from != null && from.equals("modify")) {
			tk = service.getTk(tkCode);
		}else {
			tk = service.read(tkCode);
		}
		
		List<TkAttachVO> attachList = tk.getAttachList();
		if(attachList != null) {
			for(TkAttachVO attach : attachList) {
				String tkAtName = attach.getTkAtName().split("\\$\\$")[1];
				attach.setTkAtName(tkAtName);
			}
		}
		
		mnv.addObject("tk", tk);
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

		mnv.addObject("tk", tk);
		mnv.setViewName(url);

		return mnv;
	}
	
	
	public String modifyPOST(TkModifyCommand modifyReq, HttpServletRequest request) throws Exception {
		
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
		tk.setTkTitle((String)request.getAttribute("XSStitle"));
		tk.setAttachList(attachList);

		// DB에 해당 데이터 추가
		service.modify(tk);
		
		return url;
	}
	
}

