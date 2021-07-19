package com.spring.dao;

import java.sql.SQLException;
import java.util.List;

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
	public List<RmailVO> selectRMailListById(SearchCriteriaById crid) throws SQLException {
		int offset = crid.getStartRowNum();
		int limit = crid.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset,limit);
		
		List<RmailVO> rmailList = session.selectList("RMail-Mapper.getReceiveMailListById", crid, rowBounds);
	
		
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

}
