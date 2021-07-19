package com.spring.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.spring.dto.RankVO;

public class RankDAOImpl implements RankDAO{

	private SqlSession session;
	public void setSqlSession(SqlSession session) {
		this.session = session;
	}
	
	
	@Override
	public List<RankVO> rankList() throws SQLException {
		
		List<RankVO> rankList=session.selectList("Rank-Mapper.getRankList");
		
		return rankList;
	}


	@Override
	public RankVO getRankListByCode(String rnkCode) throws SQLException {
		
		RankVO rank = session.selectOne("Rank-Mapper.getRankListByCode",rnkCode);
		
		return rank;
	}

	
	
	
}
