package com.spring.dao;

import java.sql.SQLException;

import com.spring.dto.ReportVO;

public interface ReportDAO {
	
	void insertReport(ReportVO rep)throws SQLException;
	void deleteReport(ReportVO rep)throws SQLException;
	int reportCount(ReportVO rep)throws SQLException;

}
