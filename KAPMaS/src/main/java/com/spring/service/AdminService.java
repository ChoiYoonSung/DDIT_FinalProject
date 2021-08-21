package com.spring.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.spring.dto.BoardSelectVO;
import com.spring.dto.ReportVO;

public interface AdminService {
	List<ReportVO> selectReportList()throws SQLException;

	// 프로젝트 전체 통계 조회
	List<HashMap<String, Object>> getProjectStatistics() throws SQLException;
	
	// 프로젝트 등록 월별 조회
	List<HashMap<String, Object>> getProjectByMonth() throws SQLException;
	
	// 지식관리 등록 월별 조회
	List<HashMap<String, Object>> getKMSByMonth() throws SQLException;
	
	List<BoardSelectVO> getBoardOrderByRegDate() throws SQLException;
	
	Map<String, Integer> getBoardCount() throws SQLException;
	
	ReportVO getReportByBdCode(ReportVO rep) throws SQLException;
	
	void resetReport(ReportVO rep) throws SQLException;
	
	void deleteReport(ReportVO rep) throws SQLException;
}
