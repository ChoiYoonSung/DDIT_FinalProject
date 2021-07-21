package com.spring.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
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
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.spring.chat.ChatRoom;
import com.spring.chat.ChatRoomForm;
import com.spring.chat.ChatRoomRepository;
import com.spring.command.GetCodeCommand;
import com.spring.command.GetJobInfo;
import com.spring.command.JobModifyCommand;
import com.spring.command.JobRegistCommand;
import com.spring.command.ProModifyCommand;
import com.spring.command.ProPAModifyCommand;
import com.spring.command.ProPARegistCommand;
import com.spring.command.ProPIModifyCommand;
import com.spring.command.ProRegistCommand;
import com.spring.command.ProjecterCome;
import com.spring.command.RelegateCommand;
import com.spring.command.SearchCriteriaByPA;
import com.spring.command.UpdatePjmAu;
import com.spring.dto.DepVO;
import com.spring.dto.EmpVO;
import com.spring.dto.JobVO;
import com.spring.dto.PAAttachVO;
import com.spring.dto.PAVO;
import com.spring.dto.PIVO;
import com.spring.dto.PjmVO;
import com.spring.dto.ProEmpVO;
import com.spring.dto.ProVO;
import com.spring.dto.RankVO;
import com.spring.dto.RelegateVO;
import com.spring.security.User;
import com.spring.service.DepService;
import com.spring.service.EmpService;
import com.spring.service.JobService;
import com.spring.service.ProService;
import com.spring.service.RankService;
import com.spring.service.RmailService;
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
	
	@Resource(name = "PAfileUploadPath")
	private String PAfileUploadPath;
	
	@Resource(name = "relegateUploadPath")
	private String relegateUploadPath;
	
	@Autowired
	private ChatRoomRepository chatRoomRepository;
	
	
	
	@RequestMapping("/chatting")
	public String chatting() {
		String url = "project/chat.open";
		
		return url;
	}
	
	
	@RequestMapping("/meeting")
	public String meeting() {
		String url = "project/meeting.open";
		
		
		
		return url;
	}
	
	
	@RequestMapping("/meeting2")
	public ModelAndView meeting(ModelAndView mnv) {
		String url = "project/rooms.open";
		
		mnv.addObject("rooms",chatRoomRepository.findAllRoom());
		mnv.setViewName(url);
		return mnv;
	}
	
	@RequestMapping("/rooms/{id}")
	    public ModelAndView room(@PathVariable String id, ModelAndView mnv){
		String url = "project/room.open";
		
	        ChatRoom room = chatRoomRepository.findRoomById(id);
	        mnv.addObject("room",room);
	        mnv.setViewName(url);
	        return mnv;
	    }
	
	@RequestMapping("/new")
	public ModelAndView make(ModelAndView mnv) {
		String url = "project/newRoom.open";
		
		 ChatRoomForm form = new ChatRoomForm();
		
		mnv.addObject("form", form);
		mnv.setViewName(url);
		return mnv;
	}
	
	@RequestMapping("/room/new")
	public ModelAndView makeRoom(ChatRoomForm form,ModelAndView mnv){
        chatRoomRepository.createChatRoom(form.getName());
        String url = "project/rooms.open";
        mnv.addObject("rooms",chatRoomRepository.findAllRoom());
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
		String url="project/JobModify_success";
		
		
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
		String url = "project/doNotJob";
		
		jobService.doNotJob(jobCode);
			
		return url;
		
	}
	

	
	@RequestMapping(value="/doJob",method=RequestMethod.POST)
	public String doJob(String jobCode)throws Exception{
		String url = "project/doJob";
		
		jobService.doJob(jobCode);
		
		return url;
		
	}
	
	
	
	
	
	
	
	
	@RequestMapping("/jobDetail")
	public ModelAndView jobDetail(String jobCode,ModelAndView mnv)throws SQLException{
		String url="project/jobDetail.open";
		
		JobVO job = jobService.getJobInfo(jobCode);
		
		EmpVO emp = empService.getEmpById(job.getEmpId());
		
		mnv.addObject("job", job);
		mnv.addObject("emp", emp);
		mnv.setViewName(url);
		
		return mnv;
		
	}
	
	
	
	
	
	@RequestMapping("/main")
	public ModelAndView list(HttpSession session,ModelAndView mnv)throws Exception{
		String url="project/proList.open";
		
		EmpVO emp = (EmpVO)session.getAttribute("loginUser");
		String empId=emp.getEmpId();
		
		List<ProVO> doPro = proService.getListDoProById(empId);

		
		List<ProVO> AopPro = proService.getListAopProById(empId);
		
		
		List<ProVO> notPro = proService.getListNotProById(empId);
		

		String pCode = (String)session.getAttribute("pCode");
		
		if(pCode == null) {
			pCode = doPro.get(0).getpCode();
			session.setAttribute("pCode", pCode);
		}
		
		
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
	
	
	@RequestMapping(value="/projecter",method= RequestMethod.POST,produces="application/json;charset=utf-8")
	@ResponseBody
	public ResponseEntity<String> projecter(@RequestBody ProjecterCome pj,HttpSession session)throws Exception{
		ResponseEntity<String> entity=null;
		
		PjmVO pjm = pj.toPjmVO();
		
		proService.insertMember(pjm);
		
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
		String[] serviceList = proi.getpJob().split(",");
		
		
		mnv.addObject("serviceList", serviceList);
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
		
		JobVO job = Ji.toJobVO();
		job.setEmpId(emp.getEmpId());
		job.setpCode(pCode);
		
		List<JobVO> jobList = jobService.getProJobListById(job);
		
		ProVO proi=proService.getProInfo(pCode);
		
		mnv.addObject("proi", proi);
		mnv.addObject("jobList", jobList);
		mnv.addObject("pjmList",pjmList);
		mnv.setViewName(url);
		return mnv;
	}
	
	
	
	
	@RequestMapping("/ProRegistForm")
	public String proRegistForm()throws Exception{
		String url="project/proRegistForm";
		
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
		
		mnv.addObject("pro", pro);
		
		mnv.setViewName(url);
		
		return mnv;
	}
	
	
	
	@RequestMapping(value="/regist",method=RequestMethod.POST)
	public String proRegist(ProRegistCommand proReq,PjmVO pjm,HttpSession session)throws Exception{
		String url="project/regist_success";
		
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
		String url = "project/modify_success";
		
		ProVO pro=prom.toProVO();
		
		proService.updateProject(pro);
		
		mnv.addObject("pCode", pro.getpCode());
		mnv.setViewName(url);
		
		return mnv;
	}
	
	@RequestMapping(value="/doNotPro",method=RequestMethod.POST)
	public String doNotPro(String pCode)throws Exception{
		String url = "project/doNotProject";
		
		proService.notDoProject(pCode);
			
		return url;
		
	}
	

	
	@RequestMapping(value="/doPro",method=RequestMethod.POST)
	public String doPro(String pCode)throws Exception{
		String url = "project/doProject";
		
		proService.DoProject(pCode);
			
		return url;
		
	}
	
	
	
	
	
	
	/* 자료실 */
	@RequestMapping("/pa")
	public ModelAndView pa(HttpSession session,ModelAndView mnv,SearchCriteriaByPA cri)throws Exception{
		String url="project/paList.open";
		
		String pCode = (String)session.getAttribute("pCode");
		cri.setpCode(pCode);
		Map<String, Object> dataMap = proService.getPAList(cri);

		mnv.addObject("dataMap",dataMap);
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
	public String paRegist(ProPARegistCommand registReq,Model model, HttpServletRequest request)throws Exception {
		String url = "project/pa_regist_success";
		
		PAVO pa = registReq.toPAVO();
		List<PAAttachVO> attachList = GetAttachesAsMultipartFiles.paSave(registReq.getUploadFile(), PAfileUploadPath);
//		pa.setPaTitle((String)request.getAttribute("XSStitle"));
		pa.setAttachList(attachList);
		
		
		proService.registPA(pa);
		
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
		
		String url = "project/pa_modify_success";		
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

		String url="project/pa_remove_success";
		
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
	public String relegate(RelegateCommand relegateReq, HttpServletRequest request)throws Exception {
		
		String url = "project/relegate_success";	
		
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
		
		if (files.length > 0) { 
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
				zout.close();
			}catch(IOException e){ //Exception 
			
			}finally{ 
				if (zout != null){ 
					zout = null; 
				} 
			}
		}
		
		// DB저장 PR_ATTACH_PATH, EMP_ID, P_CODE 
		RelegateVO rlvo = relegateReq.toRelegateVO();
		
		rlvo.setPrAttachPath(relegateUploadPath + zipName);
		rlvo.setFinalAttachPath(PAfileUploadPath + "/" + finalFileName);
		rlvo.setEmpId(relegateReq.getEmpId());
		rlvo.setpCode(relegateReq.getpCode());
		
		proService.registRelegate(rlvo);
		
		return url;
	}
	
	
	
	
	
	@RequestMapping("/jobRegistForm")
	public ModelAndView jobRegistForm(HttpSession session,ModelAndView mnv)throws SQLException{
		String url="project/jobRegistForm.open";
		
		String pCode = (String)session.getAttribute("pCode");
		
		
		ProVO proi=proService.getProInfo(pCode);
		String[] serviceList = proi.getpJob().split(",");
		List<ProEmpVO> pjmList = proService.selectProMemberList(pCode);
		
		mnv.addObject("pjmList", pjmList);
		mnv.addObject("serviceList", serviceList);
		mnv.setViewName(url);
		return mnv;
		
	}
	
	
	
	@RequestMapping("/jobRegist")
	public String jobRegist(HttpSession session,JobRegistCommand jc)throws SQLException{
		String url="project/jobRegist_success";
		
		
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
		
		
		
		return url;
		
	}
	
	
	
	@RequestMapping("/issue")
	public ModelAndView projectIssueList(ModelAndView mnv,  HttpSession session) throws Exception{
		String url = "project/piList.open";
		
		String pCode = (String)session.getAttribute("pCode");
		
		List<PIVO> piList = proService.selectPIList(pCode);
		List<Object> piMileStone = proService.selectPIMileStoneList(pCode);
		List<Double> piMileStonePercent = new ArrayList<>();
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
			}
			if(percent == 0.0) {
				piMileStonePercent.add(0.0);
			}else {
				piMileStonePercent.add((percent/count)*100.0);
			}
			piMileStoneString += piMileStone.get(i);
			if(i != piMileStone.size()-1) {
				piMileStoneString += ",";
			}
		}
		
		mnv.addObject("piList",piList);
		mnv.addObject("piMileStone",piMileStoneString);
		mnv.addObject("piMileStonePercent",piMileStonePercent);
		
		mnv.setViewName(url);
		
		return mnv;
	}
	

	@RequestMapping("/piDetail/{piCode}")
	public ModelAndView projectIssueDetail (@PathVariable String piCode, ModelAndView mnv) throws Exception{
		String url = "project/piDetail.open";
		
		PIVO pi = proService.selectPI(piCode);
		List<PIVO> piList = proService.selectPIList(pi.getpCode());
		Double piMileStonePercent = 0.0;
		double count = 0;
		double percent = 0;
		for (int j = 0; j < piList.size(); j++) {
			if(piList.get(j).getPiMileStone().equals(pi.getPiMileStone())){
				count += 1;
				if(piList.get(j).getPiStatus() == 0) {
					percent+= 1;
				}
			}
		}
		if(percent == 0.0) {
			piMileStonePercent = 0.0;
		}else {
			piMileStonePercent = (percent/count)*100.0;
		}
		
		mnv.addObject("pi",pi);
		mnv.addObject("piMileStonePercent",piMileStonePercent);
		
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
		String url = "project/piComplete";
		
		proService.completePI(piCode);
		
		return url;
	}
	
	
	
	@RequestMapping(value="/piModify", method=RequestMethod.POST, produces = "text/plain;charset=utf-8")
	public ModelAndView projectIssueModify(ModelAndView mnv, ProPIModifyCommand piCommand) throws Exception{
		String url = "project/piModify_success";
		
		String piCode = piCommand.getPiCode();
		PIVO pi = piCommand.toPiVO();
		
		proService.updatePI(pi);
		
		mnv.addObject(piCode);
		mnv.setViewName(url);
		
		return mnv;
	}
	
	
	@RequestMapping("/piRemove")
	public String projectIssueRemove(String piCode) throws Exception{
		String url = "project/piRemove_success";
		
		proService.deletePI(piCode);
		
		return url;
	}
	
	
}












