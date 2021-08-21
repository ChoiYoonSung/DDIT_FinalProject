package com.spring.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.spring.dto.ReportVO;

public class ReportDAOImpl implements ReportDAO {
	
	private SqlSession session;
	public void setSqlSession(SqlSession session) {
		this.session=session;
	}

	@Override
	public List<ReportVO> selectReportList() throws SQLException {
		List<ReportVO> reportList = session.selectList("Report-Mapper.selectReportBoardOrderByCount");
		return reportList;
	}
	@Override
	public void insertReport(ReportVO report) throws SQLException {
		session.update("Report-Mapper.insertReport", report);
	}

	@Override
	public void deleteReport(ReportVO report) throws SQLException {
		session.delete("Report-Mapper.deleteReport", report);
	}

	@Override
	public int reportCount(ReportVO report) throws SQLException {
		int count = session.selectOne("Report-Mapper.reportCount", report);
		return count;
	}

	@Override
	public void deleteReportAdmin(String bdCode) throws SQLException {
		session.update("Report-Mapper.deleteReportAdmin",bdCode);
	}

	@Override
	public void resetReportCntAdmin(ReportVO rep) throws SQLException {
		session.update("Report-Mapper.resetReportCntAdmin",rep);
	}

	@Override
	public void deleteBoardAdmin(ReportVO rep) throws SQLException {
		session.update("Report-Mapper.deleteBoardAdmin",rep);
	}

	@Override
	public ReportVO selectReportByBdCode(ReportVO rep) throws SQLException {
		ReportVO report = session.selectOne("Report-Mapper.selectReportByBdCode",rep);
		return report;
	}


}
