package com.spring.dao;

import java.sql.SQLException;

import org.apache.ibatis.session.SqlSession;

import com.spring.dto.ReportVO;

public class ReportDAOImpl implements ReportDAO {
	
	private SqlSession session;
	public void setSqlSession(SqlSession session) {
		this.session=session;
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

}
