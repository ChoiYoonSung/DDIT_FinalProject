package com.spring.controller;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.spring.dto.QnaVO;
import com.spring.dto.QreplyVO;
import com.spring.command.GetSmailEmpList;
import com.spring.command.NoticeModifyFormCommand;
import com.spring.command.NoticeRegistFormCommand;
import com.spring.command.PageMaker;
import com.spring.command.PiReplyRegistCommand;
import com.spring.command.SearchCriteria;
import com.spring.command.SendAllEmpCommand;
import com.spring.command.SystemModifyCommand;
import com.spring.command.SystemRegistCommand;
import com.spring.dto.EmpVO;
import com.spring.dto.NoticeVO;
import com.spring.dto.PIReplyVO;
import com.spring.dto.ReportVO;
import com.spring.dto.RmailVO;
import com.spring.dto.SmailVO;
import com.spring.dto.SystemVO;
import com.spring.service.AdminService;
import com.spring.service.QnaService;
import com.spring.service.QnaServiceImpl;
import com.spring.service.QreplyService;
import com.spring.service.EmpService;
import com.spring.service.NoticeService;
import com.spring.service.PiReplyService;
import com.spring.service.RmailService;
import com.spring.service.SmailService;
import com.spring.service.SystemService;

@Controller
@RequestMapping("/admin")
public class AdminController {
	
	@Autowired
	private AdminService adminService;
	
	@Autowired
	private SystemService systemService;
	
	@Autowired
	private QnaService qnaService;
	
	@Autowired
	private QreplyService qreplyService;
	
	@Autowired
	private NoticeService noticeService;
	
	@Autowired
	private EmpService empService;
	
	@Autowired
	private RmailService rmailService;
	
	@Autowired
	private SmailService smailService;
	
	@RequestMapping(value="/regist",method=RequestMethod.POST,produces = "text/plain;charset=utf-8")
	public String regist(SendAllEmpCommand sam,HttpSession session,HttpServletRequest request)throws Exception{
		String url = "mypage/send_success.open";
		
		SmailVO smail = sam.toSmailVO();
		RmailVO rmail = sam.toRmailVO();
		
		EmpVO emp=(EmpVO)session.getAttribute("loginUser");
		
		smail.setEmpId(emp.getEmpId());
		smail.setSmEnabled(1);
		rmail.setRmEnabled(1);
		rmail.setRmSender(emp.getEmpId());
		
		List<EmpVO> empList = empService.getListEmps();
		
		for(EmpVO List : empList) {
			rmail.setEmpId(List.getEmpId());
			rmailService.receiveMail(rmail);
		}
		
		smail.setSmReceiver(emp.getEmpId());
		smailService.sendMail(smail);
		
		return url;
	}
	
	@RequestMapping("/SmailDetail")
	public ModelAndView SmailDetail(String smCode ,ModelAndView mnv)throws Exception{
		String url= "admin/SmailDetail.open";
		
		SmailVO smail = smailService.selectSmailInfo(smCode);
		EmpVO emp = empService.getEmpById(smail.getSmReceiver());
		
		mnv.addObject("emp",emp);
		mnv.addObject("smail",smail);
		mnv.setViewName(url);
		return mnv;
		
	}
	
	
	@RequestMapping("/sendmail")
	public ModelAndView sendMailList(ModelAndView mnv,HttpSession session) throws Exception{
		String url="admin/sendMailList.open";
		
		EmpVO emp=(EmpVO)session.getAttribute("loginUser");
		
		
		List<SmailVO> smailList= smailService.selectSMailListById(emp.getEmpId());
		
		
		mnv.addObject("smailList",smailList);
		mnv.setViewName(url);
		
		return mnv;
		
		
	}
	
	@RequestMapping("/SmailRegistForm")
	public ModelAndView SmailRegistForm(ModelAndView mnv) throws SQLException{
		String url = "admin/SmailRegistForm.open";
		
		
		mnv.setViewName(url);
		return mnv;
	}
	
	
	
	@RequestMapping("/empManage")
	public ModelAndView empManage(ModelAndView mnv) throws SQLException{
		String url = "admin/empManage.open";
		
		
		List<EmpVO> empList = empService.getListEmps();
		
		
		mnv.addObject("empList",empList);
		mnv.setViewName(url);
		return mnv;
	}
	
	
	
	
	@RequestMapping("/systemDelete")
	public String systemDelete(String sgCode) throws SQLException{
		String url = "admin/systemDelete_success.open";
		systemService.deleteSystem(sgCode);
		
		return url;
	}
	
	@RequestMapping("/systemModify")
	public ModelAndView systemModify(ModelAndView mnv,SystemModifyCommand smc) throws SQLException{
		String url = "admin/systemModify_success.open";
		
		SystemVO system = smc.toSystemVO();
		
		systemService.updateSystem(system);
		
		
		SystemVO system2 = systemService.getSystemInfo(system.getSgCode());
		
		mnv.addObject("system2",system2);
		mnv.setViewName(url);
		return mnv;
	}
	
	
	
	@RequestMapping("/systemModifyForm/{sgCode}")
	public ModelAndView systemModifyForm(@PathVariable String sgCode,ModelAndView mnv) throws SQLException{
		String url = "admin/systemModifyForm.open";

		SystemVO system = systemService.getSystemInfo(sgCode);
		
		mnv.addObject("system",system);
		mnv.setViewName(url);
		return mnv;
	}
	
	
	@RequestMapping("/systemDetail/{sgCode}")
	public ModelAndView systemDetail(@PathVariable String sgCode,ModelAndView mnv) throws SQLException{
		String url = "admin/systemDetail.open";

		
		SystemVO system = systemService.getSystemInfo(sgCode);
		
		mnv.addObject("system",system);
		mnv.setViewName(url);
		return mnv;
	}
	
	
	@RequestMapping("/systemRegist")
	public String systemRegist(SystemRegistCommand src,HttpSession session) throws SQLException{
		String url = "admin/systemRegist_success.open";
		
		SystemVO system = src.toSystemVO();
		
		systemService.insertSystem(system);
		
		return url;
	}
	
	@RequestMapping("/systemRegistForm")
	public String systemRegistForm() throws SQLException{
		String url = "admin/systemRegistForm.open";
		
		
		
		return url;
	}
	
	@RequestMapping("/guideManage")
	public ModelAndView guideManage(ModelAndView mnv) throws SQLException{
		String url = "admin/guideManage.open";
		
		List<SystemVO> systemList = systemService.getSystemList();
		
		mnv.addObject("systemList", systemList);
		mnv.setViewName(url);
		return mnv;
	}
	
	
	@RequestMapping("/noticeDelete")
	public String noticeDelete(String noticeNo) throws SQLException{
		String url = "admin/noticeDelete_success.open";
		
		noticeService.removeNotice(noticeNo);
		
		
		return url;
	}
	
	@RequestMapping("/noticeModify")
	public ModelAndView noticeModify(ModelAndView mnv,NoticeModifyFormCommand nmfc) throws SQLException{
		String url = "admin/noticeModify_success.open";
		
		NoticeVO notice = nmfc.toNoticeVO();
		
		noticeService.modifyNotice(notice);
		
		NoticeVO notice2 = noticeService.getNoticeByNno(notice.getNoticeNo());
		
		mnv.addObject("notice2",notice2);
		mnv.setViewName(url);
		return mnv;
	}
	
	
	@RequestMapping("/noticeModifyForm/{noticeNo}")
	public ModelAndView noticeModifyForm(@PathVariable String noticeNo,ModelAndView mnv) throws SQLException{
		String url = "admin/noticeModifyForm.open";

		NoticeVO notice = noticeService.getNoticeByNno(noticeNo);
		
		mnv.addObject("notice",notice);
		mnv.setViewName(url);
		return mnv;
	}
	
	@RequestMapping("/noticeRegist")
	public String noticeRegist(NoticeRegistFormCommand nrfc) throws SQLException{
		String url = "admin/noticeRegist_success.open";
		
		NoticeVO notice = nrfc.toNoticeVO();
		
		noticeService.registNotice(notice);
		
		return url;
	}
	
	@RequestMapping("/noticeRegistForm")
	public String noticeRegistForm() throws SQLException{
		String url = "admin/noticeRegistForm.open";
		
		
		
		return url;
	}
	
	
	@RequestMapping("/noticeDetail/{noticeNo}")
	public ModelAndView noticeDetail(@PathVariable String noticeNo,ModelAndView mnv) throws SQLException{
		String url = "admin/noticeDetail.open";

		NoticeVO notice = noticeService.getNoticeByNno(noticeNo);
		
		mnv.addObject("notice",notice);
		mnv.setViewName(url);
		return mnv;
	}
	
	@RequestMapping("/noticeManage")
	public ModelAndView noticeManage(ModelAndView mnv) throws SQLException{
		String url = "admin/noticeManage.open";
		
		List<NoticeVO> noticeList = noticeService.getNoticeList();
		
		mnv.addObject("noticeList", noticeList);
		mnv.setViewName(url);
		return mnv;
	}
	
	
	// 프로젝트 전체 통계 조회
	@RequestMapping("/getProjectStatistics")
	@ResponseBody
	public List<HashMap<String, Object>> getProjectStatistics() throws SQLException {
		return adminService.getProjectStatistics();
	}
	
	// 프로젝트 등록 월별 조회
	@RequestMapping("/getProjectByMonth")
	@ResponseBody
	public List<HashMap<String, Object>> getProjectByMonth() throws SQLException {
		return adminService.getProjectByMonth();
	}
		
	// 지식관리 등록 월별 조회
	@RequestMapping("/getKMSByMonth")
	@ResponseBody
	public List<HashMap<String, Object>> getKMSByMonth() throws SQLException {
		return adminService.getKMSByMonth();
	}

	// 관리자 QNA
	@RequestMapping("/qnaManage")
	public ModelAndView QNAManage(ModelAndView mnv) throws SQLException {
		String url = "admin/qnaList.open";

		List<QnaVO> qnaList = qnaService.selectQnaList();
		
		mnv.addObject("qnaList", qnaList);
		mnv.setViewName(url);
		return mnv;
	}
	
	// 관리자 QNA 상세페이지
	@RequestMapping("/qnaDetail")
	public ModelAndView QNADetail(ModelAndView mnv,String qnaNo) throws SQLException {
		String url = "admin/qnaDetail.open";

		QnaVO qd = qnaService.selectQnaInfo(qnaNo);
		List<QreplyVO> qr = qreplyService.selectQreList(qnaNo);
		
		mnv.addObject("qd", qd);
		mnv.addObject("qr", qr);
		mnv.setViewName(url);
		return mnv;
	}
	
	
	// 관리자 QNA 수정폼
	@RequestMapping("/qnaModify")
	public ModelAndView QNAModify(ModelAndView mnv,String qnaNo) throws SQLException {
		String url = "admin/qnaModifyForm.open";
		QnaVO qd = qnaService.selectQnaInfo(qnaNo);
		List<QreplyVO> qr = qreplyService.selectQreList(qnaNo);
		mnv.addObject("qd", qd);
		mnv.addObject("qr", qr);
		mnv.setViewName(url);
		return mnv;
	}
	
		
		
	@RequestMapping(value = "/qnaRegister", method = RequestMethod.POST)
	public ResponseEntity<String> qnaRegister(@RequestParam("qnaNo") String qnaNo, @RequestParam("rpContent") String rpContent, @RequestParam("rpWriter") String rpWriter){
		ResponseEntity<String> entity = null;
		
		try {
			QreplyVO qre = new QreplyVO();
			qre.setQnaNo(qnaNo);
			qre.setQnaRpContent(rpContent);
			qre.setQnaRpWriter(rpWriter);
			qreplyService.insertQre(qre);
			entity = new ResponseEntity<String>("성공,",HttpStatus.OK);
		} catch (SQLException e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(),	HttpStatus.INTERNAL_SERVER_ERROR);
		}

		return entity;
	}	
	@RequestMapping(value = "/qnaModifyGO", method = RequestMethod.POST)
	public ResponseEntity<String> qnaModifyGO(@RequestParam("qnaNo") String qnaNo, @RequestParam("rpContent") String rpContent, @RequestParam("rpWriter") String rpWriter){
		ResponseEntity<String> entity = null;
		
		try {
			QreplyVO qre = new QreplyVO();
			qre.setQnaNo(qnaNo);
			qre.setQnaRpContent(rpContent);
			qre.setQnaRpWriter(rpWriter);
			qreplyService.updateQre(qre);
			entity = new ResponseEntity<String>("성공,",HttpStatus.OK);
		} catch (SQLException e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(),	HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		return entity;
	}	
	
	// 관리자 QNA 답변 삭제
	@RequestMapping("/qnareplyDelete")
	public ModelAndView qnareplyDelete(ModelAndView mnv,String qnaNo) throws SQLException {
		String url = "admin/qnaDelete_success.open";

		qreplyService.deleteQre(qnaNo);
		mnv.setViewName(url);
		return mnv;
	}
	
	// 관리자 QNA 삭제	
	@RequestMapping("/qnaDelete")
	public ModelAndView qnaDelete(ModelAndView mnv,String qnaNo) throws SQLException {
		String url = "admin/qnaDelete_success.open";

		qnaService.deleteQna(qnaNo);
		mnv.setViewName(url);
		return mnv;
	}
	
	
	@RequestMapping("/reportManage")
	public ModelAndView reportManage(ModelAndView mnv) throws SQLException{
		String url = "admin/reportManage.open";
		
		List<ReportVO> reportList = adminService.selectReportList();
		for(int i = 0; i < reportList.size(); i++) {
			String name = "";
			switch(reportList.get(i).getRpBd()) {
			case "kno": 
			case "KNO": name="노하우";  break;
			case "tkb":
			case "TKB": name="기타자료"; break;
			default : name="기타자료"; break;
			}
			reportList.get(i).setRpBdName(name);
		}
		
		mnv.addObject("reportList",reportList);
		mnv.setViewName(url);
		
		return mnv;
	}
	
	@RequestMapping("/reportDetail/{bdCode}")
	public ModelAndView reportDetail(@PathVariable String bdCode,ModelAndView mnv) throws SQLException{
		String url = "admin/reportDetail.open";
		
		ReportVO rep = new ReportVO();
		rep.setBdCode(bdCode);
		rep.setRpBd(bdCode.substring(0,3));
		
		ReportVO report = adminService.getReportByBdCode(rep);
		String name = "";
		switch(report.getRpBd()) {
			case "kno": 
			case "KNO": name="노하우";  break;
			case "tkb":
			case "TKB": name="기타자료"; break;
			default : name="기타자료"; break;
		}
		report.setRpBdName(name);
		
		mnv.addObject("report",report);
		
		mnv.setViewName(url);
		return mnv;
	}
	
	@RequestMapping("/reportReset/{bdCode}")
	public String reportReset(@PathVariable String bdCode) throws SQLException{
		String url = "admin/reportReset_success.open";
		
		ReportVO rep = new ReportVO();
		rep.setBdCode(bdCode);
		rep.setRpBd(bdCode.substring(0,3));
		try {
			adminService.resetReport(rep);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		return url;
	}
	
	@RequestMapping("/reportDelete/{bdCode}")
	public String reportDelete(@PathVariable String bdCode) throws SQLException{
		String url = "admin/reportDelete_success.open";
		
		ReportVO rep = new ReportVO();
		rep.setBdCode(bdCode);
		rep.setRpBd(bdCode.substring(0,3));
		try {
			adminService.deleteReport(rep);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		return url;
	}
	
}
