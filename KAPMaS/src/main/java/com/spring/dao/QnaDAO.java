package com.spring.dao;

import java.sql.SQLException;
import java.util.List;

import com.spring.dto.QnaVO;

public interface QnaDAO {

	
	//qna 리스트 가져오기
	List<QnaVO> selectQnaList()throws SQLException;
	
	//qna 내용 확인
	QnaVO selectQnaInfo(String qnaNo)throws SQLException;
	
	//qna 수정하기
	void updateQna(QnaVO qna)throws SQLException;
	
	//qna 삭제 하기 
	void deleteQna(String qnaNo)throws SQLException;
	
	//qna 뷰카운트 올리기
	void increaseQnaCnt(String qnaNo)throws SQLException;
	
	//qna뷰카운트 내리기
	void decreaseQnaCnt(String qnaNo)throws SQLException;
	
	//qna 등록
	void insertQna(QnaVO qna)throws SQLException;
	
	//qna 번호 가져오기
	String getQnaSequenceNo();
	
	
	
	
}
