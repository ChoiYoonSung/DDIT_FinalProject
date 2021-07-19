package com.spring.service;

import java.sql.SQLException;
import java.util.List;

import com.spring.dao.RankDAO;
import com.spring.dto.RankVO;

public class RankServiceImpl implements RankService{

	
	private RankDAO rankDAO;
	public void setRankDAO(RankDAO rankDAO) {
		this.rankDAO = rankDAO;
	}


	@Override
	public List<RankVO> getRankList() throws SQLException {
		
		List<RankVO> rankList=rankDAO.rankList();
		
		return rankList;
	}


	@Override
	public RankVO getRankListByCode(String rnkCode) throws SQLException {
		
		RankVO rank = rankDAO.getRankListByCode(rnkCode);
		
		return rank;
	}

	
	
	
	
	
	
}
