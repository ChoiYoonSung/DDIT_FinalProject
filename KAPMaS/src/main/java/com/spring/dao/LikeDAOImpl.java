package com.spring.dao;

import java.sql.SQLException;

import org.apache.ibatis.session.SqlSession;

import com.spring.dto.LikeVO;

public class LikeDAOImpl implements LikeDAO {
	
	private SqlSession session;
	public void setSqlSession(SqlSession session) {
		this.session=session;
	}
	
	@Override
	public void insertLike(LikeVO like) throws SQLException {
		session.update("Like-Mapper.insertLike", like);
	}

	@Override
	public void deleteLike(LikeVO like) throws SQLException {
		session.delete("Like-Mapper.deleteLike", like);
	}

	@Override
	public int likeCount(LikeVO like) throws SQLException {
		int count = session.selectOne("Like-Mapper.likeCount", like);
		return count;
	}

}
