package com.spring.controller;

import java.io.PrintWriter;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
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
import com.spring.dto.EmpVO;
import com.spring.dto.MenuVO;
import com.spring.dto.NoticeVO;
import com.spring.dto.ProPjmVO;
import com.spring.dto.RmailVO;
import com.spring.service.CoPService;
import com.spring.service.EmpService;
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
	private RmailService rmailService;
	
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
								@RequestParam(defaultValue="M000000")String mCode) 
									throws Exception{
		String url="common/indexPage.page";

		try {
			List<MenuVO> menuList = menuService.getMainMenuList();			
			MenuVO menu = menuService.getMenuByMcode(mCode);
			
			mnv.addObject("menuList",menuList);
			mnv.addObject("menu",menu);
		} catch (SQLException e) {			
			e.printStackTrace();
			throw e;
		}
		mnv.setViewName(url);
		return mnv;
	}
	

	
	@RequestMapping("/main")
	public ModelAndView main(HttpSession session, ModelAndView mnv, SearchCriteriaById cri) throws Exception {
		String url="common/main.open";
		
		EmpVO emp = (EmpVO)session.getAttribute("loginUser");
		String empId=emp.getEmpId();
		
		Date now = new Date(System.currentTimeMillis());
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd"); 
		
		cri.setEmpId(emp.getEmpId());
		
		List<ProPjmVO> propjm = proService.getListProById(empId);
		Map<String, Object> joinCopMap = copService.getJoiningCopList(cri);
		List<NoticeVO> notice = noticeService.getNoticeList();
		
		mnv.addObject("now",sdf.format(now));
		
		mnv.addObject("propjm",propjm);
		mnv.addObject("cop", joinCopMap.get("joinCopVO"));
		mnv.addObject("copJoinCnt", joinCopMap.get("joinCopCnt"));
		mnv.addObject("notice",notice);
		
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
	public void loginTimeOut(HttpServletRequest request,HttpServletResponse response)throws Exception{
		
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		out.println("<script>");
		out.println("alert('세션이 만료되었습니다\\n다시 로그인하세요!');");
		out.println("location.href='"+request.getContextPath()+"';");
		out.println("</script>");
		out.close();
		
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

















