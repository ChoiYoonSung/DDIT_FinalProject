 package com.spring.service;

import java.sql.SQLException;

import com.spring.dto.ScrapVO;

public interface ScrapService {
	
	void insertScrap(ScrapVO scr) throws SQLException;
	void deleteScrap(ScrapVO scr)throws SQLException;
	int scrapCount(ScrapVO scr)throws SQLException;

}
