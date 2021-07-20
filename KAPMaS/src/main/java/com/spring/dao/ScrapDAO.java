package com.spring.dao;

import java.sql.SQLException;

import com.spring.dto.ScrapVO;

public interface ScrapDAO {
	
	void insertScrap(ScrapVO scr)throws SQLException;
	void deleteScrap(ScrapVO scr)throws SQLException;
	int scrapCount(ScrapVO scr)throws SQLException;

}
