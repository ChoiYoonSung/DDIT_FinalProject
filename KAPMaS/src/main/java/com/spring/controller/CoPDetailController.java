package com.spring.controller;

import java.io.File;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.spring.command.CopArchiveModifyCommand;
import com.spring.command.copArchiveRegistCommand;
import com.spring.dto.CoPVO;
import com.spring.dto.CopArchiveVO;
import com.spring.dto.CopFamilyDiscussionVO;
import com.spring.dto.EmpVO;
import com.spring.dto.caAttachVO;
import com.spring.service.CoPService;
import com.spring.utils.GetAttachesAsMultipartFiles;

@Controller
@RequestMapping(value = "/cop/detail")
public class CoPDetailController {

	@Autowired
	private CoPService copService;

	@Resource(name = "CAfileUploadPath")
	private String CAfileUploadPath;

	@RequestMapping(value = "/main/{copCode}", method = RequestMethod.GET)
	public ModelAndView detail(ModelAndView mnv, @PathVariable String copCode) throws SQLException {
		String url = "cop_detail/main.open";

		Map<String, Object> dataMap = copService.getCopInfo(copCode);

		CoPVO copInfo = (CoPVO) dataMap.get("copInfo");

		List<CopArchiveVO> ca = copService.getCopArchiveList(copCode);
		List<CopFamilyDiscussionVO> cfd = copService.getCopDiscussionList(copCode);

		mnv.addObject("copInfo", copInfo);
		mnv.addObject("discussionList", cfd);
		mnv.addObject("archiveList", ca);

		mnv.setViewName(url);
		return mnv;
	}

	@RequestMapping(value = "/discussion/{copCode}", method = RequestMethod.GET)
	public ModelAndView discussion(ModelAndView mnv, @PathVariable String copCode) throws SQLException {
		String url = "cop_detail/discussion.open";

		mnv.setViewName(url);
		return mnv;
	}

	@RequestMapping(value = "/coppds/{copCode}", method = RequestMethod.GET)
	public ModelAndView coppds(ModelAndView mnv, @PathVariable String copCode) throws SQLException {
		String url = "cop_detail/coppds.open";
		List<CopArchiveVO> archiveList = copService.getCopArchiveList(copCode);

		mnv.addObject("archiveList", archiveList);
		mnv.setViewName(url);
		return mnv;
	}

	@RequestMapping(value = "/shareProject/{copCode}", method = RequestMethod.GET)
	public ModelAndView shareProject(ModelAndView mnv, @PathVariable String copCode) throws SQLException {
		String url = "cop_detail/shareProject.open";

		mnv.setViewName(url);
		return mnv;
	}

	@RequestMapping(value = "/copManage/{copCode}", method = RequestMethod.GET)
	public ModelAndView copManage(ModelAndView mnv, @PathVariable String copCode) throws SQLException {
		String url = "cop_detail/copManage.open";

		mnv.setViewName(url);
		return mnv;
	}

	@RequestMapping(value = "/coppds/pdsRegistForm/{copCode}", method = RequestMethod.GET)
	public ModelAndView registArchive(ModelAndView mnv, @PathVariable String copCode) throws SQLException {
		String url = "cop_detail/pdsRegistForm.open";

		mnv.setViewName(url);
		return mnv;
	}

	@RequestMapping(value = "/pdsRegist", method = RequestMethod.POST, produces = "text/plain;charset=utf-8")
	public String caRegist(copArchiveRegistCommand cArc, Model model, HttpServletRequest request, HttpSession session)
			throws Exception {
		String url = "cop_detail/ca_regist_success";

		EmpVO emp = (EmpVO) session.getAttribute("loginUser");
		String empId = emp.getEmpId();
		String empName = emp.getEmpName();
		cArc.setEmpId(empId);
		cArc.setEmpName(empName);

		CopArchiveVO ca = cArc.toArchiveVO();
		List<caAttachVO> attachList = GetAttachesAsMultipartFiles.caSave(cArc.getUploadFile(), CAfileUploadPath);

		ca.setAttachList(attachList);

		copService.registCA(ca);

		return url;
	}

	@RequestMapping(value = "/coppds/pdsDetail/{caCode}", method = RequestMethod.GET)
	public ModelAndView archiveDetail(ModelAndView mnv, @PathVariable String caCode) throws SQLException {
		String url = "cop_detail/pdsDetail.open";

		CopArchiveVO ca = copService.getArchiveDetail(caCode);
		
		List<caAttachVO> attachList = ca.getAttachList();
		if (attachList != null) {
			for (caAttachVO attach : attachList) {
				String fileName = attach.getCaAtName().split("\\$\\$")[1];
				attach.setCaAtName(fileName);
			}
		}
		mnv.addObject("ca", ca);

		mnv.setViewName(url);
		return mnv;
	}
	
	@RequestMapping(value = "/coppds/pdsDetail/pdsModifyForm/{caCode}", method = RequestMethod.GET)
	public ModelAndView pdsModifyForm(ModelAndView mnv, @PathVariable String caCode) throws SQLException {
		String url = "cop_detail/pdsModifyForm.open";
		
		CopArchiveVO ca = copService.getArchiveDetail(caCode);
		
		List<caAttachVO> attachList = ca.getAttachList();
		if (attachList != null) {
			for (caAttachVO attach : attachList) {
				String fileName = attach.getCaAtName().split("\\$\\$")[1];
				attach.setCaAtName(fileName);
			}
		}
		mnv.addObject("ca", ca);
		
		mnv.setViewName(url);
		return mnv;
	}
	
	@RequestMapping("/pdsModify")
	public ModelAndView paModify(CopArchiveModifyCommand modifyReq, HttpServletRequest request, ModelAndView mnv) throws Exception {
		
		String url = "cop_detail/pds_modify_success";		
		// 삭제된 파일 삭제
		if (modifyReq.getDeleteFile() != null && modifyReq.getDeleteFile().length > 0) {
			for (int caatno : modifyReq.getDeleteFile()) {
				String fileName = copService.getAttachByCaAtNo(caatno).getCaAtName();
				System.out.println("fileName : " + fileName);
				File deleteFile = new File(CAfileUploadPath, fileName);
				copService.removeAttachByCaAtNo(caatno); // DB 삭제
				if (deleteFile.exists()) {
					deleteFile.delete(); // File 삭제
				}
			}
		}

		// 추가 혹은 변경된 파일 저장
		List<caAttachVO> attachList = GetAttachesAsMultipartFiles.caSave(modifyReq.getUploadFile(),CAfileUploadPath);

		CopArchiveVO ca = modifyReq.toArchiveVO();
		ca.setAttachList(attachList);

		// DB에 해당 데이터 추가
		copService.modifyCa(ca);
		
		mnv.addObject("copArchive", ca);
		mnv.setViewName(url);
		
		return mnv;
	}
	@RequestMapping("/coppds/pdsDetail/pdsRemove/{caCode}")
	public String remove(@PathVariable String caCode) throws Exception {

		String url="cop_detail/pds_remove_success";
		
		//첨부파일 삭제
		List<caAttachVO> attachList = copService.getArchiveDetail(caCode).getAttachList();				
		if (attachList != null) {
			for (caAttachVO attach : attachList) {
				File target = new File(attach.getCaAtPath(), attach.getCaAtName());
				if (target.exists()) {
					target.delete();
				}
			}
		}
		
		//DB삭제
		copService.archiveRemove(caCode);

		return url;
	}
}
