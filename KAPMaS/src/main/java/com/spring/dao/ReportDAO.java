package com.spring.dao;

import java.sql.SQLException;
import java.util.List;

import com.spring.dto.ReportVO;

public interface ReportDAO {
	
	List<ReportVO> selectReportList()throws SQLException;
	void insertReport(ReportVO rep)throws SQLException;
	void deleteReport(ReportVO rep)throws SQLException;
	int reportCount(ReportVO rep)throws SQLException;

	void deleteReportAdmin(String bdCode) throws SQLException;
	void deleteBoardAdmin(ReportVO rep) throws SQLException;
	void resetReportCntAdmin(ReportVO rep) throws SQLException;
	ReportVO selectReportByBdCode(ReportVO rep) throws SQLException;
}
