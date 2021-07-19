package com.spring.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.spring.dto.TkAttachVO;

public class TkAttachDAOImpl implements TkAttachDAO {
	
	private SqlSession session;
	public void setSqlSession(SqlSession session) {
		this.session=session;
				
	}

	@Override
	public void insertAttach(TkAttachVO attach) throws SQLException {
		session.update("TkAttach-Mapper.insertAttach",attach);

	}

	@Override
	public void deleteAttach(int tkAtNo) throws SQLException {
		session.update("TkAttach-Mapper.deleteAttach",tkAtNo);

	}
	@Override
	public List<TkAttachVO> selectAttachesByTkCode(String tkCode) throws SQLException {
		List<TkAttachVO> attachList=session.selectList("TkAttach-Mapper.selectAttachesByTkCode",tkCode);
		return attachList;
	}

	@Override
	public void deleteAllAttach(int tkAtNo) throws SQLException {
		session.update("TkAttach-Mapper.deleteAllAttach",tkAtNo);

	}
	
	@Override
	public TkAttachVO selectAttachByTkAtNo(int tkAtNo) throws SQLException {
		TkAttachVO attach = session.selectOne("TkAttach-Mapper.selectAttachByTkAtNo",tkAtNo);
		return attach;
	}



}
