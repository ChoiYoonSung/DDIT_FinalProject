package com.spring.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.spring.dto.AsReplyVO;

public class AsReplyDAOImpl implements AsReplyDAO{
	private SqlSession session;

	public void setSqlsession(SqlSession session) {
		this.session = session;
	}
	
	@Override
	public void insertAsReply(AsReplyVO asReply) throws SQLException {
		session.update("AsReply-Mapper.insertAsReply",asReply );
		
	}

	@Override
	public void updateAsReply(AsReplyVO asReply) throws SQLException {
		session.update("AsReply-Mapper.insertAsReply",asReply );
		
	}

	@Override
	public void deleteAsReply(String aRpCode) throws SQLException {
		session.update("AsReply-Mapper.deleteAsReply",aRpCode);
	}

	
	@Override
	public List<AsReplyVO> selectAsReplyListPage(String aCode) throws SQLException {
		List<AsReplyVO> asReplyList = session.selectList("AsReply-Mapper.selectAsReplyList",aCode);
		
		return asReplyList;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
