package com.spring.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.spring.command.SearchCriteria;
import com.spring.dto.AnswerLikeVO;
import com.spring.dto.AnswerVO;

public interface AnswerService {
	
	//앤서 등록
	void insertAnswer(AnswerVO answer)throws SQLException;
	
	//앤서 수정
	void updateAnswer(AnswerVO answer)throws SQLException;
	
	//앤서 삭제
	void deleteAnswer(String aCode,String khCode)throws SQLException;
	
	//앤서 리스트 가져오기
	 Map<String, Object> selectAnswerListPage(String khCode,SearchCriteria cri)throws SQLException;
	
	//앤서 카운트
	int countAnswer(String khCode) throws SQLException;
	
	//앤서
	List<AnswerVO> selectAnswerListById(String aWriter)throws SQLException;
	
	//앤서 추천 증가 
	void increaseCnt(String aCode, AnswerLikeVO aLike)throws SQLException;
	
	//앤서 추천 감소
	void decreaseCnt(String aCode, AnswerLikeVO aLike)throws SQLException;
	
	int answerLikeCount(AnswerLikeVO aLike)throws SQLException;
	
	
	
	
	
	
	
	
	
}
