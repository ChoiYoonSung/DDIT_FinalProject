package com.spring.dao;

import java.sql.SQLException;

import com.spring.dto.AnswerLikeVO;

public interface AnswerLikeDAO {
	
	void insertAnswerLike(AnswerLikeVO aLike)throws SQLException;
	void deleteAnswerLike(AnswerLikeVO aLike)throws SQLException;
	int answerLikeCount(AnswerLikeVO aLike)throws SQLException;

}
