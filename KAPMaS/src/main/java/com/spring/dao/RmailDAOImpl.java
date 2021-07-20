package com.spring.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import com.spring.command.SearchCriteriaById;
import com.spring.dto.RmailVO;

public class RmailDAOImpl  implements RmailDAO{
	
	
	private SqlSession session;
	public void setSqlSession(SqlSession session) {
		this.session = session;
	}
	

	@Override
	public List<RmailVO> selectRMailListById(String empId) throws SQLException {
		
		List<RmailVO> rmailList = session.selectList("RMail-Mapper.getReceiveMailListById",empId);
	
		
		return rmailList;
	}

	@Override
	public int selectSMailCounrListById(SearchCriteriaById crid) throws SQLException {
		int count = 0;
		
		count=session.selectOne("RMail-Mapper.getReceiveMailListCountById",crid);
		
		return count;
	}

	@Override
	public void receiveMail(RmailVO rmail) throws SQLException {
		session.update("RMail-Mapper.ReceiveMail",rmail);
		
		
	}

	@Override
	public RmailVO selectRmailInfo(String rmCode) throws SQLException {
		RmailVO rmail=session.selectOne("RMail-Mapper.getRmailInfo", rmCode);
		return rmail;
	}


	@Override
	public void deleteRmail(String rmCode) throws SQLException {
		
		session.update("RMail-Mapper.deleteRmailList", rmCode);
		
	}


	@Override
	public void readRmail(String rmCode) throws SQLException {
		
		session.update("RMail-Mapper.readRmail", rmCode);		
	}


	@Override
	public void deleteAllRmail(String rmCode) throws SQLException {
		session.update("RMail-Mapper.deleteAllRmail",rmCode);
		
	}


	@Override
	public RmailVO selectLastRMailById(String empId) {
		RmailVO rmail=session.selectOne("RMail-Mapper.getLastRmail", empId);
		return rmail;
	}

}
