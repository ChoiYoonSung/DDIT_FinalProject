package com.spring.controller;

import java.io.File;
import java.sql.SQLException;
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
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.spring.command.CopArchiveModifyCommand;
import com.spring.command.CopRegistCommand;
import com.spring.command.GetSmailEmpList;
import com.spring.command.copArchiveRegistCommand;
import com.spring.command.projectShareCommand;
import com.spring.dto.CoPVO;
import com.spring.dto.CopArchiveVO;
import com.spring.dto.CopFamilyDiscussionVO;
import com.spring.dto.CopMemberVO;
import com.spring.dto.DepVO;
import com.spring.dto.EmpVO;
import com.spring.dto.ProVO;
import com.spring.dto.RmailVO;
import com.spring.dto.SmailVO;
import com.spring.dto.caAttachVO;
import com.spring.dto.familyDiscussionContentVO;
import com.spring.dto.shareProjectVO;
import com.spring.service.CoPService;
import com.spring.service.DepService;
import com.spring.service.ProService;
import com.spring.service.RmailService;
import com.spring.service.SmailService;
import com.spring.utils.GetAttachesAsMultipartFiles;

@Controller
@RequestMapping(value = "/cop/detail")
public class CoPDetailController {

	@Autowired
	private RmailService rmailService;

	@Autowired
	private SmailService smailService;

	@Autowired
	private CoPService copService;

	@Autowired
	private DepService depService;

	@Autowired
	private ProService proService;

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

	@RequestMapping(value = "/coppds/{copCode}", method = RequestMethod.GET)
	public ModelAndView coppds(ModelAndView mnv, @PathVariable String copCode) throws SQLException {
		String url = "cop_detail/coppds.open";
		List<CopArchiveVO> archiveList = copService.getCopArchiveList(copCode);

		mnv.addObject("copCode", copCode);
		mnv.addObject("archiveList", archiveList);
		mnv.setViewName(url);
		return mnv;
	}

	@RequestMapping(value = "/shareProject/{copCode}", method = RequestMethod.GET)
	public ModelAndView shareProject(HttpSession session, ModelAndView mnv, @PathVariable String copCode)
			throws SQLException {
		String url = "cop_detail/shareProject.open";

		EmpVO emp = (EmpVO) session.getAttribute("loginUser");
		String loginUserId = emp.getEmpId();

		List<ProVO> projectList = copService.getMyProjectList(loginUserId);
		List<EmpVO> familyList = copService.getCopFamilyList(copCode);

		mnv.addObject("copCode", copCode);
		mnv.addObject("loginUser", loginUserId);
		mnv.addObject("projectList", projectList);
		mnv.addObject("familyList", familyList);

		mnv.setViewName(url);
		return mnv;
	}

	@RequestMapping(value = "/copManage/{copCode}", method = RequestMethod.GET)
	public ModelAndView copManage(ModelAndView mnv, @PathVariable String copCode, HttpSession session)
			throws SQLException {
		String url = "cop_detail/copManage.open";

		List<EmpVO> familyList = copService.getCopFamilyList(copCode);
		List<EmpVO> getSignUpRequestMember = copService.getSignUpRequestMember(copCode);
		EmpVO emp = (EmpVO) session.getAttribute("loginUser");
		String loginUserId = emp.getEmpId();
		
		mnv.addObject("copCode", copCode);
		mnv.addObject("loginUser", loginUserId);
		mnv.addObject("familyList", familyList);
		mnv.addObject("requestMember", getSignUpRequestMember);
		mnv.setViewName(url);
		return mnv;
	}

	@RequestMapping(value = "/coppds/pdsRegistForm/{copCode}", method = RequestMethod.GET)
	public ModelAndView registArchive(ModelAndView mnv, @PathVariable String copCode) throws SQLException {
		String url = "cop_detail/pdsRegistForm.open";
		
		mnv.addObject("copCode", copCode);
		
		mnv.setViewName(url);
		return mnv;
	}

	@RequestMapping(value = "/pdsRegist", method = RequestMethod.POST, produces = "text/plain;charset=utf-8")
	public String caRegist(copArchiveRegistCommand cArc, Model model, HttpServletRequest request, HttpSession session)
			throws Exception {
		String url = "cop_detail/ca_regist_success.open";

		EmpVO emp = (EmpVO) session.getAttribute("loginUser");
		String empId = emp.getEmpId();
		String empName = emp.getEmpName();
		cArc.setEmpId(empId);
		cArc.setEmpName(empName);

		CopArchiveVO ca = cArc.toArchiveVO();
		List<caAttachVO> attachList = GetAttachesAsMultipartFiles.caSave(cArc.getUploadFile(), CAfileUploadPath);

		ca.setAttachList(attachList);

		copService.registCA(ca);

		model.addAttribute("copCode", cArc.getCopCode());
		return url;
	}

	@RequestMapping(value = "/coppds/pdsDetail/{caCode}", method = RequestMethod.GET)
	public ModelAndView archiveDetail(ModelAndView mnv, @PathVariable String caCode, HttpSession session)
			throws SQLException {
		String url = "cop_detail/pdsDetail.open";

		EmpVO emp = (EmpVO) session.getAttribute("loginUser");
		String empId = emp.getEmpId();

		CopArchiveVO ca = copService.getArchiveDetail(caCode);
		copService.increaseArchiveViewCnt(caCode);

		String copCode = ca.getCopCode();
		Map<String, Object> dataMap = copService.getCopInfo(copCode);
		CoPVO copInfo = (CoPVO) dataMap.get("copInfo");
		String copOwnerId = copInfo.getCopOwnerId();
		
		List<caAttachVO> attachList = ca.getAttachList();
		if (attachList != null) {
			for (caAttachVO attach : attachList) {
				String fileName = attach.getCaAtName().split("\\$\\$")[1];
				attach.setCaAtName(fileName);
			}
		}
		mnv.addObject("copOwnerId", copOwnerId);
		mnv.addObject("loginUser", empId);
		mnv.addObject("ca", ca);
		mnv.addObject("copCode", copCode);

		mnv.setViewName(url);
		return mnv;
	}

	@RequestMapping(value = "/coppds/pdsDetail/pdsModifyForm/{caCode}", method = RequestMethod.GET)
	public ModelAndView pdsModifyForm(ModelAndView mnv, @PathVariable String caCode) throws SQLException {
		String url = "cop_detail/pdsModifyForm.open";

		CopArchiveVO ca = copService.getArchiveDetail(caCode);

		String copCode = ca.getCopCode();

		List<caAttachVO> attachList = ca.getAttachList();
		if (attachList != null) {
			for (caAttachVO attach : attachList) {
				String fileName = attach.getCaAtName().split("\\$\\$")[1];
				attach.setCaAtName(fileName);
			}
		}
		mnv.addObject("ca", ca);
		mnv.addObject("copCode", copCode);
		mnv.setViewName(url);
		return mnv;
	}

	@RequestMapping("/pdsModify")
	public ModelAndView paModify(CopArchiveModifyCommand modifyReq, HttpServletRequest request, ModelAndView mnv)
			throws Exception {

		String url = "cop_detail/pds_modify_success.open";

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
		List<caAttachVO> attachList = GetAttachesAsMultipartFiles.caSave(modifyReq.getUploadFile(), CAfileUploadPath);

		CopArchiveVO ca = modifyReq.toArchiveVO();
		ca.setAttachList(attachList);

		// DB에 해당 데이터 추가
		copService.modifyCa(ca);

		System.out.println(ca.getCaCode());
		System.out.println(ca.getCopCode());
		;
		System.out.println(modifyReq.getCopCode());
		mnv.addObject("copArchive", ca);

		mnv.setViewName(url);

		return mnv;
	}

	@RequestMapping("/coppds/pdsDetail/pdsRemove/{caCode}")
	public String remove(@PathVariable String caCode, Model model) throws Exception {

		String url = "cop_detail/pds_remove_success.open";

		CopArchiveVO cop = copService.getArchiveDetail(caCode);

//		// 첨부파일 삭제
		String copCode = cop.getCopCode();
//		List<caAttachVO> attachList = cop.getAttachList();
//		if (attachList != null) {
//			for (caAttachVO attach : attachList) {
//				File target = new File(attach.getCaAtPath(), attach.getCaAtName());
//				if (target.exists()) {
//					target.delete();
//				}
//			}
//		}
//		
		model.addAttribute("copCode", copCode);
//
//		// DB삭제
		copService.archiveRemove(caCode);

		return url;
	}

	@RequestMapping("/getCAFile")
	public String getFile(int caatno, Model model) throws Exception {
		String url = "downloadFile";

		caAttachVO attach = copService.getAttachByCaAtNo(caatno);

		model.addAttribute("savedPath", attach.getCaAtPath());
		model.addAttribute("fileName", attach.getCaAtName());

		return url;
	}

	@RequestMapping("/shareProject/projectShare")
	public String projectShare(projectShareCommand shareCommand, HttpSession session, String copCode) throws Exception {
		String url = "cop_detail/projectShare_success.open";

		EmpVO emp = (EmpVO) session.getAttribute("loginUser");
		shareProjectVO sp = shareCommand.toShareProjectVO();
		String plName = sp.getProjectPL();
		String loginName = emp.getEmpName();
		
		if (plName.equals(loginName)) {
			System.out.println(sp.getProjectName());
			try {
				copService.projectDirectShare(sp);
			} catch (Exception e) {
				e.printStackTrace();
				url = "cop_detail/duplicateMember.open";
			}
		} else {
			copService.projectConfirmRequest(sp);
			url = "cop_detail/sendShareRequest.open";
		}
		
		session.setAttribute("copCode", copCode);

		return url;
	}

	@RequestMapping(value = "copManage/approveRequest", method = RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<String> approveRequest(CopMemberVO copMemberVO) throws Exception {

		ResponseEntity<String> entity = null;

		try {
			int cnt = copService.approveCopSignUpRequest(copMemberVO);

			if (cnt != 0) {
				entity = new ResponseEntity<String>("success", HttpStatus.OK);
				Map<String, Object> dataMap = copService.getCopInfo(copMemberVO.getCopCode());
				CoPVO copInfo = (CoPVO) dataMap.get("copInfo");
				String copName = copInfo.getCopName();
				copMemberVO.setTitle(copName + "가입 신청이 승인되었습니다");
				copMemberVO.setContent(copName + "가입 신청이 승인되었습니다. COP이용이 가능합니다.");
				copService.sendMail(copMemberVO);
			} else {
				entity = new ResponseEntity<String>("error", HttpStatus.OK);
			}
		} catch (Exception e) {
			entity = new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
		}

		return entity;
	}

	@RequestMapping(value = "copManage/rejectRequest", method = RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<String> rejectRequest(CopMemberVO copMemberVO) throws Exception {

		ResponseEntity<String> entity = null;

		try {
			int cnt = copService.rejectCopSignUpRequest(copMemberVO);

			if (cnt != 0) {
				entity = new ResponseEntity<String>("success", HttpStatus.OK);
				Map<String, Object> dataMap = copService.getCopInfo(copMemberVO.getCopCode());
				CoPVO copInfo = (CoPVO) dataMap.get("copInfo");
				String copName = copInfo.getCopName();
				copMemberVO.setTitle(copName + "가입 신청이 반려되었습니다");
				copMemberVO.setContent(copName + "가입 신청이 반려되었습니다. 소유자에게 문의 바랍니다.");
				copService.sendMail(copMemberVO);
			} else {
				entity = new ResponseEntity<String>("error", HttpStatus.OK);
			}
		} catch (Exception e) {
			entity = new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
		}

		return entity;
	}

	@RequestMapping(value = "copManage/sendMailToFamily")
	public String sendMailToFamily(String empId, Model model, HttpSession session, String copCode) {
		String url = "cop_detail/sendMail.open";
		EmpVO emp = (EmpVO) session.getAttribute("loginUser");

		model.addAttribute("loginUser", emp.getEmpId());
		model.addAttribute("empId", empId);
		model.addAttribute("copCode", copCode);

		return url;
	}

	@RequestMapping(value = "copManage/sendMail")
	public String sendMail(GetSmailEmpList sm, HttpSession session, String copCode) throws SQLException {
		String url = "cop_detail/sendMail_success.open";

		SmailVO smail = sm.toSmailVO();
		RmailVO rmail = sm.toRmailVO();

		EmpVO emp = (EmpVO) session.getAttribute("loginUser");

		smail.setEmpId(emp.getEmpId());
		smail.setSmEnabled(1);
		rmail.setEmpId(smail.getSmReceiver());
		rmail.setRmSender(emp.getEmpId());
		rmail.setRmEnabled(1);

		smailService.sendMail(smail);
		rmailService.receiveMail(rmail);
		
		session.setAttribute("copCode", copCode);

		return url;
	}

	@RequestMapping(value = "copManage/exileMemberForm")
	public String exileMemberForm(String empId, Model model, HttpSession session, String copCode) {
		String url = "cop_detail/exileMemberForm.open";
		EmpVO emp = (EmpVO) session.getAttribute("loginUser");

		model.addAttribute("loginUser", emp.getEmpId());
		model.addAttribute("empId", empId);
		model.addAttribute("copCode", copCode);

		return url;
	}

	@RequestMapping(value = "copManage/exileFamily")
	public String exileFamily(GetSmailEmpList sm, HttpSession session, String copCode) throws SQLException {
		String url = "cop_detail/exileMember_success.open";

		SmailVO smail = sm.toSmailVO();
		RmailVO rmail = sm.toRmailVO();

		EmpVO emp = (EmpVO) session.getAttribute("loginUser");

		smail.setEmpId(emp.getEmpId());
		smail.setSmEnabled(1);
		rmail.setEmpId(smail.getSmReceiver());
		rmail.setRmSender(emp.getEmpId());
		rmail.setRmEnabled(1);

		smailService.sendMail(smail);
		rmailService.receiveMail(rmail);

		CopMemberVO copMember = new CopMemberVO();
		copMember.setCopCode(copCode);
		copMember.setEmpId(smail.getSmReceiver());

		copService.rejectCopSignUpRequest(copMember);
		
		session.setAttribute("copCode", copCode);

		return url;
	}

	@RequestMapping(value = "copManage/getCopInfoForm")
	public String getCopInfoForm(Model model, String copCode) throws SQLException {
		String url = "cop_detail/getCopInfoForm.open";

		Map<String, Object> dataMap = copService.getCopInfo(copCode);
		CoPVO copInfo = (CoPVO) dataMap.get("copInfo");
		model.addAttribute("copInfo", copInfo);

		return url;
	}

	@RequestMapping(value = "copManage/infoModifyForm")
	public String copInfoModifyForm(Model model, String copCode) throws SQLException {
		String url = "cop_detail/copInfoModifyForm.open";

		Map<String, Object> dataMap = copService.getCopInfo(copCode);
		CoPVO copInfo = (CoPVO) dataMap.get("copInfo");
		model.addAttribute("copCode", copCode);
		model.addAttribute("copInfo", copInfo);

		return url;
	}

	@RequestMapping(value = "copManage/modifyCop", method = RequestMethod.POST)
	public String createSuccessCop(HttpSession session, CopRegistCommand copReq) throws SQLException {
		String url = "cop_detail/copModify_success.open";

		CoPVO cop = copReq.toCopVO();
		String copCode = cop.getCopCode();
		try {
			copService.modifyCopInfo(cop);
		} catch (Exception e) {
			e.printStackTrace();
			url = "cop_detail/copModify_fail.open";
		}
		
		session.setAttribute("copCode", copCode);

		return url;
	}

	@RequestMapping(value = "copManage/copInviteForm")
	public ModelAndView copInviteForm(ModelAndView mnv, HttpSession session, String copCode) throws SQLException {
		String url = "cop_detail/copInvite.open";

		List<DepVO> depList = depService.getDepList();

		Map<String, Object> dataMap = copService.getCopInfo(copCode);
		CoPVO cop = (CoPVO) dataMap.get("copInfo");
		System.out.println(copCode);
		mnv.addObject("copCode", copCode);
		mnv.addObject("cop", cop);
		mnv.addObject("depList", depList);
		mnv.setViewName(url);

		return mnv;
	}

	@RequestMapping(value = "discussion/{copCode}", method = RequestMethod.GET)
	public ModelAndView discussion(ModelAndView mnv, HttpSession session, @PathVariable String copCode)
			throws SQLException {
		String url = "cop_detail/discussion.open";
		EmpVO emp = (EmpVO) session.getAttribute("loginUser");

		CopFamilyDiscussionVO fdisVO = new CopFamilyDiscussionVO();
		fdisVO.setCopCode(copCode);
		fdisVO.setFdisMaker(emp.getEmpName());

		List<CopFamilyDiscussionVO> copFdisList = copService.getCopFdisList(copCode);
		List<CopFamilyDiscussionVO> ownCopFdisList = copService.getIcreatedFdisList(fdisVO);

		mnv.addObject("copFdisList", copFdisList);
		mnv.addObject("ownCopFdisList", ownCopFdisList);

		mnv.setViewName(url);
		return mnv;
	}

	@RequestMapping(value = "discussion/createFdis", method = RequestMethod.POST)
	public String createFdis(HttpSession session, Model model, CopFamilyDiscussionVO fdisVO) {
		String url = "cop_detail/createFdis_success.open";

		EmpVO emp = (EmpVO) session.getAttribute("loginUser");
		fdisVO.setFdisMaker(emp.getEmpName());
		try {
			copService.createFdis(fdisVO);
		} catch (Exception e) {
			e.printStackTrace();
			url = "cop_detail/createFdis_fail.open";
		}

		model.addAttribute("copCode", fdisVO.getCopCode());

		return url;
	}

	@RequestMapping(value = "discussion/fdisDetail/{fdisCode}")
	public String fdisDetail(@PathVariable String fdisCode, Model model, HttpSession session) throws SQLException {
		String url = "cop_detail/fdisDetail.open";

		EmpVO emp = (EmpVO) session.getAttribute("loginUser");
		List<familyDiscussionContentVO> fdisList = copService.getFdisContentListByFdisCode(fdisCode);
		CopFamilyDiscussionVO fdisInfo = copService.getFdisInfoByFdisCode(fdisCode);

		EmpVO EmpId = copService.getEmpIDByFdisCode(fdisCode);
		
		String copCode = fdisInfo.getCopCode();
		Map<String, Object> dataMap = copService.getCopInfo(copCode);
		CoPVO copInfo = (CoPVO) dataMap.get("copInfo");
		String copOwnerid = copInfo.getCopOwnerId();
		
		model.addAttribute("copOwnerid", copOwnerid);
		model.addAttribute("fdisCode", fdisCode);
		model.addAttribute("empid", EmpId.getEmpId());
		model.addAttribute("fdisInfo", fdisInfo);
		model.addAttribute("loginUser", emp.getEmpId());
		model.addAttribute("fdisList", fdisList);

		return url;
	}

	@RequestMapping(value = "discussion/registDiscussionContent", method = RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<String> registDiscussionContent(familyDiscussionContentVO fdisVO, HttpSession session)
			throws Exception {

		ResponseEntity<String> entity = null;

		EmpVO emp = (EmpVO) session.getAttribute("loginUser");

		fdisVO.setFdisCtWriter(emp.getEmpId());
		fdisVO.setFdisCtWriterName(emp.getEmpName());
		try {
			int cnt = copService.registDiscussionContent(fdisVO);

			if (cnt != 0) {
				entity = new ResponseEntity<String>("success", HttpStatus.OK);
			} else {
				entity = new ResponseEntity<String>("error", HttpStatus.OK);
			}
		} catch (Exception e) {
			entity = new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
		}

		return entity;
	}

	@RequestMapping(value = "discussion/modifyDiscussionInfo", method = RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<String> modifyDiscussionInfo(CopFamilyDiscussionVO fdisVO, HttpSession session)
			throws Exception {

		ResponseEntity<String> entity = null;

		CopFamilyDiscussionVO fdisInfo = copService.getFdisInfoByFdisCode(fdisVO.getFdisCode());

		String copCode = fdisInfo.getCopCode();
		try {
			int cnt = copService.modifyFdisInfo(fdisVO);

			if (cnt != 0) {
				entity = new ResponseEntity<String>(copCode, HttpStatus.OK);
			} else {
				entity = new ResponseEntity<String>("error", HttpStatus.OK);
			}
		} catch (Exception e) {
			entity = new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
		}

		return entity;
	}

	@RequestMapping(value = "discussion/deleteDiscussion", method = RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<String> deleteDiscussion(CopFamilyDiscussionVO fdisVO, HttpSession session) throws Exception {

		ResponseEntity<String> entity = null;

		CopFamilyDiscussionVO fdisInfo = copService.getFdisInfoByFdisCode(fdisVO.getFdisCode());
		String copCode = fdisInfo.getCopCode();

		try {
			int contentCnt = copService.deleteDiscussionContent(fdisVO.getFdisCode());
			int discussionCnt = copService.deleteDiscussion(fdisVO.getFdisCode());

			if (discussionCnt != 0) {
				entity = new ResponseEntity<String>(copCode, HttpStatus.OK);
			} else {
				entity = new ResponseEntity<String>("error", HttpStatus.OK);
			}
		} catch (Exception e) {
			entity = new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
		}

		return entity;
	}

	@RequestMapping(value = "acceptInvite", method = RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<String> acceptCopInvite(String copCode, HttpSession session) throws Exception {

		ResponseEntity<String> entity = null;

		EmpVO emp = (EmpVO) session.getAttribute("loginUser");

		CoPVO param = new CoPVO();
		param.setCopUserId(emp.getEmpId());
		param.setCopCode(copCode);

		int cnt = copService.joinCopToInvite(param);

		try {
			if (cnt != 0) {
				entity = new ResponseEntity<String>("success", HttpStatus.OK);
			} else {
				entity = new ResponseEntity<String>("error", HttpStatus.OK);
			}
		} catch (Exception e) {
			entity = new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
		}

		return entity;
	}

}