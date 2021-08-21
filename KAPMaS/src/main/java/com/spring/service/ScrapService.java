 package com.spring.service;

import java.sql.SQLException;
import java.util.List;

import com.spring.dto.PRBVO;
import com.spring.dto.ScrapVO;

public interface ScrapService {
	
	List<ScrapVO> selectScrapList(String empId) throws SQLException;
	void insertScrap(ScrapVO scr) throws SQLException;
	void deleteScrap(ScrapVO scr)throws SQLException;
	int scrapCount(ScrapVO scr)throws SQLException;
	
	void deleteBdScrap(String bdCode) throws SQLException;
}
