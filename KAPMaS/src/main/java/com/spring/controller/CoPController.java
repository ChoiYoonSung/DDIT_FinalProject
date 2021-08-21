package com.spring.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.spring.command.CopRegistCommand;
import com.spring.command.SearchCriteriaById;
import com.spring.dto.CoPVO;
import com.spring.dto.CopArchiveVO;
import com.spring.dto.CopFamilyDiscussionVO;
import com.spring.dto.EmpVO;
import com.spring.dto.caAttachVO;
import com.spring.service.CoPService;
import com.spring.utils.MakeFileName;

@Controller
@RequestMapping(value = "/cop")
public class CoPController {

	@Autowired
	private CoPService copService;

	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public ModelAndView CopMain(ModelAndView mnv) throws SQLException {
		String url = "cop/main.open";

		List<CoPVO> largestCopList = copService.getLargestCopDescList();
		List<CoPVO> largestCopFdList = copService.getLargestCopFdDescList();

		mnv.addObject("largestCopList", largestCopList);
		mnv.addObject("largestCopFdList", largestCopFdList);

		mnv.setViewName(url);

		return mnv;
	}

	@RequestMapping(value = "/detail/{copCode}", method = RequestMethod.GET)
	public ModelAndView CopDetail(@PathVariable String copCode, ModelAndView mnv) throws SQLException {
		String url = "cop/detail.copopen";

		Map<String, Object> copInfoMap = copService.getCopInfo(copCode);
		int waitingApprove = copService.getCopApproveRequestCnt(copCode);
		
		mnv.addObject("copInfo", copInfoMap.get("copInfo"));
		mnv.addObject("copPer", copInfoMap.get("copPersonnel"));
		mnv.addObject("copApReq", waitingApprove);

		mnv.setViewName(url);

		return mnv;
	}

	@RequestMapping(value = "/mycop")
	public ModelAndView MyCop(HttpSession session, ModelAndView mnv, SearchCriteriaById cri) throws Exception {
		String url = "cop/mycop.open";
		EmpVO emp = (EmpVO) session.getAttribute("loginUser");
		String userName = emp.getEmpName();
		String userId = emp.getEmpId();
		cri.setEmpId(userId);

		// 참여중 cop
		Map<String, Object> joinCopMap = copService.getJoiningCopList(cri);
		// 소유중 cop
		Map<String, Object> ownCopMap = copService.getOwnCopList(cri);
		// 참여중 토론방
		List<CopFamilyDiscussionVO> fa = copService.getIcreatedFdisListOnMyCop(userName);
		// 작성한 자료실글
		List<CopArchiveVO> archiveList = copService.getRegistarchiveList(cri);

		// ------------------------------------

		// 참여중 cop
		mnv.addObject("joinCopVO", joinCopMap.get("joinCopVO"));
		mnv.addObject("joinCopCnt", joinCopMap.get("joinCopCnt"));
		mnv.addObject("pageMaker", joinCopMap.get("pageMaker"));

		// 소유중 cop
		mnv.addObject("ownCopVO", ownCopMap.get("ownCopVO"));
		mnv.addObject("ownCopCnt", ownCopMap.get("ownCopCnt"));
		mnv.addObject("ownPageMaker", ownCopMap.get("ownPagerMaker"));

		// 참여중 토론방
		mnv.addObject("myDiscussionList", fa);

		// 작성한 자료실글
		mnv.addObject("myArchiveList", archiveList);

		mnv.setViewName(url);

		return mnv;
	}

	@RequestMapping(value = "/coplist", method = RequestMethod.GET)
	public ModelAndView CopSearch(ModelAndView mnv) throws SQLException {
		String url = "cop/copsearch.open";

		List<CoPVO> copList = copService.getCopList();

		mnv.addObject("copList", copList);
		mnv.setViewName(url);

		return mnv;
	}

	// create Cop Form
	@RequestMapping(value = "/makecop", method = RequestMethod.GET)
	public String CreateCop() {
		String url = "cop/createcop.open";

		return url;
	}

	@RequestMapping(value = "/createCop", method = RequestMethod.POST)
	public String createSuccessCop(HttpSession session, CopRegistCommand copReq) throws SQLException {
		String url = "cop/create_success.open";

		EmpVO emp = (EmpVO) session.getAttribute("loginUser");
		String userName = emp.getEmpName();
		String userId = emp.getEmpId();
		CoPVO cop = copReq.toCopVO();
		cop.setCopOwner(userName);
		cop.setCopUserId(userId);

		copService.create(cop);

		return url;
	}

	@Resource(name = "copImgPath")
	private String copImgPath;

	@RequestMapping(value = "/profileImg", method = RequestMethod.POST, produces = "text/plain;charset=utf-8")
	@ResponseBody
	public ResponseEntity<String> profilePicture(@RequestParam("inputProfileImg") MultipartFile multi,
			String oldPicture) throws Exception {
		ResponseEntity<String> entity = null;

		String result = "";
		HttpStatus status = null;

		// 파일 저장 화깅ㄴ
		if ((result = savePicture(oldPicture, multi)) == null) {
			result = "업로드 실패했습니다.";
			status = HttpStatus.BAD_REQUEST;
		} else {
			status = HttpStatus.OK;
		}

		entity = new ResponseEntity<String>(result, status);

		return entity;
	}

	@RequestMapping(value = "/bannerImg", method = RequestMethod.POST, produces = "text/plain;charset=utf-8")
	@ResponseBody
	public ResponseEntity<String> bannerPicture(@RequestParam("inputBannerFile") MultipartFile multi, String oldPicture)
			throws Exception {
		ResponseEntity<String> entity = null;

		String result = "";
		HttpStatus status = null;

		// 파일 저장 화깅ㄴ
		if ((result = savePicture(oldPicture, multi)) == null) {
			result = "업로드 실패했습니다.";
			status = HttpStatus.BAD_REQUEST;
		} else {
			status = HttpStatus.OK;
		}

		entity = new ResponseEntity<String>(result, status);

		return entity;
	}

	private String savePicture(String oldPicture, MultipartFile multi) throws Exception {
		String fileName = null;

		if (!(multi == null || multi.isEmpty() || multi.getSize() > 1024 * 1024 * 5)) {

			String uploadPath = copImgPath;
			fileName = MakeFileName.toUUIDFileName(multi.getOriginalFilename(), "$$");
			File storeFile = new File(uploadPath, fileName);

			storeFile.mkdirs();

			multi.transferTo(storeFile);

			if (oldPicture != null && !oldPicture.isEmpty()) {
				File oldFile = new File(uploadPath, oldPicture);
				if (oldFile.exists()) {
					oldFile.delete();
				}
			}

		}
		return fileName;

	}

	@RequestMapping(value = "/doubleCheck", method = RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<String> idCheck(CoPVO copVo) throws Exception {

		ResponseEntity<String> entity = null;

		try {
			int cop = copService.doubleCheck(copVo.getCopName());

			if (cop != 0) {
				entity = new ResponseEntity<String>("duplicated", HttpStatus.OK);
			} else {
				entity = new ResponseEntity<String>("not duplicated", HttpStatus.OK);
			}
		} catch (SQLException e) {
			entity = new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
		}

		return entity;

	}

	@RequestMapping(value = "/getPicture", produces = "text/plain;charset=utf-8")
	@ResponseBody
	public ResponseEntity<byte[]> getPicture(String picture) throws Exception {
		InputStream in = null;
		ResponseEntity<byte[]> entity = null;
		String imgPath = this.copImgPath;

		System.out.println(imgPath);

		System.out.println(picture);

		try {
			in = new FileInputStream(new File(imgPath, picture));

			System.out.println(in);

			entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in), HttpStatus.CREATED);

			System.out.println(entity);
		} catch (IOException e) {
			e.printStackTrace();
			entity = new ResponseEntity<byte[]>(HttpStatus.INTERNAL_SERVER_ERROR);
		} finally {
			in.close();
		}
		return entity;
	}

	@RequestMapping(value = "/getPictureByCode/{copCode}", method = RequestMethod.GET, produces = "text/plain;charset=utf-8")
	@ResponseBody
	public ResponseEntity<byte[]> getPictureById(@PathVariable("copCode") String copCode) throws Exception {
		ResponseEntity<byte[]> entity = null;

		CoPVO copPicture = (CoPVO) copService.getCopInfo(copCode).get("copInfo");
		System.out.println(copPicture);
		String picture = copPicture.getCopProfileimg();
		entity = getPicture(picture);

		return entity;
	}

	@RequestMapping(value = "/getBannerByCode/{copCode}", method = RequestMethod.GET, produces = "text/plain;charset=utf-8")
	@ResponseBody
	public ResponseEntity<byte[]> getBannerById(@PathVariable("copCode") String copCode) throws Exception {
		ResponseEntity<byte[]> entity = null;

		CoPVO copPicture = (CoPVO) copService.getCopInfo(copCode).get("copInfo");
		System.out.println(copPicture);
		String picture = copPicture.getCopBannerimg();
		entity = getPicture(picture);

		return entity;
	}

	@RequestMapping(value = "/copInfo/{copCode}", method = RequestMethod.GET)
	public ModelAndView copInfoPage(@PathVariable("copCode") String copCode, ModelAndView mnv) throws SQLException {

		String url = "cop/copSignUp.open";

		Map<String, Object> dataMap = copService.getCopInfo(copCode);
		CoPVO copVO = (CoPVO) dataMap.get("copInfo");
		CoPVO copPer = (CoPVO) dataMap.get("copPersonnel");

		copVO.setCopPersonnel(copPer.getCopPersonnel());

		mnv.addObject("copVO", copVO);

		mnv.setViewName(url);

		return mnv;
	}

	@RequestMapping(value = "/copInfo/signUp", method = RequestMethod.POST)
	public String copSignUpSuccess(HttpSession session, String copCode) throws SQLException {
		String url = "cop/signUp_success.open";

		System.out.println(copCode);

		EmpVO emp = (EmpVO) session.getAttribute("loginUser");
		String loginUser = emp.getEmpId();

		CoPVO signUpInfo = new CoPVO();
		signUpInfo.setCopCode(copCode);
		signUpInfo.setCopUserId(loginUser);

		try {
			copService.signUpToCop(signUpInfo);
		} catch (Exception e) {
			url = "cop/signUp_fail.open";
		}

		return url;
	}

	@RequestMapping(value = "/joinCopDetail", method = RequestMethod.GET)
	public ModelAndView joinCopDetail(ModelAndView mnv, HttpSession session) throws SQLException {

		String url = "cop/joinCopDetail.open";
		EmpVO emp = (EmpVO) session.getAttribute("loginUser");
		String userId = emp.getEmpId();

		Map<String, Object> joinCopMap = copService.getJoiningCopListNotCri(userId);

		mnv.addObject("joinCopVO", joinCopMap.get("joinCopVO"));
		mnv.addObject("joinCopCnt", joinCopMap.get("joinCopCnt"));

		mnv.setViewName(url);

		return mnv;
	}

	@RequestMapping(value = "/ownCopDetail")
	public ModelAndView ownCopDetail(HttpSession session, ModelAndView mnv) throws Exception {
		String url = "cop/ownCopDetail.open";
		EmpVO emp = (EmpVO) session.getAttribute("loginUser");
		String userId = emp.getEmpId();

		// 소유중 cop
		Map<String, Object> ownCopMap = copService.getOwnCopListNotCri(userId);

		// 소유중 cop
		mnv.addObject("ownCopVO", ownCopMap.get("ownCopVO"));
		mnv.addObject("ownCopCnt", ownCopMap.get("ownCopCnt"));

		mnv.setViewName(url);

		return mnv;
	}

	@RequestMapping(value = "/joinDiscussionDetail")
	public ModelAndView joinDiscussionDetail(HttpSession session, ModelAndView mnv) throws Exception {
		String url = "cop/joinDiscussionDetail.open";
		EmpVO emp = (EmpVO) session.getAttribute("loginUser");
		String userName = emp.getEmpName();

		// 소유중 cop
		List<CopFamilyDiscussionVO> fa = copService.getIcreatedFdisListOnMyCop(userName);

		// 소유중 cop
		mnv.addObject("discussionList", fa);

		mnv.setViewName(url);

		return mnv;
	}

	@RequestMapping(value = "/myCopArchiveDetail")
	public ModelAndView myCopArchiveDetail(HttpSession session, ModelAndView mnv) throws Exception {
		String url = "cop/myCopArchiveDetail.open";
		EmpVO emp = (EmpVO) session.getAttribute("loginUser");
		String userId = emp.getEmpId();

		// 소유중 cop
		List<CopArchiveVO> archiveList = copService.getMyArchiveList(userId);

		// 소유중 cop
		mnv.addObject("archiveList", archiveList);

		mnv.setViewName(url);

		return mnv;
	}

	@RequestMapping(value = "/deleteCop")
	public ResponseEntity<String> deleteCop(String copCode) throws Exception {

		ResponseEntity<String> entity = null;

		String uploadPath = copImgPath;

		// 자료실 삭제 start
		String caCode = null;
		// 자료실 리스트
		List<CopArchiveVO> archiveList = copService.getCopArchiveList(copCode);
		
		for (CopArchiveVO archive : archiveList) {
			caCode = archive.getCaCode();
			List<caAttachVO> attachList = copService.getArchiveAttach(caCode);
			copService.deleteArchiveAttachOnDB(caCode);
			if (attachList != null) {
				for (caAttachVO attach : attachList) {
					String fileName = attach.getCaAtName();
					if (fileName != null && !fileName.isEmpty()) {
						File file = new File(uploadPath, fileName);
						if (file.exists()) {
							file.delete();
						}
					}
				}
			}
		}
		copService.deleteCopArchive(copCode);
		// 자료실 삭제 end
		
		// 토론방 삭제 start
		String fdisCode = null;
		// 토론방 리스트
		List<CopFamilyDiscussionVO> discussionList = copService.getCopDiscussionList(copCode);
		for(CopFamilyDiscussionVO fdis : discussionList) {
			fdisCode = fdis.getFdisCode();
			copService.deleteDiscussionContent(fdisCode);
			copService.deleteDiscussion(fdisCode);
		}
		// 토론방 삭제 end
		
		// COP 멤버 삭제
		copService.deleteCopMember(copCode);

		// COP 삭제
		int deleteCnt = copService.deleteCop(copCode);

		try {
			if (deleteCnt != 0) {
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
