package com.spring.dao;

import java.sql.SQLException;
import java.util.List;

import com.spring.command.SearchCriteria;
import com.spring.dto.AnswerVO;

public interface AnswerDAO {

	//앤서 등록
	void insertAnswer(AnswerVO answer)throws SQLException;
	
	//앤서 수정
	void updateAnswer(AnswerVO answer)throws SQLException;
	
	//앤서 삭제
	void deleteAnswer(String aCode)throws SQLException;
	
	//앤서 리스트 가져오기
	List<AnswerVO> selectAnswerListPage(String khCode,SearchCriteria cri)throws SQLException;
	
	//앤서 카운트
	int countAnswer(String khCode) throws SQLException;
	
	//앤서
	List<AnswerVO> selectAnswerListById(String aWriter)throws SQLException;
	
	//앤서 추천 증가 
	void increaseCnt(String aCode)throws SQLException;
	
	//앤서 추천 감소
	void decreaseCnt(String aCode)throws SQLException;
	
	
}
