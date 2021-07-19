package com.spring.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.spring.command.SearchCriteriaById;
import com.spring.dto.CoPVO;
import com.spring.dto.CopArchiveVO;
import com.spring.dto.CopFamilyDiscussionVO;

public interface CoPDAO {

	// COP 리스트 조회
	List<CoPVO> getCopList() throws SQLException;

	// COP 생성
	void createCop(CoPVO copVO) throws SQLException;

	// 참여중 cop 리스트 조회
	Map<String, Object> getJoiningCopList(SearchCriteriaById cri) throws SQLException;

	// 소유중 cop 리스트 조회
	Map<String, Object> getOwnCopList(SearchCriteriaById cri) throws SQLException;

	// cop 정보 가져오기
	Map<String, Object> getCopInfo(String copCode) throws SQLException;

	// cop name 중복확인
	int doubleCheck(String copName) throws SQLException;

	// 쓸라나 모르겠다
	int getCopCriteriaTotalCount(SearchCriteriaById cri) throws SQLException;

	// 참여자 많은순 정렬
	List<CoPVO> getLargestCopDescList() throws SQLException;

	// cop 토론방 많은순 정렬
	List<CoPVO> getLargestCopFdDescList() throws SQLException;

	// cop 가입신청
	void signUpRequestToCop(CoPVO signUpInfo) throws SQLException;

	// cop detail - 자료실 리스트 조회
	List<CopArchiveVO> getCopArchiveList(String copCode) throws SQLException;

	// cop detail - 토론방 리스트 조회
	List<CopFamilyDiscussionVO> getCopDiscussionList(String copCode);

	int getCopCriteriaOwnCop(SearchCriteriaById cri) throws SQLException;

	Map<String, Object> getJoiningCopListNotCri(String empId);

	List<CopFamilyDiscussionVO> getMyCopDiscussionList(SearchCriteriaById cri);

	List<CopArchiveVO> getArchiveListToCri(SearchCriteriaById cri);

	Map<String, Object> getOwnCopListNotCri(String userId) throws SQLException;

	List<CopFamilyDiscussionVO> getJoinDisussionList(String userId) throws SQLException;

	List<CopArchiveVO> getMyArchiveList(String userId) throws SQLException;
}
