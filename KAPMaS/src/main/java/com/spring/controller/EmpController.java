package com.spring.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.IOUtils;
import org.omg.IOP.ENCODING_CDR_ENCAPS;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.spring.command.EmpModifyCommand;
import com.spring.command.EmpRegistCommand;
import com.spring.command.EmpSecondCommand;
import com.spring.dto.DepVO;
import com.spring.dto.EmpVO;
import com.spring.dto.RankVO;
import com.spring.service.DepService;
import com.spring.service.EmpService;
import com.spring.service.RankService;
import com.spring.utils.MakeFileName;

import oracle.net.aso.s;

@Controller
@RequestMapping("/emp")
public class EmpController {

	@Autowired
	private EmpService empService;

	@Autowired
	private DepService depService;

	@Autowired
	private RankService rankService;

	@RequestMapping("/secondLoginForm")
	public String secondLoginForm(ModelAndView mnv) {
		String url = "emp/secondLoginForm.open";

		return url;
	}

	@RequestMapping("/main")
	public String main() {
		String url = "member/main.open";
		return url;
	}

	@RequestMapping(value = "/registForm", method = RequestMethod.GET)
	public ModelAndView registForm(ModelAndView mnv) throws SQLException {
		String url = "emp/regist.open";

		List<DepVO> depList = depService.getDepList();
		List<RankVO> rankList = rankService.getRankList();

		mnv.addObject("depList", depList);
		mnv.addObject("rankList", rankList);

		mnv.setViewName(url);

		return mnv;
	}

	@RequestMapping(value = "/findForm", method = RequestMethod.GET)
	public String findForm() throws SQLException {
		String url = "emp/find.open";

		return url;
	}

	@Resource(name = "imgPath")
	private String imgPath;

	@RequestMapping(value = "/img", method = RequestMethod.POST, produces = "text/plain;charset=utf-8")
	@ResponseBody
	// httpparseer가 dispather에 있어서 우리는 파라미터만 MultipartFile로 받기만 하면 쓸수있다.
	public ResponseEntity<String> img(@RequestParam("imgFile") MultipartFile multi, String oldImg) throws Exception {
		ResponseEntity<String> entity = null;

		String result = "";
		HttpStatus status = null;

		// 파일 저장확인
		if ((result = savePicture(oldImg, multi)) == null) {

			result = "업로드 실패했습니다";
			status = HttpStatus.BAD_REQUEST;

		} else {
			status = HttpStatus.OK;
		}

		entity = new ResponseEntity<String>(result, status);

		return entity;
	}

	private String savePicture(String oldImg, MultipartFile multi) throws Exception {
		String fileName = null;

		// 파일유무확인
		if (!(multi == null || multi.isEmpty() || multi.getSize() > 1024 * 1024 * 5)) {

			// 파일저장폴더 설정
			String uploadPath = imgPath;
			fileName = MakeFileName.toUUIDFileName(multi.getOriginalFilename(), "$$");
			File storeFile = new File(uploadPath, fileName);

			storeFile.mkdirs();

			// local HDD에 저장
			multi.transferTo(storeFile);

			if (oldImg != null && !oldImg.isEmpty()) {
				File oldFile = new File(uploadPath, oldImg);
				if (oldFile.exists()) {
					oldFile.delete();
				}
			}
		}
		return fileName;

	}

	@RequestMapping(value = "/getPicture", produces = "text/plain;charset=utf-8")
	@ResponseBody
	public ResponseEntity<byte[]> getPicture(String empImg) throws Exception {
		InputStream in = null;
		ResponseEntity<byte[]> entity = null;
		String imgPath = this.imgPath;
		System.out.println("-------------img -- " + empImg);
		System.out.println("-------------imgPath -- " + imgPath);
		try {

			in = new FileInputStream(new File(imgPath, empImg));

			entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in), HttpStatus.CREATED);

		} catch (Exception e) {

			e.printStackTrace();
			entity = new ResponseEntity<byte[]>(HttpStatus.INTERNAL_SERVER_ERROR);

		} finally {
			in.close();
		}

		return entity;

	}

	@RequestMapping("/idCheck")
	@ResponseBody
	public ResponseEntity<String> idCheck(String empId) throws Exception {
		ResponseEntity<String> entity = null;

		try {

			EmpVO emp = empService.getEmpById(empId);

			if (emp != null) {
				entity = new ResponseEntity<String>("duplicated", HttpStatus.OK);
			} else {
				entity = new ResponseEntity<String>("", HttpStatus.OK);
			}

		} catch (Exception e) {
			entity = new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);

		}

		return entity;

	}

	@RequestMapping(value = "/regist", method = RequestMethod.POST)
	public ModelAndView regist(EmpRegistCommand empReq, ModelAndView mnv) throws Exception {

		String url = "emp/regist_success.open";

		EmpVO emp = empReq.toEmpVO();

		String pwd = MakeFileName.toUUIDFileName("KAPMaS", "");
		emp.setEmpAuth("사원");
		emp.setEmpPwd(pwd);

		empService.regist(emp);

		empService.sendMail(mnv, emp.getEmpEmail(), pwd);
		mnv.setViewName(url);

		return mnv;

	}

	@RequestMapping(value = "/find", method = RequestMethod.GET)
	public String find(EmpRegistCommand empReq, ModelAndView mnv) throws Exception {
		String url = "";
		EmpVO emp = empReq.toEmpVO2();
		EmpVO emp2 = empService.getEmpById(emp.getEmpId());

		if (emp2 != null) {
			url = "emp/find_success.open";

			String pwd = MakeFileName.toUUIDFileName("KAPMaS", "");

			emp.setEmpPwd(pwd);

			empService.reset(emp);
			
			empService.sendMail(mnv,emp.getEmpEmail(),pwd);
			
		}else {
			url="emp/find_fail.open";
		}
		return url;
	}
	@RequestMapping(value = "/detail/{empId}", method = RequestMethod.GET)
	public ModelAndView detail(@PathVariable String empId, ModelAndView mnv) throws Exception {
		String url = "emp/detail.open";

		EmpVO emp = new EmpVO();

		emp = empService.getEmpById(empId);

		List<DepVO> depList = depService.getDepList();
		List<RankVO> rankList = rankService.getRankList();

		mnv.addObject("emp", emp);
		mnv.addObject("depList", depList);
		mnv.addObject("rankList", rankList);
		mnv.setViewName(url);

		return mnv;
	}

	@RequestMapping(value = "/modify/{empId}", method = RequestMethod.GET)
	public ModelAndView modifyForm(@PathVariable String empId, ModelAndView mnv) throws Exception {
		String url = "emp/modify.open";

		EmpVO emp = null;
		emp = empService.getEmpById(empId);

		mnv.addObject("emp", emp);

		List<DepVO> depList = depService.getDepList();
		List<RankVO> rankList = rankService.getRankList();

		mnv.addObject("depList", depList);
		mnv.addObject("rankList", rankList);

		mnv.setViewName(url);

		return mnv;
	}

	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	public ModelAndView modify(EmpModifyCommand modifyReq, HttpSession session, ModelAndView mnv) throws Exception {
		String url = "emp/modify_success.open";

		EmpVO emp = modifyReq.toParseEmp();

		// 신규파일 변경 및 기존 파일 삭제
		String fileName = savePicture(modifyReq.getOldImg(), modifyReq.getEmpImg());
		emp.setEmpImg(fileName);

		// 파일변경 없을시 기존 파일명 유지
		if (modifyReq.getEmpImg().isEmpty()) {
			emp.setEmpImg(modifyReq.getOldImg());
		}

		// 로그인 사용자의 경우 수정된 정보로 session 업로드
		EmpVO loginUser = (EmpVO) session.getAttribute("loginUser");
		if (loginUser != null && emp.getEmpId().equals(loginUser.getEmpId())) {
			// DB내용 수정
			empService.modify(emp);

			emp.setEmpAuth(loginUser.getEmpAuth());
			session.setAttribute("loginUser", emp);
		}

		mnv.addObject("emp", empService.getEmpById(modifyReq.getEmpId()));

		mnv.setViewName(url);
		return mnv;

	}

	@RequestMapping(value = "/secondLogin", method = RequestMethod.POST)
	public ModelAndView secondLogin(EmpSecondCommand modifyReq, HttpSession session, ModelAndView mnv)
			throws Exception {
		String url = "emp/secondLogin_success.open";

		EmpVO emp = modifyReq.toParseEmp();

		// 신규파일 변경 및 기존 파일 삭제
		String fileName = savePicture(modifyReq.getOldImg(), modifyReq.getEmpImg());
		emp.setEmpImg(fileName);

		// 파일변경 없을시 기존 파일명 유지
		if (modifyReq.getEmpImg().isEmpty()) {
			emp.setEmpImg(modifyReq.getOldImg());
		}

		// DB내용 수정
		empService.seccondEmp(emp);

		// 로그인 사용자의 경우 수정된 정보로 session 업로드
//		EmpVO loginUser = (EmpVO) session.getAttribute("loginUser");
		EmpVO loginEmp = empService.getEmpById(emp.getEmpId());
//		if(loginUser != null && loginEmp.getEmpId().equals(loginUser.getEmpId())) {
		session.setAttribute("loginUser", loginEmp);
//		}

		mnv.setViewName(url);
		return mnv;

	}

	@RequestMapping(value = "/remove", method = RequestMethod.GET)
	public String remove(String id, HttpSession session, Model model) throws SQLException {
		String url = "member/remove_success.open";

		EmpVO emp;

		// 이미지 파일을 삭제
		emp = empService.getEmpById(id);

		String savePath = this.imgPath;
		File imageFile = new File(savePath, emp.getEmpImg());
		if (imageFile.exists()) {
			imageFile.delete();
		}

		// DB삭제
		empService.remove(id);

		// 삭제되는 회원이 로그인 회원인경우 로그아웃을 해야함
		EmpVO loginUser = (EmpVO) session.getAttribute("loginUser");
		if (loginUser.getEmpId().equals(emp.getEmpId())) {
			session.invalidate();
		}

		model.addAttribute("emp", emp);

		return url;
	}

	@RequestMapping(value = "/getPictureById/{empId}", produces = "text/plain;charset=utf-8", method = RequestMethod.GET)
	@ResponseBody
	public ResponseEntity<byte[]> getPictureById(@PathVariable("empId") String empId) throws Exception {

		ResponseEntity<byte[]> entity = null;
		String picture = empService.getEmpById(empId).getEmpImg();
		entity = getPicture(picture);

		return entity;

	}

	/*
	 * @RequestMapping(value="/mail",method=RequestMethod.GET) public void
	 * mailGet()throws Exception{}
	 * 
	 * 
	 * @RequestMapping(value="/mail",method=RequestMethod.POST,produces=
	 * "text/plain;charset=utf-8") public ModelAndView
	 * mailPost(@ModelAttribute("mailRequest")MailRequestCommand mail,
	 * HttpServletRequest request,ModelAndView mnv)throws Exception{
	 * 
	 * 
	 * String uploadPath=request.getSession().getServletContext().getRealPath(
	 * "resource/mail_attach"); mnv.addObject("mailRequest",mail);
	 * mnv.addObject("uploadPath",uploadPath);
	 * 
	 * 
	 * 
	 * memberService.sendMail(mnv);
	 * 
	 * return mnv;
	 * 
	 * }
	 */

}
