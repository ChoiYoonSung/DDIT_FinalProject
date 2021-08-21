package com.spring.service;

import java.sql.SQLException;
import java.util.List;

import com.spring.dao.AsReplyDAO;
import com.spring.dto.AsReplyVO;

public class AsReplyServiceImpl implements AsReplyService{
	
	private AsReplyDAO asReplyDAO;
	public void setAsReplyDAO(AsReplyDAO asReplyDAO) {
		this.asReplyDAO = asReplyDAO;
	}

	
	@Override
	public void insertAsReply(AsReplyVO asReply) throws SQLException {
		
		asReplyDAO.insertAsReply(asReply);
		
	}

	@Override
	public void updateAsReply(AsReplyVO asReply) throws SQLException {
		
		asReplyDAO.updateAsReply(asReply);
		
	}

	@Override
	public void deleteAsReply(String aRpCode) throws SQLException {
		
		
		asReplyDAO.deleteAsReply(aRpCode);
		
	}

	@Override
	public List<AsReplyVO> selectAsReplyListPage(String aCode) throws SQLException {
		List<AsReplyVO> asReplyList = asReplyDAO.selectAsReplyListPage(aCode);
		
		return asReplyList;
	}

}
