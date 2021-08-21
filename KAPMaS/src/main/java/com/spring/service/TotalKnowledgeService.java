package com.spring.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.spring.command.SearchCriteria;
import com.spring.dto.LikeVO;
import com.spring.dto.ReportVO;
import com.spring.dto.TkAttachVO;
import com.spring.dto.TotalKnowledgeVO;


public interface TotalKnowledgeService {

	// 글조회
	TotalKnowledgeVO getTk(String tkCode) throws SQLException;

	// 글작성
	void regist(TotalKnowledgeVO tk) throws SQLException;

	// 글수정
	void modify(TotalKnowledgeVO tk) throws SQLException;

	// 글삭제
	void remove(String tkCode) throws SQLException;
	void disable(String tkCode) throws SQLException;
	
	// 리스트조회
	Map<String, Object> getList(SearchCriteria cri) throws SQLException, Exception;
	Map<String, Object> getList2(SearchCriteria cri) throws SQLException, Exception;
	List<TotalKnowledgeVO> getListList() throws SQLException, Exception;
	
	// 검색
	Map<String, Object> getListArr(String[] userArray) throws SQLException, Exception;
	Map<String, Object> getListArr2(String[] userArray) throws SQLException, Exception;
	
	//본문 이미지파일명으로 가져오기
	TotalKnowledgeVO findFileInContent(String fileName)throws SQLException;
	
	//첨부파일 조회
	TkAttachVO getAttachByTkAtNo(int tkAtNo)throws SQLException;
	
	//파일정보 삭제
	void removeAttachByTkAtNo(int tkAtNo)throws SQLException;
	

	// 글읽기(조회수증가)
	TotalKnowledgeVO read(String tkCode) throws SQLException;
	// 신고하기
	void report(String tkCode, ReportVO rep) throws SQLException;
	void reportCancel(String tkCode, ReportVO rep) throws SQLException;
	int reportCount(ReportVO rep) throws SQLException;
	// 추천하기
	void like(String tkCode, LikeVO like) throws SQLException;
	void likeCancel(String tkCode, LikeVO like) throws SQLException;
	int likeCount(LikeVO like) throws Exception;
}
