package com.spring.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.common.io.Files;
import com.spring.chat.ChatRoom;
import com.spring.chat.ChatRoomForm;
import com.spring.chat.ChatRoomRepository;
import com.spring.command.GetChattingFile;
import com.spring.command.GetCodeCommand;
import com.spring.command.GetJobInfo;
import com.spring.command.JobModifyCommand;
import com.spring.command.JobRegistCommand;
import com.spring.command.PageMaker;
import com.spring.command.PiReplyModifyCommand;
import com.spring.command.PiReplyRegistCommand;
import com.spring.command.ProModifyCommand;
import com.spring.command.ProPAModifyCommand;
import com.spring.command.ProPARegistCommand;
import com.spring.command.ProPIModifyCommand;
import com.spring.command.ProPIRegistCommand;
import com.spring.command.ProRegistCommand;
import com.spring.command.ProjecterCome;
import com.spring.command.RelegateCommand;
import com.spring.command.SearchCriteria;
import com.spring.command.SearchCriteriaByPA;
import com.spring.command.SearchCriteriaByPro;
import com.spring.command.UpdatePjmAu;
import com.spring.command.deleteMEM;
import com.spring.command.proDeleteMem;
import com.spring.dto.DailyReportVO;
import com.spring.dto.DepVO;
import com.spring.dto.EmpVO;
import com.spring.dto.JobVO;
import com.spring.dto.MeetingVO;
import com.spring.dto.PAAttachVO;
import com.spring.dto.PAVO;
import com.spring.dto.PIReplyVO;
import com.spring.dto.PIVO;
import com.spring.dto.PRBVO;
import com.spring.dto.PjmVO;
import com.spring.dto.ProEmpVO;
import com.spring.dto.ProLogVO;
import com.spring.dto.ProVO;
import com.spring.dto.RankVO;
import com.spring.dto.RelegateVO;
import com.spring.dto.ScrapVO;
import com.spring.dto.WeeklyReportVO;
import com.spring.service.DepService;
import com.spring.service.EmpService;
import com.spring.service.JobService;
import com.spring.service.MeetingService;
import com.spring.service.PRBService;
import com.spring.service.PiReplyService;
import com.spring.service.ProService;
import com.spring.service.RankService;
import com.spring.service.RmailService;
import com.spring.service.ScrapService;
import com.spring.utils.GetAttachesAsMultipartFiles;

@Controller
@RequestMapping("/project")
public class ProjectController {
	
	@Autowired
	private ProService proService;
	
	@Autowired
	private DepService depService;
	
	@Autowired
	private RankService rankService;
	
	@Autowired
	private RmailService rmailService;
	
	@Autowired
	private JobService jobService;
	
	@Autowired
	private EmpService empService;
	
	@Autowired
	private MeetingService meetingService;
	
	@Autowired
	private PiReplyService piReplyService;
	
	@Autowired
	private ScrapService scrapService;
	
	@Autowired
	private PRBService prbService;
	
	@Resource(name = "PAfileUploadPath")
	private String PAfileUploadPath;
	
	@Resource(name = "relegateUploadPath")
	private String relegateUploadPath;

	@Resource(name = "MeetingUploadPath")
	private String MeetingUploadPath;
	
	@Autowired
	private ChatRoomRepository chatRoomRepository;
	
	
	@RequestMapping(value="/deleteMem",method=RequestMethod.POST,produces="text/plain;charset=utf-8")
	@ResponseBody
	public ResponseEntity<String> deleteMem(@RequestBody deleteMEM dm)throws Exception{
		ResponseEntity<String>  entity=null;
		
		JobVO job = dm.toJobVO();
		
		jobService.updateEmp(job);
		
		
		try {
			entity = new ResponseEntity<String>("역할 부여",HttpStatus.OK);
			
		} catch (Exception e) {
			entity = new ResponseEntity<String>(e.getMessage(),HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		return  entity;
		
	}
	
	
	@RequestMapping("/deleteM")
	public ModelAndView deleteM(ModelAndView mnv,HttpSession session,String empId) throws SQLException {
		String url = "project/deleteMemberForm.open";
		
		String pCode = (String)session.getAttribute("pCode");
		
		JobVO job = new JobVO();
		
		job.setEmpId(empId);
		job.setpCode(pCode);
		
		List<JobVO> jobList = jobService.getProJobListById2(job);
		List<ProEmpVO> pjmList = proService.selectProMemberList(pCode);
		
		mnv.addObject("pjmList", pjmList);
		mnv.addObject("empId", empId);
		mnv.addObject("jobList", jobList);
		mnv.setViewName(url);
		return mnv;
	}
	
	@RequestMapping("/meetingDown")
	public String meetingDown(String mtCode,Model model) throws Exception {
		String url="downloadFile";
		
		MeetingVO meeting = meetingService.selectMeetingByCode(mtCode);
		
		model.addAttribute("savedPath", meeting.getMtAtPath());
		model.addAttribute("fileName", meeting.getMtAtName());
		
		return url;		
	}
	
	
	@RequestMapping(value="/proDeleteMem",method=RequestMethod.POST,produces="text/plain;charset=utf-8")
	@ResponseBody
	public ResponseEntity<String> proDeleteMem(@RequestBody proDeleteMem pdm ,HttpSession session)throws Exception{
		ResponseEntity<String>  entity=null;
		PjmVO pjm = pdm.toPjmVO();
		
		
		proService.deleteMember(pjm.getEmpId());
		
		try {
			
			entity = new ResponseEntity<String>("완료",HttpStatus.OK);
			
		} catch (Exception e) {
			entity = new ResponseEntity<String>(e.getMessage(),HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		return  entity;
		
	}
	
	
	@RequestMapping(value="/insertMeeting",method=RequestMethod.POST,produces="text/plain;charset=utf-8")
	@ResponseBody
	public ResponseEntity<String> insertMeeting(@RequestBody GetChattingFile Gcf,HttpSession session)throws Exception{
		ResponseEntity<String>  entity=null;
		
		
		String pCode = (String)session.getAttribute("pCode");
		EmpVO emp = (EmpVO)session.getAttribute("loginUser");
		String empId=emp.getEmpId();
		
		
		MeetingVO meeting = Gcf.toMeetingVO();
		meeting.setEmpId(empId);
		meeting.setpCode(pCode);
		
		String home = System.getProperty("user.home");
		File file = new File(home+"/Downloads/" + meeting.getMtAtName()); 
		
		File file2 = new File(MeetingUploadPath+"/"+meeting.getMtAtName());
		
		
		try {
			   /*FileUtils.moveFile(file, file2);*/
			   Files.move(file, file2);
			}
			catch (Exception e) {
			   e.printStackTrace();
			}
		
		meeting.setMtAtPath(MeetingUploadPath);
		
		meetingService.insertMeeting(meeting);
		Map<String, Object> log = new HashMap<>();
		log.put("pCode", pCode);
		log.put("logContent", "프로젝트 회의일지가 등록되었습니다.");
		
		proService.insertLog(log);
		
		try {
			
			entity = new ResponseEntity<String>("완료",HttpStatus.OK);
			
		} catch (Exception e) {
			entity = new ResponseEntity<String>(e.getMessage(),HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		return  entity;
		
	}
	
	
	
	@RequestMapping("/chatting")
	public String chatting() {
		String url = "project/chat.open";
		
		return url;
	}
	
	
	@RequestMapping("/meeting")
	public ModelAndView meetingList(ModelAndView mnv,HttpSession session) throws SQLException {
		String url = "project/meeting.open";
		
		String pCode = (String)session.getAttribute("pCode");
		EmpVO loginUser = (EmpVO)session.getAttribute("loginUser");
		
		ProVO pro = proService.getProInfo(pCode);
		
		PjmVO pjm = new PjmVO();
		pjm.setEmpId(loginUser.getEmpId());
		pjm.setpCode(pCode);
		
		String auth = proService.selectPjmAuthById(pjm);
		
		
		ProVO proi=proService.getProInfo(pCode);
 		List<MeetingVO> meetingList = meetingService.getMeetingListByPro(pCode);
 		mnv.addObject("proi",proi);
 		mnv.addObject("pro",pro);
 		mnv.addObject("auth",auth);
 		mnv.addObject("meetingList",meetingList);
		mnv.setViewName(url);
		
		return mnv;
	}
	
	
	@RequestMapping("/meeting2")
	public ModelAndView meeting(ModelAndView mnv,HttpSession session) {
		String url = "project/rooms.open";
		
		String pCode = (String)session.getAttribute("pCode");
		
		List<ChatRoom> rooms =chatRoomRepository.findAllRoom(pCode); 		
		mnv.addObject("rooms",rooms);
		mnv.setViewName(url);
		return mnv;
	}
	
	
	@RequestMapping("/rooms/{id}")
	    public ModelAndView room(@PathVariable String id, ModelAndView mnv){
		String url = "project/room.open";
		String roomId = id;
		
	        ChatRoom room = chatRoomRepository.findRoomById(roomId);
	        mnv.addObject("room",room);
	        mnv.setViewName(url);
	        return mnv;
	    }
	
	@RequestMapping("/new")
	public ModelAndView make(ModelAndView mnv) {
		String url = "project/newRoom.open";
		
		mnv.setViewName(url);
		return mnv;
	}
	
	@RequestMapping("/rdelete")
	public ModelAndView rdelete(String roomId ,ModelAndView mnv,HttpSession session) {
		String url = "project/rooms.open";
		
		
		chatRoomRepository.deleteChatRoom(roomId);
		
		String pCode = (String)session.getAttribute("pCode");
		List<ChatRoom> rooms =chatRoomRepository.findAllRoom(pCode); 		
		mnv.addObject("rooms",rooms);
		mnv.setViewName(url);
		return mnv;
	}
	
	
	
	
	
	
	
	
	
	@RequestMapping("/room/new")
	public ModelAndView makeRoom(ChatRoomForm form,ModelAndView mnv,HttpSession session){
		String url = "project/rooms.open";
		
		ChatRoom chat = form.toChatRoom();
		String pCode = (String)session.getAttribute("pCode");
	
		chat.setpCode(pCode);
		
		chatRoomRepository.createChatRoom(chat);
		
		List<ChatRoom> rooms =chatRoomRepository.findAllRoom(pCode); 		
		mnv.addObject("rooms",rooms);
        mnv.setViewName(url);
		return mnv;
		
    }
	
	
	
	@RequestMapping("/JobCome")
	public ModelAndView JobCome(ModelAndView mnv,HttpSession session,String jobCode)throws Exception{
		String url="project/JobCome.open";
		
		List<DepVO> depList =depService.getDepList();
		
		
		mnv.addObject("jobCode",jobCode);
		mnv.addObject("depList", depList);
		mnv.setViewName(url);
		return mnv;
		
	}
	
	
	

	@RequestMapping("/JobModify")
	public String JobModify(HttpSession session,JobModifyCommand jm)throws SQLException{
		String url="project/JobModify_success.open";
		
		String pCode = (String)session.getAttribute("pCode");
		JobVO job = jm.toJobVO();
		String ser = jm.getSelbox();
		String[] serList=jm.getSer().split(",");
		
		if(ser.equals("direct")) {
			String file = serList[serList.length - 1];		
				
			job.setJobFile(file);
			
			
			}else {
				
				job.setJobFile(jm.getSelbox());
				
			}
			
		jobService.updateJob(job);
		
		Map<String, Object> log = new HashMap<>();
		log.put("pCode", pCode);
		log.put("logContent", "[" + job.getJobName() + "] 업무가 수정되었습니다.");
		proService.insertLog(log);
		
		ProVO pro = proService.getProInfo(job.getpCode());	
			pro.setpJob(jm.getSer());
			
			proService.updateService(pro);
		
		
		
		return url;
		
	}
	
	
	
	@RequestMapping("/JobModifyForm")
	public ModelAndView JobModifyForm(String jobCode,ModelAndView mnv)throws Exception{
		String url="project/JobModifyForm.open";
		
				
		JobVO job = jobService.getJobInfo(jobCode);
				
		EmpVO emp = empService.getEmpById(job.getEmpId());
		
		ProVO proi=proService.getProInfo(job.getpCode());
		String[] serviceList = proi.getpJob().split(",");
		List<ProEmpVO> pjmList = proService.selectProMemberList(job.getpCode());
		
		mnv.addObject("pjmList", pjmList);
		mnv.addObject("serviceList", serviceList);
		mnv.addObject("job", job);
		mnv.addObject("emp", emp);
		
		mnv.setViewName(url);
		return mnv;
	}
	
	
	
	@RequestMapping(value="/doNotJob",method=RequestMethod.POST)
	public String doNotJob(String jobCode)throws Exception{
		String url = "project/doNotJob.open";
		
		jobService.doNotJob(jobCode);
			
		return url;
		
	}
	

	
	@RequestMapping(value="/doJob",method=RequestMethod.POST)
	public String doJob(String jobCode)throws Exception{
		String url = "project/doJob.open";
		
		jobService.doJob(jobCode);
		
		return url;
		
	}
	
	
	
	
	@RequestMapping("/jobDetail2")
	public ModelAndView jobDetail2(HttpSession session,String jobCode,ModelAndView mnv)throws SQLException{
		String url="project/jobDetail2.open";
		
		JobVO job = jobService.getJobInfo(jobCode);
		EmpVO emp = empService.getEmpById(job.getEmpId());
		
		mnv.addObject("job", job);
		mnv.addObject("emp", emp);
		mnv.setViewName(url);
		
		return mnv;
		
	}
	
	
	
	
	@RequestMapping("/jobDetail")
	public ModelAndView jobDetail(HttpSession session,String jobCode,ModelAndView mnv)throws SQLException{
		String url="project/jobDetail.open";
		
		JobVO job = jobService.getJobInfo(jobCode);
		String pCode = (String)session.getAttribute("pCode");
		EmpVO emp = empService.getEmpById(job.getEmpId());
		
		PjmVO pjm = proService.projectPl(pCode);
		
		mnv.addObject("pjm", pjm);
		mnv.addObject("job", job);
		mnv.addObject("emp", emp);
		mnv.setViewName(url);
		
		return mnv;
		
	}
	
	
	
	
	
	@RequestMapping("/main")
	public ModelAndView list(HttpSession session,ModelAndView mnv,SearchCriteriaByPro cri)throws Exception{
		String url="project/proList.open";
		
		EmpVO emp = (EmpVO)session.getAttribute("loginUser");
		String empId = emp.getEmpId();
		
		SearchCriteriaByPro sp = cri.toSearchCriteriaByPro();
		sp.setEmpId(empId);
		
		List<ProVO> doPro = proService.getListDoProById(sp);
		List<ProVO> AopPro = proService.getListAopProById(sp);
		List<ProVO> notPro = proService.getListNotProById(sp);
		
		mnv.addObject("keyword", sp.getKeyword());
		mnv.addObject("orderType", sp.getOrderType());
		mnv.addObject("doPro",doPro);
		mnv.addObject("AopPro",AopPro);
		mnv.addObject("notPro",notPro);
	
		mnv.setViewName(url);
		
		return mnv;
	}
	
	
	@RequestMapping(value="/getMemberInfo",method=RequestMethod.POST,produces="text/plain;charset=utf-8")
	@ResponseBody
	public ResponseEntity<String> getMemberInfo(@RequestBody GetCodeCommand get)throws Exception{
		ResponseEntity<String>  entity=null;
		
		DepVO dep = get.toDepVO();
		
		RankVO rnk = get.toRankVO();
		
		
		try {
			DepVO dep2 = depService.getDepListByCode(dep.getDepCode());
			RankVO rank2 = rankService.getRankListByCode(rnk.getRnkCode());

			String depName = dep2.getDepName();
			String rnkName = rank2.getRnkName();
			
			entity = new ResponseEntity<String>(depName+","+rnkName,HttpStatus.OK);
			
		} catch (Exception e) {
			entity = new ResponseEntity<String>(e.getMessage(),HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		return  entity;
		
	}
	
	
	
	@RequestMapping("/projecterCome")
	public ModelAndView projecterCome(ModelAndView mnv,HttpSession session)throws Exception{
		String url="project/projecterCome.open";
		
		List<DepVO> depList =depService.getDepList();
		String pCode=(String)session.getAttribute("pCode");
		
		ProVO pro = proService.getProInfo(pCode);
		
		mnv.addObject("pro", pro);
		mnv.addObject("depList", depList);
		mnv.setViewName(url);
		return mnv;
		
	}
	
	
	@RequestMapping(value="/projecter",method= RequestMethod.POST,produces="text/plain;charset=utf-8")
	@ResponseBody
	public ResponseEntity<String> projecter(@RequestBody ProjecterCome pj,HttpSession session)throws Exception{
		ResponseEntity<String> entity=null;
		PjmVO pjm = pj.toPjmVO();
		String pCode = pjm.getpCode();
		
		proService.insertMember(pjm);
		
		Map<String, Object> log = new HashMap<>();
		log.put("pCode", pCode);
		log.put("logContent", "프로젝트에 팀원이 추가되었습니다.");
		proService.insertLog(log);
		
		rmailService.deleteRmail(pj.getRmCode());
		
		try {
			entity=new ResponseEntity<String>("프로젝트 참여자 추가",HttpStatus.OK);
			
		} catch (Exception e) {
			entity = new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		return entity;
	}
	
	
	@RequestMapping(value="/updateAu",method=RequestMethod.POST,produces="text/plain;charset=utf-8")
	@ResponseBody
	public ResponseEntity<String> updateAu(@RequestBody UpdatePjmAu Pjm)throws Exception{
		ResponseEntity<String>  entity=null;
		
		PjmVO pjm = Pjm.toPjmVO();
		
		proService.updateAu(pjm);
		
		try {
			
			entity = new ResponseEntity<String>("역할 부여",HttpStatus.OK);
			
		} catch (Exception e) {
			entity = new ResponseEntity<String>(e.getMessage(),HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		return  entity;
		
	}
	
	
	
	@RequestMapping("/jobSelectList")
	public ModelAndView jobSelectList(HttpSession session,ModelAndView mnv,GetJobInfo Ji,String key)throws Exception{
		String url="project/jobList.open";
		
		String pCode = (String)session.getAttribute("pCode");
		EmpVO emp = (EmpVO)session.getAttribute("loginUser");
		
		
		List<ProEmpVO> pjmList = proService.selectProMemberList(pCode);
		
		JobVO job = Ji.toJobVO();
		job.setEmpId(emp.getEmpId());
		job.setpCode(pCode);
		job.setJobFile(key);
		
		List<JobVO> jobList = jobService.getServiceList(job);
		ProVO proi=proService.getProInfo(pCode);
		String[] serviceList = proi.getpJob().split(",");
		
		PjmVO pjm = proService.projectPl(pCode);
		
		ProVO pro = proService.getProInfo(pCode);
		mnv.addObject("pro",pro);
		mnv.addObject("pjm", pjm);
		mnv.addObject("serviceList", serviceList);
		mnv.addObject("proi", proi);
		mnv.addObject("jobList", jobList);
		mnv.addObject("pjmList",pjmList);
		mnv.setViewName(url);
		return mnv;
	}
	
	@RequestMapping("/jobmanage")
	public ModelAndView jobList(HttpSession session,ModelAndView mnv,GetJobInfo Ji)throws Exception{
		String url="project/jobList.open";
		
		String pCode = (String)session.getAttribute("pCode");
		EmpVO emp = (EmpVO)session.getAttribute("loginUser");
		
		
		List<ProEmpVO> pjmList = proService.selectProMemberList(pCode);
		
		JobVO job = Ji.toJobVO();
		job.setEmpId(emp.getEmpId());
		job.setpCode(pCode);
		
		List<JobVO> jobList = jobService.getProJobListById(job);
		ProVO proi=proService.getProInfo(pCode);
		
		
		if(proi.getpJob() != null) {
			String[] serviceList = proi.getpJob().split(",");
			mnv.addObject("serviceList", serviceList);
		}
		PjmVO pjm = proService.projectPl(pCode);
		ProVO pro = proService.getProInfo(pCode);
		mnv.addObject("pro",pro);
		mnv.addObject("pjm", pjm);
		mnv.addObject("proi", proi);
		mnv.addObject("jobList", jobList);
		mnv.addObject("pjmList",pjmList);
		mnv.setViewName(url);
		return mnv;
	}
	
	
	
	@RequestMapping("/membermanage")
	public ModelAndView memberList(HttpSession session,ModelAndView mnv,GetJobInfo Ji)throws Exception{
		String url="project/memberList.open";
		
		String pCode = (String)session.getAttribute("pCode");
		EmpVO emp = (EmpVO)session.getAttribute("loginUser");
		
		
		List<ProEmpVO> pjmList = proService.selectProMemberList(pCode);
		ProVO pro = proService.getProInfo(pCode);
		/*JobVO job = Ji.toJobVO();
		job.setEmpId(emp.getEmpId());
		job.setpCode(pCode);
		
		List<JobVO> jobList = jobService.getProJobListById(job);*/
		
		ProVO proi=proService.getProInfo(pCode);
		PjmVO pjm = proService.projectPl(pCode);
		
		mnv.addObject("pro", pro);
		mnv.addObject("pjm", pjm);
		mnv.addObject("proi", proi);
		/*mnv.addObject("jobList", jobList);*/
		mnv.addObject("pjmList",pjmList);
		mnv.setViewName(url);
		return mnv;
	}
	
	
	
	
	@RequestMapping("/ProRegistForm")
	public String proRegistForm()throws Exception{
		String url="project/proRegistForm.open";
		
		return url;
	}
	
	
	@RequestMapping("/ProModifyForm")
	public ModelAndView proModifyForm(String pCode,ModelAndView mnv)throws Exception{
		String url="project/proModifyForm";
		
		ProVO pro = proService.getProInfo(pCode);
		
		mnv.addObject("pro", pro);
		
		mnv.setViewName(url);
		
		return mnv;
	}
	
	
	
	@RequestMapping("/detail")
	public ModelAndView detail(HttpSession session,ModelAndView mnv,String pCode)throws Exception{
		String url="project/proDetail.open";
		
		ProVO pro = proService.getProInfo(pCode);
		
		session.setAttribute("pCode", pro.getpCode());
		PjmVO pjm = proService.projectPl(pCode);
		
		mnv.addObject("pjm", pjm);
		mnv.addObject("pro", pro);
		mnv.setViewName(url);
		
		return mnv;
	}
	
	
	
	@RequestMapping(value="/regist",method=RequestMethod.POST)
	public String proRegist(ProRegistCommand proReq,PjmVO pjm,HttpSession session)throws Exception{
		String url="project/regist_success.open";
		
		ProVO pro=proReq.toProVO();
		EmpVO emp = (EmpVO)session.getAttribute("loginUser");
		String empId=emp.getEmpId();
		
		proService.insertProject(pro);
		
		String pCode = proService.getPcode();
		String Code = "p"+pCode;
		
		pjm.setEmpId(empId);
		pjm.setpCode(Code);
		
		proService.insertPL(pjm);
		
		return url;
		
	}
	
	@RequestMapping(value="/modify",method=RequestMethod.POST)
	public ModelAndView proModify(ProModifyCommand prom ,ModelAndView mnv)throws Exception{
		String url = "project/modify_success.open";
		
		ProVO pro=prom.toProVO();
		
		proService.updateProject(pro);
		
		mnv.addObject("pCode", pro.getpCode());
		mnv.setViewName(url);
		
		return mnv;
	}
	
	@RequestMapping(value="/doNotPro",method=RequestMethod.POST)
	public String doNotPro(String pCode)throws Exception{
		String url = "project/doNotProject.open";
		
		proService.notDoProject(pCode);
			
		return url;
		
	}
	

	
	@RequestMapping(value="/doPro",method=RequestMethod.POST)
	public String doPro(String pCode)throws Exception{
		String url = "project/doProject.open";
		
		proService.DoProject(pCode);
			
		return url;
		
	}
	
	
	
	
	
	
	/* 자료실 */
	@RequestMapping("/pa")
	public ModelAndView pa(HttpSession session,ModelAndView mnv,SearchCriteriaByPA cri)throws Exception{
		String url="project/paList.open";
		
		String pCode = (String)session.getAttribute("pCode");
		cri.setpCode(pCode);
		
		EmpVO loginUser = (EmpVO)session.getAttribute("loginUser");
		PjmVO pjm = new PjmVO();
		pjm.setEmpId(loginUser.getEmpId());
		pjm.setpCode(pCode);
		
		String auth = proService.selectPjmAuthById(pjm);
		
		Map<String, Object> dataMap = proService.getPAList(cri);
		ProVO pro = proService.getProInfo(pCode);
		mnv.addObject("pro",pro);
		mnv.addObject("dataMap",dataMap);
		mnv.addObject("auth",auth);
		mnv.setViewName(url);
		
		return mnv;
	}
	
	@RequestMapping("/paRegistForm")
	public ModelAndView paRegistForm(HttpSession session,ModelAndView mnv)throws Exception{
		String url="project/paRegistForm.open";
		mnv.setViewName(url);
		return mnv;
	}
	
	@RequestMapping(value = "/paRegist", method = RequestMethod.POST, produces = "text/plain;charset=utf-8")
	public String paRegist(ProPARegistCommand registReq,Model model, HttpServletRequest request,HttpSession session)throws Exception {
		String url = "project/pa_regist_success.open";
		
		String pCode = (String)session.getAttribute("pCode");
		PAVO pa = registReq.toPAVO();
		List<PAAttachVO> attachList = GetAttachesAsMultipartFiles.paSave(registReq.getUploadFile(), PAfileUploadPath);
//		pa.setPaTitle((String)request.getAttribute("XSStitle"));
		pa.setAttachList(attachList);
		
		
		proService.registPA(pa);
		
		Map<String, Object> log = new HashMap<>();
		log.put("pCode", pCode);
		log.put("logContent", "프로젝트 자료가 등록되었습니다.");
		proService.insertLog(log);
		
		return url;		
	}
	
	@RequestMapping("/paDetail")
	public ModelAndView paDetail(HttpSession session,ModelAndView mnv,String pacode)throws Exception{
		String url="project/paDetail.open";
		
		PAVO pa = null;
		pa = proService.getPA(pacode);

		// 파일명 재정의
		List<PAAttachVO> attachList = pa.getAttachList();
		if (attachList != null) {
			for (PAAttachVO attach : attachList) {
				String fileName = attach.getPaAtName().split("\\$\\$")[1];
				attach.setPaAtName(fileName);
			}
		}

		mnv.addObject("pa", pa);
		mnv.setViewName(url);
		
		return mnv;
	}
	
	@RequestMapping("/paModifyForm")
	public ModelAndView modifyForm(ModelAndView mnv, String pacode) throws Exception {
		String url = "project/paModifyForm.open";

		PAVO pa = proService.getPA(pacode);

		// 파일명 재정의
		List<PAAttachVO> attachList = pa.getAttachList();
		if (attachList != null) {
			for (PAAttachVO attach : attachList) {
				String fileName = attach.getPaAtName().split("\\$\\$")[1];
				attach.setPaAtName(fileName);
			}
		}

		mnv.addObject("pa", pa);
		mnv.setViewName(url);

		return mnv;
	}
	
	@RequestMapping("/paModify")
	public ModelAndView paModify(ProPAModifyCommand modifyReq, HttpServletRequest request, ModelAndView mnv) throws Exception {
		
		String url = "project/pa_modify_success.open";		
		System.out.println(modifyReq.getPaCode());
		System.out.println(modifyReq.getpCode());
		System.out.println(modifyReq.getDeleteFile());
		// 삭제된 파일 삭제
		if (modifyReq.getDeleteFile() != null && modifyReq.getDeleteFile().length > 0) {
			for (int paatno : modifyReq.getDeleteFile()) {
				String fileName = proService.getAttachByPaAtNo(paatno).getPaAtName();
				System.out.println("fileName : " + fileName);
				File deleteFile = new File(PAfileUploadPath, fileName);
				proService.removeAttachByPaAtNo(paatno); // DB 삭제
				if (deleteFile.exists()) {
					deleteFile.delete(); // File 삭제
				}
			}
		}

		// 추가 혹은 변경된 파일 저장
		List<PAAttachVO> attachList = GetAttachesAsMultipartFiles.paSave(modifyReq.getUploadFile(),PAfileUploadPath);

		PAVO pa = modifyReq.toPAVO();
		pa.setAttachList(attachList);

		// DB에 해당 데이터 추가
		proService.modifyPA(pa);
		
		mnv.addObject("pa", pa);
		mnv.setViewName(url);
		
		return mnv;
	}
	
	@RequestMapping("/getPAFile")
	public String getFile(int paatno,Model model) throws Exception {
		String url="downloadFile";
		
		PAAttachVO attach = proService.getAttachByPaAtNo(paatno);
		
		model.addAttribute("savedPath", attach.getPaAtPath());
		model.addAttribute("fileName", attach.getPaAtName());
		
		return url;		
	}
	
	@RequestMapping("/paRemove")
	public String remove(String pacode) throws Exception {

		String url="project/pa_remove_success.open";
		
		//첨부파일 삭제
		List<PAAttachVO> attachList = proService.getPA(pacode).getAttachList();				
		if (attachList != null) {
			for (PAAttachVO attach : attachList) {
				File target = new File(attach.getPaAtPath(), attach.getPaAtName());
				if (target.exists()) {
					target.delete();
				}
			}
		}
		
		//DB삭제
		proService.remove(pacode);

		return url;

	}
	
	// KMS 이관
	@RequestMapping("/relegateForm")
	public ModelAndView relegateForm(HttpSession session, ModelAndView mnv) throws Exception{
		String url = "project/relegateForm.open";
		
		String pCode = (String)session.getAttribute("pCode");
		
		ProVO pro = proService.getProInfo(pCode);
		List<PAAttachVO> attachList = proService.getPAAllAttachesBypCode(pCode);
		
		mnv.addObject("pro",pro);
		mnv.addObject("attachList",attachList);
		
		mnv.setViewName(url);
		return mnv;
	}
	
	@RequestMapping(value = "/relegate", method = RequestMethod.POST, produces = "text/plain;charset=utf-8")
	public String relegate(RelegateCommand relegateReq, HttpServletRequest request, HttpSession session)throws Exception {
		
		String url = "project/relegate_success.open";	
		EmpVO emp = (EmpVO)session.getAttribute("loginUser");
		int s = 0;
		// 이관 존재 시, 파일,DB 삭제
		RelegateVO relegate = proService.selectRelegate(relegateReq.getpCode());
		if(relegate != null) {
			File deleteFile = new File(relegate.getPrAttachPath());
			if (deleteFile.exists()) {
				deleteFile.delete(); // File 삭제
			}
			File finalF = new File(relegate.getFinalAttachPath());
			System.out.println("최종보고서 : " + relegate.getFinalAttachPath());
			if(finalF.exists()) {
				finalF.delete();
			}
			PRBVO prb = prbService.getPrbByPcode(relegateReq.getpCode());
			if(prb != null) {
				scrapService.deleteBdScrap(prb.getPrCode());
				s = 1;
			}
			proService.removeRelegate(relegateReq.getpCode()); // DB 삭제
		}
		
		// 최종보고서 
		List<PAAttachVO> finalFile = GetAttachesAsMultipartFiles.paSave(relegateReq.getFinalFile(),PAfileUploadPath);
		String finalFileName = "";
		for(PAAttachVO multi : finalFile) {
			finalFileName = multi.getPaAtName();
		}
		
		int[] files = relegateReq.getRelegateFile(); 
		
		// 프로젝트 압축
		ZipOutputStream zout = null; 
		FileInputStream in = null; 
		byte[] buffer = new byte[1024]; 
		
		String pName = relegateReq.getpName().replaceAll(" ", "");
		String zipName = "/프로젝트자료_" + relegateReq.getpCode()+ "_" + pName + ".zip"; //ZIP 압축 파일명
		
		try{ 
			//ZIP파일 압축 START 
			zout = new ZipOutputStream(new FileOutputStream(relegateUploadPath + zipName)); 
			
			// 최종보고서
			in = new FileInputStream(PAfileUploadPath + "/" + finalFileName); //압축 대상 파일 
			zout.putNextEntry(new ZipEntry(finalFileName.split("\\$\\$")[1])); //압축파일에 저장될 파일명 
			int len = 0;

			while(((len = in.read()) > 0)){ 
				zout.write(buffer, 0, len); //읽은 파일을 ZipOutputStream에 Write 
			} 	
			zout.closeEntry(); 
			in.close(); 
			if (relegateReq.getRelegateFile() != null) { 
				// 프로젝트 자료실
				for ( int k=0; k<files.length; k++){ 
					in = new FileInputStream(PAfileUploadPath + "/" + proService.getAttachByPaAtNo(files[k]).getPaAtName()); //압축 대상 파일 
					zout.putNextEntry(new ZipEntry(proService.getAttachByPaAtNo(files[k]).getPaAtName().split("\\$\\$")[1])); //압축파일에 저장될 파일명 
					len = 0;

					while(((len = in.read()) > 0)){ 
						zout.write(buffer, 0, len); //읽은 파일을 ZipOutputStream에 Write 
					} 	
					zout.closeEntry(); 
					in.close(); 
				}
			}
			zout.close();
		}catch(IOException e){ //Exception 
		
		}finally{ 
			if (zout != null){ 
				zout = null; 
			} 
		}
		
		
		// DB저장 PR_ATTACH_PATH, EMP_ID, P_CODE 
		RelegateVO rlvo = relegateReq.toRelegateVO();
		
		rlvo.setPrAttachPath(relegateUploadPath + zipName);
		rlvo.setFinalAttachPath(PAfileUploadPath + "/" + finalFileName);
		rlvo.setEmpId(relegateReq.getEmpId());
		rlvo.setpCode(relegateReq.getpCode());
		
		proService.registRelegate(rlvo);
		
		if(s == 1) {
			ScrapVO scr = new ScrapVO();
			scr.setEmpId(emp.getEmpId());
			scr.setScTitle("");
			scr.setScUrl("http://localhost/KAPMaS/kms/prbDetail.do?prCode=" + prbService.getPrbByPcode(rlvo.getpCode()).getPrCode());
			scrapService.insertScrap(scr);
		}
		
		
		return url;
	}
	
	
	
	
	@RequestMapping("/jobRegistForm")
	public ModelAndView jobRegistForm(HttpSession session,ModelAndView mnv)throws SQLException{
		String url="project/jobRegistForm.open";
		
		String pCode = (String)session.getAttribute("pCode");
		
		ProVO proi=proService.getProInfo(pCode);
		
		if(proi.getpJob() != null) {
			String[] serviceList = proi.getpJob().split(",");
			mnv.addObject("serviceList", serviceList);
		}
		
		List<ProEmpVO> pjmList = proService.selectProMemberList(pCode);
		
		mnv.addObject("pjmList", pjmList);
		mnv.setViewName(url);
		return mnv;
		
	}
	
	
	
	@RequestMapping("/jobRegist")
	public String jobRegist(HttpSession session,JobRegistCommand jc)throws SQLException{
		String url="project/jobRegist_success.open";
		
		
		JobVO job = jc.toJobVO();
		String ser = jc.getSelbox();
		String[] serList=jc.getSer().split(",");
		
		String pCode = (String)session.getAttribute("pCode");
		
		if(ser.equals("direct")) {
			String file = serList[serList.length - 1];		
			job.setJobFile(file);
			
			}else {
				
				job.setJobFile(jc.getSelbox());
			}
			
		job.setpCode(pCode);
		jobService.insertJob(job);
			
		ProVO pro = proService.getProInfo(pCode);	
			pro.setpJob(jc.getSer());
			
			proService.updateService(pro);
			
		Map<String, Object> log = new HashMap<>();
		log.put("pCode", pCode);
		log.put("logContent", "프로젝트 업무가 등록되었습니다.");
		proService.insertLog(log);
		
		return url;
	}
	
	@RequestMapping("/gantt")
	public ModelAndView gantt(HttpSession session,ModelAndView mnv)throws Exception{
		String url="project/gantt";
		
		String pCode = (String)session.getAttribute("pCode");
		ProVO pro = proService.getProInfo(pCode);	
		mnv.addObject("proName", pro.getpName());
		
		mnv.setViewName(url);
		return mnv;
	}

	@RequestMapping("/getGanttList")
	@ResponseBody
	public List<JobVO> getGanttList(HttpSession session,GetJobInfo Ji) throws SQLException {
	 
		String pCode = (String)session.getAttribute("pCode");
		EmpVO emp = (EmpVO)session.getAttribute("loginUser");
		
		JobVO job = Ji.toJobVO();
		job.setEmpId(emp.getEmpId());
		job.setpCode(pCode);
		
		List<JobVO> jobList = jobService.getProJobListById(job);
		
		return jobList;
	}

	@RequestMapping("/issue")
	public ModelAndView projectIssueList(ModelAndView mnv,  HttpSession session) throws Exception{
		String url = "project/piList.open";
		
		String pCode = (String)session.getAttribute("pCode");
		EmpVO loginUser = (EmpVO) session.getAttribute("loginUser");
		
		List<PIVO> piList = proService.selectPIList(pCode);
		List<Object> piMileStone = proService.selectPIMileStoneList(pCode);
		List<Double> piMileStonePercent = new ArrayList<>();
		PjmVO pjm = new PjmVO();
		pjm.setEmpId(loginUser.getEmpId());
		pjm.setpCode(pCode);
		
		String auth = proService.selectPjmAuthById(pjm);
		
		String piMileStoneString = "";
		for (int i = 0; i < piMileStone.size(); i++) {
			double count = 0;
			double percent = 0;
			for (int j = 0; j < piList.size(); j++) {
				if(piList.get(j).getPiMileStone().equals(piMileStone.get(i))){
					count += 1;
					if(piList.get(j).getPiStatus() == 0) {
						percent+= 1;
					}
				}
				piList.get(j).setEmpName(empService.getEmpById(piList.get(j).getEmpId()).getEmpName());
			}
			if(percent == 0.0) {
				piMileStonePercent.add(0.0);
			}else {
				piMileStonePercent.add((double) Math.round((percent/count)*100.0));
			}
			piMileStoneString += piMileStone.get(i);
			if(i != piMileStone.size()-1) {
				piMileStoneString += ",";
			}
		}
		ProVO pro = proService.getProInfo(pCode);
		mnv.addObject("pro",pro);
		mnv.addObject("piList",piList);
		mnv.addObject("piMileStone",piMileStoneString);
		mnv.addObject("piMileStonePercent",piMileStonePercent);
		mnv.addObject("auth",auth);
		
		mnv.setViewName(url);
		
		return mnv;
	}
	

	@RequestMapping("/piDetail/{piCode}")
	public ModelAndView projectIssueDetail (@PathVariable String piCode, ModelAndView mnv) throws Exception{
		String url = "project/piDetail.open";
		
		PIVO pi = proService.selectPI(piCode);
		String empName = empService.getEmpById(pi.getEmpId()).getEmpName();
		List<PIVO> piList = proService.selectPIList(pi.getpCode());
		Double piMileStonePercent = 0.0;
		List<PIVO> piListInMileStone = new ArrayList<>();
		double count = 0;
		double percent = 0;
		for (int j = 0; j < piList.size(); j++) {
			if(piList.get(j).getPiMileStone().equals(pi.getPiMileStone())){
				count += 1;
				if(piList.get(j).getPiStatus() == 0) {
					percent+= 1;
				}
			}
			if(piList.get(j).getPiMileStone().equals(pi.getPiMileStone())) {
				piList.get(j).setEmpName(empService.getEmpById(piList.get(j).getEmpId()).getEmpName());
				piListInMileStone.add(piList.get(j));
			}
		}
		if(percent == 0.0) {
			piMileStonePercent = 0.0;
		}else {
			piMileStonePercent = (double) Math.round((percent/count)*100.0);
		}
		int RpCnt = piReplyService.getPiReplyListCount(piCode);
		
		mnv.addObject("pi",pi);
		mnv.addObject("empName",empName);
		mnv.addObject("piList",piListInMileStone);
		mnv.addObject("piMileStonePercent",piMileStonePercent);
		mnv.addObject("RpCnt", RpCnt);
		
		mnv.setViewName(url);
		return mnv;
	}
	
	
	@RequestMapping("/piModifyForm")
	public ModelAndView projectIssueModifyForm( String piCode, ModelAndView mnv)throws Exception{
		String url = "project/piModifyForm.open";
		
		PIVO pi = proService.selectPI(piCode);
		List<Object> piMileStone = proService.selectPIMileStoneList(pi.getpCode());
		
		mnv.addObject("pi",pi);
		mnv.addObject("piMileStone",piMileStone);
		
		mnv.setViewName(url);
		return mnv;
	}
	
	
	
	@RequestMapping("/piComplete")
	public String projectIssueComplete(String piCode) throws Exception{
		String url = "project/piComplete.open";
		
		proService.completePI(piCode);
		
		return url;
	}
	
	
	
	@RequestMapping(value="/piModify", method=RequestMethod.POST, produces = "text/plain;charset=utf-8")
	public ModelAndView projectIssueModify(ModelAndView mnv, ProPIModifyCommand piCommand) throws Exception{
		String url = "project/piModify_success.open";
		
		PIVO pi = piCommand.toPiVO();
		String piCode = pi.getPiCode();
		
		
		proService.updatePI(pi);
		mnv.addObject("piCode",piCode);
		mnv.setViewName(url);
		
		return mnv;
	}
	
	
	@RequestMapping("/piRemove")
	public String projectIssueRemove(String piCode) throws Exception{
		String url = "project/piRemove_success.open";
		
		proService.deletePI(piCode);
		
		return url;
	}
	
	
	
	@RequestMapping("/piRegistForm")
	public ModelAndView projectIssueRegistForm(ModelAndView mnv, HttpSession session) throws Exception{
		String url = "project/piRegistForm.open";
		
		String pCode = (String)session.getAttribute("pCode");
		List<Object> piMileStoneList = proService.selectPIMileStoneList(pCode);
		
		mnv.addObject("pCode",pCode);
		mnv.addObject("piMileStoneList", piMileStoneList);
		
		mnv.setViewName(url);
		return mnv;
	}
	
	
	@RequestMapping(value="/piRegist", method=RequestMethod.POST, produces = "text/plain;charset=utf-8")
	public ModelAndView projectIssueRegist(HttpSession session, ModelAndView mnv, ProPIRegistCommand piCommand) throws Exception{
		String url = "project/piRegist_success.open";
		
		String pCode = (String)session.getAttribute("pCode");
		PIVO pi = piCommand.toPiVO();
		proService.insertPI(pi);
		
		Map<String, Object> log = new HashMap<>();
		log.put("pCode", pCode);
		log.put("logContent", "프로젝트 이슈&리스크가 등록되었습니다.");
		proService.insertLog(log);
		
		mnv.setViewName(url);
		return mnv;
	}
	
	
	
	@RequestMapping("/firstProjectJob")
	public ModelAndView firstProjectJob(ModelAndView mnv, HttpSession session) throws Exception{
		String url = "project/firstProjectJob.open";
		
		mnv.setViewName(url);
		return mnv;
	}
	
	
	
	
	@RequestMapping("/jobreport")
	public ModelAndView jobReport(ModelAndView mnv, HttpSession session) throws Exception{
		String url = "project/jobReport.open";
		
		String pCode = (String)session.getAttribute("pCode");
		EmpVO emp = (EmpVO)session.getAttribute("loginUser");
		String empId = emp.getEmpId();
		
		List<DailyReportVO> drList  = jobService.getDailyReportList(pCode);
		List<WeeklyReportVO> wrList = jobService.getWeeklyReportList(pCode);
		for (int i = 0; i < drList.size(); i++) {
			drList.get(i).setEmpName(empService.getEmpById(drList.get(i).getEmpId()).getEmpName());
//			drList.get(i).setJobName(jobService.getDailyReport(drList.get(i).getdrCode()).getJobName());;
		}
		for (int i = 0; i < wrList.size(); i++) {
			wrList.get(i).setEmpName(empService.getEmpById(wrList.get(i).getEmpId()).getEmpName());
		}
		PjmVO pjm = new PjmVO();
		pjm.setEmpId(empId);
		pjm.setpCode(pCode);
		
		String auth = proService.selectPjmAuthById(pjm);
		ProVO pro = proService.getProInfo(pCode);
		mnv.addObject("pro",pro);
		mnv.addObject("auth",auth);
		mnv.addObject("drList",drList);
		mnv.addObject("wrList",wrList);
		
		mnv.setViewName(url);
		
		return mnv;
	}
	
	
	@RequestMapping("/wrRegistForm")
	public ModelAndView wrRegistForm(ModelAndView mnv, HttpSession session) throws Exception{
		String url = "project/wrRegist.open";
		String pCode = (String)session.getAttribute("pCode");
		
		String pName = proService.getProInfo(pCode).getpName();
		
		mnv.addObject("pName",pName);
		
		mnv.setViewName(url);
		return mnv;
	}
	
	
	
	@RequestMapping(value="/wrRegist", method=RequestMethod.POST, produces = "text/plain;charset=utf-8")
	public ModelAndView wrRegist(ModelAndView mnv, WeeklyReportVO wr) throws Exception{
		String url = "project/wrRegist_success.open";
		
		jobService.insertWeeklyReport(wr);
		String pName = proService.getProInfo(wr.getpCode()).getpName();
		mnv.addObject("pName",pName);
		mnv.addObject("wrCode",wr.getWrCode());
		
		mnv.setViewName(url);
		return mnv;
	}
	
	
	@RequestMapping("/wrDetail")
	public ModelAndView wrDetail(String wrCode ,ModelAndView mnv) throws Exception{
		String url = "project/wrDetail.open";
		
		WeeklyReportVO wr = jobService.getWeeklyReport(wrCode);
		EmpVO emp = empService.getEmpById(wr.getEmpId());
		String pName = proService.getProInfo(wr.getpCode()).getpName();
		mnv.addObject("wr",wr);
		mnv.addObject("pName",pName);
		mnv.addObject("emp",emp);
		
		mnv.setViewName(url);
		return mnv;
	}
	
	
	@RequestMapping("/wrModifyForm")
	public ModelAndView wrModifyForm(String wrCode, ModelAndView mnv) throws Exception{
		String url = "project/wrModify.open";
		
		WeeklyReportVO wr = jobService.getWeeklyReport(wrCode);
		EmpVO emp = empService.getEmpById(wr.getEmpId());
		String pName = proService.getProInfo(wr.getpCode()).getpName();
		System.out.println("이름 " + pName);
		mnv.addObject("wr",wr);
		mnv.addObject("pName",pName);
		mnv.addObject("emp",emp);
		
		mnv.setViewName(url);
		return mnv;
	}
	
	
	
	@RequestMapping(value="/wrModify", method=RequestMethod.POST, produces = "text/plain;charset=utf-8")
	public ModelAndView wrModify(ModelAndView mnv, WeeklyReportVO wr) throws Exception{
		String url = "project/wrModify_success.open";
		
		jobService.updateWeeklyReport(wr);
		
		mnv.addObject("wrCode",wr.getWrCode());
		
		mnv.setViewName(url);
		return mnv;
	}
	
	
	@RequestMapping("/wrRemove")
	public ModelAndView wrRemove(ModelAndView mnv, String wrCode) throws Exception{
		String url = "project/wrRemove_success.open";
		
		jobService.deleteWeeklyReport(wrCode);
		
		mnv.addObject("wrCode",wrCode);
		mnv.setViewName(url);
		return mnv;
	}
	
	
	
	
	@RequestMapping("/drRegistForm")
	public ModelAndView drRegistForm(ModelAndView mnv, HttpSession session) throws Exception{
		String url = "project/drRegist.open";
		
		String pCode = (String)session.getAttribute("pCode");
		
		String pName = proService.getProInfo(pCode).getpName();
		List<JobVO> jobList = jobService.getJobList(pCode);
		
		mnv.addObject("pName",pName);
		mnv.addObject("jobList",jobList);
		
		mnv.setViewName(url);
		return mnv;
	}
	
	
	
	@RequestMapping(value="/drRegist", method=RequestMethod.POST, produces = "text/plain;charset=utf-8")
	public ModelAndView drRegist(ModelAndView mnv, DailyReportVO dr) throws Exception{
		String url = "project/drRegist_success.open";
		
		jobService.insertDailyReport(dr);

		mnv.setViewName(url);
		return mnv;
	}
	
	
	@RequestMapping("/drDetail")
	public ModelAndView drDetail(String drCode ,ModelAndView mnv) throws Exception{
		String url = "project/drDetail.open";
		
		DailyReportVO dr = jobService.getDailyReport(drCode);
		String pName = proService.getProInfo(dr.getpCode()).getpName();
//		dr.setJobName(jobService.getJobInfo(dr.getJobCode()).getJobName());
		EmpVO emp = empService.getEmpById(dr.getEmpId());
		
		mnv.addObject("dr",dr);
		mnv.addObject("pName",pName);
		mnv.addObject("emp",emp);
		
		mnv.setViewName(url);
		return mnv;
	}
	
	
	@RequestMapping("/drModifyForm")
	public ModelAndView drModifyForm(String drCode, ModelAndView mnv) throws Exception{
		String url = "project/drModify.open";
		
		DailyReportVO dr = jobService.getDailyReport(drCode);
		String pName = proService.getProInfo(dr.getpCode()).getpName();
		List<JobVO> jobList = jobService.getJobList(dr.getpCode());
		EmpVO emp = empService.getEmpById(dr.getEmpId());
		
		mnv.addObject("dr",dr);
		mnv.addObject("pName",pName);
		mnv.addObject("jobList",jobList);
		mnv.addObject("emp",emp);
		
		mnv.setViewName(url);
		return mnv;
	}
	
	
	
	@RequestMapping(value="/drModify", method=RequestMethod.POST, produces = "text/plain;charset=utf-8")
	public ModelAndView drModify(ModelAndView mnv, DailyReportVO dr) throws Exception{
		String url = "project/drModify_success.open";
		
		jobService.updateDailyReport(dr);
		
		mnv.addObject("drCode",dr.getdrCode());
		
		mnv.setViewName(url);
		return mnv;
	}
	
	
	@RequestMapping("/drRemove")
	public ModelAndView drRemove(ModelAndView mnv, String drCode) throws Exception{
		String url = "project/drRemove_success.open";
		
		jobService.deleteDailyReport(drCode);
		
		mnv.addObject("drCode",drCode);
		mnv.setViewName(url);
		return mnv;
	}
	
	
	
	@RequestMapping("/proMain")
	public ModelAndView proMain(ModelAndView mnv, HttpSession session, String pCode) throws SQLException {
		String url = "project/proMain.open";
		if(pCode != null) {
			session.setAttribute("pCode", pCode);
		}else {
			pCode = (String)session.getAttribute("pCode");
		}
		System.out.println("프로젝트코드 : " + pCode);
		List<ProLogVO> logList = proService.selectLogList(pCode);
		List<PIVO> piList = proService.selectPIList(pCode);
		ProVO pro = proService.getProInfo(pCode);
		HashMap<String, Object> tp = proService.getTotalProgress(pCode);
		if(tp != null) {
			mnv.addObject("tp",tp.get("TP"));
		}
		for (int j = 0; j < piList.size(); j++) {
			piList.get(j).setEmpName(empService.getEmpById(piList.get(j).getEmpId()).getEmpName());
		}
		mnv.addObject("logList", logList);
		mnv.addObject("piList",piList);
		mnv.addObject("pro",pro);
		mnv.setViewName(url);
		
		return mnv;
	}
	
	@RequestMapping("/getMainWorkByManager")
	@ResponseBody
	public List<HashMap<String, Object>> getMainWorkByManager(HttpSession session) throws SQLException {
		String pCode = (String)session.getAttribute("pCode");
		List<HashMap<String, Object>> avgJobList = proService.getMainWorkByManager(pCode);

		return avgJobList;
	}
	
	@RequestMapping("/getWindowWorkByManager")
	public String getWindowWorkByManager() throws SQLException {
		String url = "project/getWindowWorkByManager.open";
		
		return url;
	}
	
	@RequestMapping("/getMainWorkByCate")
	@ResponseBody
	public List<HashMap<String, Object>> getMainWorkByCate(HttpSession session) throws SQLException {
		String pCode = (String)session.getAttribute("pCode");
		List<HashMap<String, Object>> cateJobList = proService.getMainWorkByCate(pCode);
		
		return cateJobList;
	}
}












