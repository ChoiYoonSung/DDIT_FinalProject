package com.spring.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.spring.command.SearchCriteriaById;
import com.spring.dto.CoPVO;
import com.spring.dto.CopArchiveVO;
import com.spring.dto.CopFamilyDiscussionVO;
import com.spring.dto.CopMemberVO;
import com.spring.dto.EmpVO;
import com.spring.dto.ProVO;
import com.spring.dto.caAttachVO;
import com.spring.dto.familyDiscussionContentVO;
import com.spring.dto.shareProjectVO;

public interface CoPService {

	// Cop 리스트 조회
	List<CoPVO> getCopList() throws SQLException;

	// Cop 생성
	void create(CoPVO copVO) throws SQLException;

	// 참여중 CoP 조회
	Map<String, Object> getJoiningCopList(SearchCriteriaById cri) throws SQLException;

	// 소유중 CoP 조회
	Map<String, Object> getOwnCopList(SearchCriteriaById cri) throws SQLException;

	// Cop 정보 가져오기
	Map<String, Object> getCopInfo(String copCode) throws SQLException;

	// id 중복확인
	int doubleCheck(String copName) throws SQLException;

	// 참여자 많은 순으로 정렬 - cop main
	List<CoPVO> getLargestCopDescList() throws SQLException;

	// 토론방 많은 순으로 정렬 - cop main
	List<CoPVO> getLargestCopFdDescList() throws SQLException;

	// cop 가입신청
	void signUpToCop(CoPVO signUpInfo) throws SQLException;

	// cop detail 자료실 리스트 조회
	List<CopArchiveVO> getCopArchiveList(String copCode) throws SQLException;

	// cop detail 토론방 리스트 조회
	List<CopFamilyDiscussionVO> getCopDiscussionList(String copCode) throws SQLException;

	Map<String, Object> getJoiningCopListNotCri(String empId) throws SQLException;

	// 5개만
	List<CopFamilyDiscussionVO> getFamilyDiscussionList(SearchCriteriaById cri) throws SQLException;

	// 5개만
	List<CopArchiveVO> getRegistarchiveList(SearchCriteriaById cri) throws SQLException;
	
	Map<String, Object> getOwnCopListNotCri(String userId) throws SQLException;

	List<CopFamilyDiscussionVO> getJoinDiscussionNotCri(String userId) throws SQLException;

	List<CopArchiveVO> getMyArchiveList(String userId) throws SQLException;

	void registCA(CopArchiveVO ca) throws SQLException;

	CopArchiveVO getArchiveDetail(String caCode) throws SQLException;

	caAttachVO getAttachByCaAtNo(int caatno) throws SQLException;

	void removeAttachByCaAtNo(int caatno) throws SQLException;

	void modifyCa(CopArchiveVO ca) throws SQLException;

	void archiveRemove(String caCode) throws SQLException;

	void increaseArchiveViewCnt(String caCode) throws SQLException;

	// 공유 프로젝트 페이지 - 참여중 프로젝트 조회
	List<ProVO> getMyProjectList(String loginUserId);
	
	// 공유 프로젝트 페이지 - 패밀리 목록 조회
	List<EmpVO> getCopFamilyList(String copCode);

	// 프로젝트 공유 프로세스
	void projectDirectShare(shareProjectVO sp);
	
	// 프로젝트 공유 승인 요청
	void projectConfirmRequest(shareProjectVO sp);
	
	// COP 가입 신청자 조회
	List<EmpVO> getSignUpRequestMember(String copCode);
	
	// COP 가입 승인
	int approveCopSignUpRequest(CopMemberVO copMemberVO);
	
	// COP 가입 거절
	int rejectCopSignUpRequest(CopMemberVO copMemberVO);
	
	// COP 추방
	void exileMember(CopMemberVO copMember);
	
	// 가입 승인 및 반려 쪽지 전송
	void sendMail(CopMemberVO copMemberVO);
	
	// COP 수정
	void modifyCopInfo(CoPVO cop);
	
	// COP 토론방 개설
	void createFdis(CopFamilyDiscussionVO fdisVO);
	
	// COP 토론방 조회
	List<CopFamilyDiscussionVO> getCopFdisList(String copCode);
	
	// 내가 생성한 COP 토론방 조회
	List<CopFamilyDiscussionVO> getIcreatedFdisList(CopFamilyDiscussionVO fdisVO);
	
	// 토론방 내용 가져오기
	List<familyDiscussionContentVO> getFdisContentListByFdisCode(String fdisCode);
	
	// 토론방 내용 작성
	int registDiscussionContent(familyDiscussionContentVO fdisVO);
	
	// 토론방 정보 가져오기
	CopFamilyDiscussionVO getFdisInfoByFdisCode(String fdisCode);
	
	// 토론방 정보 수정
	int modifyFdisInfo(CopFamilyDiscussionVO fdisVO);
	
	// 
	EmpVO getEmpIDByFdisCode(String fdisCode);

	// 토론방 내용 먼저 지우고	
	int deleteDiscussionContent(String fdisCode);
	// 토론방 지움
	int deleteDiscussion(String fdisCode);
	
	// COP 초대 통해서 참여
	int joinCopToInvite(CoPVO param);

	List<caAttachVO> getArchiveAttach(String caCode) throws SQLException;

	void deleteArchiveAttachOnDB(String caCode);

	void deleteCopArchive(String copCode);

	void deleteCopMember(String copCode);

	int deleteCop(String copCode);

	List<CopFamilyDiscussionVO> getIcreatedFdisListOnMyCop(String userId);

	int getCopApproveRequestCnt(String copCode);

	
}
