package com.spring.dao;

import java.sql.SQLException;

import com.spring.dto.LikeVO;

public interface LikeDAO {
	
	void insertLike(LikeVO like)throws SQLException;
	void deleteLike(LikeVO like)throws SQLException;
	int likeCount(LikeVO like)throws SQLException;

}
