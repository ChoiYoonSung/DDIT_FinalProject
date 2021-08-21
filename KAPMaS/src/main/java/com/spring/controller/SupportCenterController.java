package com.spring.controller;

import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import com.spring.dto.EmpVO;
import com.spring.dto.QnaVO;
import com.spring.dto.NoticeVO;
import com.spring.dto.QreplyVO;
import com.spring.dto.SystemVO;
import com.spring.service.NoticeService;
import com.spring.service.QnaService;
import com.spring.service.QreplyService;
import com.spring.service.SystemService;

@Controller
@RequestMapping("/center")
public class SupportCenterController {

	@Autowired
	private QnaService qnaService;

	@Autowired
	private NoticeService noticeService;

	@Autowired
	private QreplyService qReplyService;

	@Autowired
	private SystemService systemService;
	
	@RequestMapping("/guide")
	public ModelAndView guide(ModelAndView mnv) throws Exception {
		String url = "supportCenter/guide.open";
		
		String project = "프로젝트";
		String common = "공통";
		String knowLedge = "지식 관리";
		
		List<SystemVO> projectGuideList = systemService.getGuideList(project);
		List<SystemVO> commonGuideList = systemService.getGuideList(common);
		List<SystemVO> knowledgeGuideList = systemService.getGuideList(knowLedge);
		
		mnv.addObject("commonGuideList", commonGuideList);
		mnv.addObject("projectGuideList", projectGuideList);
		mnv.addObject("knowledgeGuideList", knowledgeGuideList);
		
		mnv.setViewName(url);

		return mnv;
	}

	@RequestMapping("/qna")
	public ModelAndView qna(ModelAndView mnv) throws Exception {
		String url = "supportCenter/qna.open";

		List<QnaVO> qnaList = qnaService.selectQnaList();

		mnv.addObject("qnaList", qnaList);
		mnv.setViewName(url);

		return mnv;
	}

	@RequestMapping("/notice")
	public ModelAndView notice(ModelAndView mnv) throws Exception {
		String url = "supportCenter/notice.open";

		List<NoticeVO> noticeList = noticeService.getNoticeList();

		mnv.addObject("noticeList", noticeList);
		mnv.setViewName(url);

		return mnv;
	}

	@RequestMapping("/qna/{qnaNo}")
	public ModelAndView qnaDetail(ModelAndView mnv, @PathVariable String qnaNo, HttpSession session) throws Exception {
		String url = "supportCenter/qnaDetail.open";

		EmpVO emp = (EmpVO) session.getAttribute("loginUser");
		String loginUser = emp.getEmpId();
		
		QnaVO qnaInfo = qnaService.selectQnaInfo(qnaNo);
		List<QreplyVO> qr = qReplyService.selectQreList(qnaNo);

		qnaService.increaseQnaCnt(qnaNo);

		System.out.println(qr);
		int nullCheck = 0;
		if (!qr.isEmpty()) {
			nullCheck = 1;
		}

		mnv.addObject("nullCheck", nullCheck);
		mnv.addObject("qnaInfo", qnaInfo);
		mnv.addObject("qr", qr);
		mnv.addObject("loginUser", loginUser);

		mnv.setViewName(url);
		return mnv;
	}

	@RequestMapping("/qna/RegistForm")
	public String goQnaRegistForm() {
		String url = "supportCenter/qnaRegistForm.open";
		return url;
	}

	@RequestMapping("qna/qnaRegister")
	@ResponseBody
	public ResponseEntity<String> profilePicture(String qnaTitle, String qnaContent, HttpSession session)
			throws Exception {
		ResponseEntity<String> entity = null;

		String qnaNo = qnaService.getQnaSequenceNo();

		EmpVO emp = (EmpVO) session.getAttribute("loginUser");

		QnaVO qnaInfo = new QnaVO();
		qnaInfo.setQnaNo(qnaNo);
		qnaInfo.setQnaTitle(qnaTitle);
		qnaInfo.setQnaContent(qnaContent);
		qnaInfo.setEmpId(emp.getEmpId());

		HttpStatus status = null;
		String result = "";
		try {
			qnaService.insertQna(qnaInfo);
			result = qnaNo;
			status = HttpStatus.OK;
		} catch (Exception e) {
			e.printStackTrace();
			result = "등록 실패";
			status = HttpStatus.BAD_REQUEST;
		}

		entity = new ResponseEntity<String>(result, status);

		return entity;
	}

	@RequestMapping("qnaModify")
	public ModelAndView modifyForm(ModelAndView mnv, String qnaNo) throws SQLException {
		String url = "supportCenter/qnaModifyForm.open";
		System.out.println(qnaNo);

		QnaVO qnaInfo = qnaService.selectQnaInfo(qnaNo);

		mnv.addObject("qnaInfo", qnaInfo);

		mnv.setViewName(url);
		return mnv;
	}

	@RequestMapping("qna/qnaModify")
	@ResponseBody
	public ResponseEntity<String> qnaModify(String qnaTitle, String qnaContent, String qnaNo) throws Exception {
		ResponseEntity<String> entity = null;

		QnaVO qnaInfo = new QnaVO();
		qnaInfo.setQnaNo(qnaNo);
		qnaInfo.setQnaTitle(qnaTitle);
		qnaInfo.setQnaContent(qnaContent);

		HttpStatus status = null;
		String result = "";
		try {
			qnaService.updateQna(qnaInfo);
			result = qnaNo;
			status = HttpStatus.OK;
		} catch (Exception e) {
			e.printStackTrace();
			result = "수정 실패";
			status = HttpStatus.BAD_REQUEST;
		}

		entity = new ResponseEntity<String>(result, status);

		return entity;
	}

	@RequestMapping("/noticeDetail")
	public ModelAndView noticeDetail(ModelAndView mnv, String noticeNo, @RequestParam(defaultValue = "") String from)
			throws Exception {
		String url = "supportCenter/noticeDetail.open";

		NoticeVO notice = null;
		notice = noticeService.getNoticeByNno(noticeNo);

		mnv.addObject("notice", notice);
		mnv.setViewName(url);

		return mnv;
	}

	@RequestMapping("qna/qnaDelete")
	@ResponseBody
	public ResponseEntity<String> qnaDelete(String qnaNo) throws Exception {
		ResponseEntity<String> entity = null;

		HttpStatus status = null;
		String result = "";
		try {
			qnaService.deleteQna(qnaNo);
			result = "삭제 성공";
			status = HttpStatus.OK;
		} catch (Exception e) {
			e.printStackTrace();
			result = "삭제 실패";
			status = HttpStatus.BAD_REQUEST;
		}

		entity = new ResponseEntity<String>(result, status);

		return entity;
	}
}
