package com.spring.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.spring.dto.BoardSelectVO;


public class AdminDAOImpl implements AdminDAO{
	
	private SqlSession session;
	public void setSqlSession(SqlSession session) {
		this.session = session;
	}
	
	
	
	@Override
	public List<HashMap<String, Object>> selectProjectStatistics() throws SQLException {
		return session.selectList("Admin-Mapper.selectProjectStatistics");
	}

	@Override
	public List<HashMap<String, Object>> selectProjectByMonth() throws SQLException {
		return session.selectList("Admin-Mapper.selectProjectByMonth");
	}

	@Override
	public List<HashMap<String, Object>> selectKMSByMonth() throws SQLException {
		return session.selectList("Admin-Mapper.selectKMSByMonth");
	}
	
	@Override
	public List<BoardSelectVO> selectBoardOrderByRegDate() throws SQLException {
		return session.selectList("Admin-Mapper.selectBoardOrderByRegDate");
	}

	
	@Override
	public int countEmployee() throws SQLException {
		return session.selectOne("Admin-Mapper.countEmployee");
	}

	@Override
	public int countReport() throws SQLException {
		// TODO Auto-generated method stub
		return session.selectOne("Admin-Mapper.countReport");
	}

	@Override
	public int countQNA() throws SQLException {
		// TODO Auto-generated method stub
		return session.selectOne("Admin-Mapper.countQNA");
	}

	@Override
	public int countGuide() throws SQLException {
		return session.selectOne("Admin-Mapper.countGuide");
	}

	@Override
	public int countNotice() throws SQLException {
		return session.selectOne("Admin-Mapper.countNotice");
	}



}
