package com.spring.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.spring.dao.AdminDAO;
import com.spring.dao.ReportDAO;
import com.spring.dto.BoardSelectVO;
import com.spring.dto.ReportVO;

public class AdminServiceImpl implements AdminService{

	private ReportDAO reportDAO;
	public void setReportDAO(ReportDAO reportDAO) {
		this.reportDAO = reportDAO;
	}
	private AdminDAO adminDAO;
	public void setAdminDAO(AdminDAO adminDAO) {
		this.adminDAO = adminDAO;
	}

	@Override
	public List<ReportVO> selectReportList() throws SQLException {
		List<ReportVO> reportList = reportDAO.selectReportList();
		return reportList;
	}

	@Override
	public List<HashMap<String, Object>> getProjectStatistics() throws SQLException {
		return adminDAO.selectProjectStatistics();
	}

	@Override
	public List<HashMap<String, Object>> getProjectByMonth() throws SQLException {
		return adminDAO.selectProjectByMonth();
	}

	@Override
	public List<HashMap<String, Object>> getKMSByMonth() throws SQLException {
		return adminDAO.selectKMSByMonth();
	}
	
	@Override
	public List<BoardSelectVO> getBoardOrderByRegDate() throws SQLException {
		return adminDAO.selectBoardOrderByRegDate();
	}

	@Override
	public Map<String, Integer> getBoardCount() throws SQLException {
		Map<String, Integer> boardCount = new HashMap<String, Integer>();
		boardCount.put("empCnt", adminDAO.countEmployee());
		boardCount.put("reportCnt", adminDAO.countReport());
		boardCount.put("qnaCnt", adminDAO.countQNA());
		boardCount.put("guideCnt", adminDAO.countGuide());
		boardCount.put("noticeCnt", adminDAO.countNotice());
		
		return boardCount;
	}

	@Override
	public void resetReport(ReportVO rep) throws SQLException {
		reportDAO.deleteReportAdmin(rep.getBdCode());
		reportDAO.resetReportCntAdmin(rep);
	}

	@Override
	public void deleteReport(ReportVO rep) throws SQLException {
		reportDAO.deleteReportAdmin(rep.getBdCode());
		reportDAO.deleteBoardAdmin(rep);
	}

	@Override
	public ReportVO getReportByBdCode(ReportVO rep) throws SQLException {
		ReportVO report = reportDAO.selectReportByBdCode(rep);
		return report;
	}


}
