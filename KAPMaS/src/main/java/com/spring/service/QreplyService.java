package com.spring.service;

import java.sql.SQLException;
import java.util.List;

import com.spring.dto.QreplyVO;

public interface QreplyService {

	
	
	//qna 댓글 가져오기
	List<QreplyVO> selectQreList(String qnaNo)throws SQLException;
	
	//qna 댓글 수정
	void updateQre(QreplyVO qre)throws SQLException;
	
	
	//qna 댓글 삭제
	void deleteQre(String qnaNo)throws SQLException;
	
	
	//qna 댓글 입력
	void insertQre(QreplyVO qre)throws SQLException;
	
	
	
}
