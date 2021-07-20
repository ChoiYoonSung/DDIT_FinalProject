package com.spring.dao;

import java.sql.SQLException;

import org.apache.ibatis.session.SqlSession;

import com.spring.dto.ScrapVO;

public class ScrapDAOImpl implements ScrapDAO{
	
	private SqlSession session;
	public void setSqlSession(SqlSession session) {
		this.session=session;
	}

	@Override
	public void insertScrap(ScrapVO scr) throws SQLException {
		session.update("Scrap-Mapper.insertScrap", scr);
		
	}

	@Override
	public void deleteScrap(ScrapVO scr) throws SQLException {
		session.delete("Scrap-Mapper.deleteScrap", scr);
	}

	@Override
	public int scrapCount(ScrapVO scr) throws SQLException {
		int cnt = session.selectOne("Scrap-Mapper.scrapCount", scr);
		return cnt;
	}

}
