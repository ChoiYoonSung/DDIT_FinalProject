package com.spring.dao;

import java.sql.SQLException;

import org.apache.ibatis.session.SqlSession;

import com.spring.dto.AnswerLikeVO;
import com.spring.dto.LikeVO;

public class AnswerLikeDAOImpl implements AnswerLikeDAO {
	
	private SqlSession session;
	public void setSqlSession(SqlSession session) {
		this.session=session;
	}
	
	@Override
	public void insertAnswerLike(AnswerLikeVO aLike) throws SQLException {
		session.update("AnswerLike-Mapper.insertAnswerLike", aLike);
	}

	@Override
	public void deleteAnswerLike(AnswerLikeVO aLike) throws SQLException {
		session.delete("AnswerLike-Mapper.deleteAnswerLike", aLike);
	}

	@Override
	public int answerLikeCount(AnswerLikeVO aLike) throws SQLException {
		int count = session.selectOne("AnswerLike-Mapper.answerLikeCount", aLike);
		
		return count;
	}

}
