package com.spring.service;

import java.sql.SQLException;
import java.util.List;

import org.springframework.aop.ThrowsAdvice;

import com.spring.dao.ScrapDAO;
import com.spring.dto.PRBVO;
import com.spring.dto.ScrapVO;

public class ScrapServiceImpl implements ScrapService {
	
	private ScrapDAO scrapDAO;
	public void setScrapDAO(ScrapDAO scrapDAO) {
		this.scrapDAO = scrapDAO;
	}
	
	@Override
	public List<ScrapVO> selectScrapList(String empId) throws SQLException {
		List<ScrapVO> scrapList = scrapDAO.selectScrapList(empId); 
		return scrapList;
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

	@Override
	public void deleteBdScrap(String bdCode) throws SQLException {
		scrapDAO.deleteBdScrap(bdCode);
	}


}
