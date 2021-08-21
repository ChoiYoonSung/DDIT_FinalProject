package com.spring.controller;

import java.io.PrintWriter;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.spring.command.SearchCriteriaById;
import com.spring.command.SearchCriteriaByPro;
import com.spring.dto.BoardSelectVO;
import com.spring.dto.DocumentVO;
import com.spring.dto.EmpVO;
import com.spring.dto.JobVO;
import com.spring.dto.KnowVO;
import com.spring.dto.MenuVO;
import com.spring.dto.NoticeVO;
import com.spring.dto.ProPjmVO;
import com.spring.dto.ProVO;
import com.spring.dto.ReportVO;
import com.spring.dto.RmailVO;
import com.spring.service.AdminService;
import com.spring.service.CoPService;
import com.spring.service.DocumentService;
import com.spring.service.EmpService;
import com.spring.service.JobService;
import com.spring.service.KnowService;
import com.spring.service.MenuService;
import com.spring.service.NoticeService;
import com.spring.service.ProService;
import com.spring.service.RmailService;

@Controller
public class CommonController {
	
	@Autowired
	private EmpService empService;
	
	@Autowired
	private MenuService menuService;
	
	@Autowired
	private ProService proService;
	
	@Autowired
	private CoPService copService;
	
	@Autowired
	private NoticeService noticeService;
	
	@Autowired
	private JobService jobService;
	
	@Autowired
	private RmailService rmailService;
	
	@Autowired
	private AdminService adminService;
	
	@Autowired
	private DocumentService documentService;
	
	@Autowired
	private KnowService knowService; 
	
	@RequestMapping(value="/common/loginForm",method=RequestMethod.GET)
	public String loginForm(@RequestParam(defaultValue="")String error,HttpServletResponse response)throws Exception{
		String url="common/login";
	
		if(error.equals("1")) {
			response.setStatus(302);
		}
		
		return url;
	}
	
	
	//security에서 필터로 이제 로그인을 잡기 떄문에 주석처리를 해주었다(interceptor자체 기능을 못한다)
/*	@RequestMapping(value="/common/login",method=RequestMethod.POST)
	public String loginPost(LoginCommand loginReq,HttpServletRequest request,
										RedirectAttributes rttr)throws Exception{
		
		String url="redirect:/index.do";

		HttpSession session = request.getSession();
		
		try {
			empService.login(loginReq.getId(),loginReq.getPwd());
			session.setAttribute("loginUser", empService.getMember(loginReq.getId()));
			session.setMaxInactiveInterval(6*60);
		} catch (SQLException e) {
			e.printStackTrace();
			throw e;
		} catch (NotFoundIDException| InvalidPasswordException e) {			
			url="redirect:/common/login.do";
			rttr.addFlashAttribute("msg",e.getMessage());
		} 
		
		return url;
	}*/
	

	@RequestMapping("/index")
	public ModelAndView indexPage(ModelAndView mnv,
								@RequestParam(defaultValue="M000000")String mCode, HttpSession session) 
									throws Exception{
		String url="common/indexPage.page";
		EmpVO emp = (EmpVO)session.getAttribute("loginUser");
		String auth = emp.getEmpAuth();
		if(auth.equals("관리자")) {
			url = "admin/main.admin";
			try {
				List<ReportVO> reportList = adminService.selectReportList();
				for(int i = 0; i < reportList.size(); i++) {
					String bd = reportList.get(i).getRpBd();
					String name = "";
					if(bd.equals("KNO") || bd.equals("kno")) {
						name="노하우";
					}
					if(bd.equals("TKB") || bd.equals("tkb")) {
						name="기타지식";
					}
					reportList.get(i).setRpBdName(name);
				}
				
				List<BoardSelectVO> boardList = adminService.getBoardOrderByRegDate();
				for(int i = 0; i < boardList.size(); i++) {
					String bd = boardList.get(i).getBdType();
					String name = "";
					if(bd.equals("KNO") || bd.equals("kno")) {
						name="노하우";
					}
					if(bd.equals("TKB") || bd.equals("tkb")) {
						name="기타지식";
					}
					if(bd.equals("PRR") || bd.equals("prr")) {
						name="프로젝트 자료";
					}
					boardList.get(i).setBdName(name);;
				}
				
				Map<String, Integer> boardCnt = adminService.getBoardCount();
				
				
				mnv.addObject("boardCnt",boardCnt);
				mnv.addObject("reportList",reportList);
				mnv.addObject("boardList",boardList);
			} catch (Exception e) {
				e.printStackTrace();
				throw e;
			}
		}else {
			try {
				List<MenuVO> menuList = menuService.getMainMenuList();			
				MenuVO menu = menuService.getMenuByMcode(mCode);
				
				mnv.addObject("menuList",menuList);
				mnv.addObject("menu",menu);
			} catch (SQLException e) {			
				e.printStackTrace();
				throw e;
			}
		}
		mnv.setViewName(url);
		return mnv;
	}
	

	
	@RequestMapping("/main")
	public ModelAndView main(HttpSession session, ModelAndView mnv, SearchCriteriaById cri, SearchCriteriaByPro cri2) throws Exception {
		String url="common/main.open";
		
		EmpVO emp = (EmpVO)session.getAttribute("loginUser");
		String empId=emp.getEmpId();
		
		cri.setEmpId(emp.getEmpId());
		
		List<ProPjmVO> propjm = proService.getListProById(empId);
		
		Map<String, Object> joinCopMap = copService.getJoiningCopList(cri);
		
		List<JobVO> jobList = jobService.getJobListById(empId);
		
		List<KnowVO> knowList = knowService.getKnowListById(empId);
		
		for (int i = 0; i < jobList.size(); i++) {
			for (int j = 0; j < propjm.size(); j++) {
				if(jobList.get(i).getpCode().equals(propjm.get(j).getpCode())) {
					jobList.get(i).setpName(propjm.get(j).getpName());
				}
			}
		}
		
		SearchCriteriaByPro sp = cri2.toSearchCriteriaByPro();
		sp.setEmpId(empId);
		sp.setOrderType("p");
		
		List<ProVO> doPro = proService.getListDoProById(sp);
		
		mnv.addObject("propjm",propjm);
		mnv.addObject("project", doPro);
		mnv.addObject("knowList",knowList);
		mnv.addObject("cop", joinCopMap.get("joinCopVO"));
		mnv.addObject("copJoinCnt", joinCopMap.get("joinCopCnt"));
		
		mnv.addObject("job",jobList);
		
		mnv.setViewName(url);
		
		return mnv;
	}
	
	
	@RequestMapping("/getMcode")
	@ResponseBody //view단에 던지지말고 바로 리스폰스로 쏴라라는 뜻이다
	public ResponseEntity<MenuVO> getMcode(String mName)throws Exception{

		
		ResponseEntity<MenuVO> entity = null;
		
		try {
			
			MenuVO menu = menuService.getMenuByMname(mName);
			
			entity = new ResponseEntity<MenuVO>(menu,HttpStatus.OK);
			
		} catch (SQLException e) {
			entity = new ResponseEntity<MenuVO>(HttpStatus.INTERNAL_SERVER_ERROR);
			
			
		}
		
		return entity;
		
	}
	
	
	
	@RequestMapping("/subMenu")
	@ResponseBody
	public ResponseEntity<List<MenuVO>> SubMenu(String mCode)throws Exception{
		
		ResponseEntity<List<MenuVO>> entity = null;
		
		try {
			
			List<MenuVO> menuList = menuService.getSubMenuList(mCode);
			
			entity = new ResponseEntity<List<MenuVO>>(menuList,HttpStatus.OK);
			
		} catch (SQLException e) {
			entity = new ResponseEntity<List<MenuVO>>(HttpStatus.INTERNAL_SERVER_ERROR);
			
		}
		
		return entity;
		
	}
	
	@RequestMapping("/thirdSubMenu")
	@ResponseBody
	public ResponseEntity<List<MenuVO>> ThirdSubMenu(String mCode) throws Exception{
		ResponseEntity<List<MenuVO>> entity = null;
		try {
			List<MenuVO> thirdSubMenuList = menuService.getThirdSubMenuList(mCode);
			
			entity = new ResponseEntity<List<MenuVO>>(thirdSubMenuList,HttpStatus.OK);
		} catch (SQLException e) {
			entity = new ResponseEntity<List<MenuVO>>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return entity;
	}
	
	
	@RequestMapping(value="/common/logout",method=RequestMethod.GET)
	public String logout(HttpSession session)throws Exception{
		
		String url="redirect:/";
		
		session.invalidate();
		
		return url;
	}
	
	
	
	@RequestMapping("/security/accessDenied")
	public String accessDenied(HttpServletResponse response) {
		String url="security/accessDenied";
		
		response.setStatus(302);
		
		return url;
		
	}
	
	
	@RequestMapping("common/loginTimeOut")
	public String loginTimeOut(HttpServletRequest request,HttpServletResponse response)throws Exception{
		
		String url = "common/loginTimeOut.open";
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		
		return url;
	}
	
	
	@RequestMapping("common/loginExpired")
	public void loginExpired(HttpServletRequest request,HttpServletResponse response)throws Exception{
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		out.println("<script>");
		out.println("alert('중복로그인이 확인되었습니다\\n다시 로그인하면 다른 장치에서 로그인은 취소됩니다!');");
		out.println("location.href='"+request.getContextPath()+"';");
		out.println("</script>");
		out.close();
		
	}
	
	
	// 쪽지 알림
	@RequestMapping("common/notification")
	@ResponseBody
	public String getNotification(HttpSession session, HttpServletRequest request) throws SQLException, ParseException {
		HttpSession ss = request.getSession();
		
		EmpVO emp = (EmpVO)session.getAttribute("loginUser");
		Date finalDate = null;
		Date sessionDate = null;
		SimpleDateFormat f = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		
		if(emp != null) {
			RmailVO lastRMail = rmailService.selectLastRMailById(emp.getEmpId());
			String receivedate = lastRMail.getRmReceivedate();
			
			// 세션 값 가져오기
			String sessionTime = (String) ss.getAttribute("receiveDate");
			
			if(sessionTime == null) {
				sessionTime = receivedate;
			}
			
			finalDate = f.parse(receivedate);
			sessionDate = f.parse(sessionTime);
			
		   
		   if(finalDate.compareTo(sessionDate) > 0) { // 새로운 쪽지 도착
			   ss.setAttribute("receiveDate", receivedate); // 세션 값 변경
			   return "new";
		   }else {
			   ss.setAttribute("receiveDate", sessionTime);
		       return "same";
		   }
		}else {
			return "same";
		}
		
	}
}

















