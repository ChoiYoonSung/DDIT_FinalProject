package com.spring.service;

import java.sql.SQLException;

import com.spring.dao.ScrapDAO;
import com.spring.dto.ScrapVO;

public class ScrapServiceImpl implements ScrapService {
	
	private ScrapDAO scrapDAO;
	public void setScrapDAO(ScrapDAO scrapDAO) {
		this.scrapDAO = scrapDAO;
	}

	@Override
	public void insertScrap(ScrapVO scr) throws SQLException {
		scrapDAO.insertScrap(scr);

	}

	@Override
	public void deleteScrap(ScrapVO scr) throws SQLException {
		scrapDAO.deleteScrap(scr);
	}

	@Override
	public int scrapCount(ScrapVO scr) throws SQLException {
		int cnt = scrapDAO.scrapCount(scr);
		return cnt;
	}

}
