package com.spring.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.spring.command.SearchCriteriaById;
import com.spring.dto.CoPVO;
import com.spring.dto.CopArchiveVO;
import com.spring.dto.CopFamilyDiscussionVO;
import com.spring.dto.caAttachVO;

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
 
}
