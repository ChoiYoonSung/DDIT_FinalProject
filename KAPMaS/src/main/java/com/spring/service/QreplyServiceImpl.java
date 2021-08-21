package com.spring.service;

import java.sql.SQLException;
import java.util.List;

import com.spring.dao.QreplyDAO;
import com.spring.dto.QreplyVO;

public class QreplyServiceImpl implements QreplyService{

	private QreplyDAO qreplyDAO;
	public void setQreplyDAO(QreplyDAO qreplyDAO) {
		this.qreplyDAO = qreplyDAO;
	}

	@Override
	public List<QreplyVO> selectQreList(String qnaNo) throws SQLException {
		List<QreplyVO> qreList = qreplyDAO.selectQreList(qnaNo);
		
		return qreList;
	}

	@Override
	public void updateQre(QreplyVO qre) throws SQLException {
		qreplyDAO.updateQre(qre);
		
	}

	@Override
	public void deleteQre(String qnaNo) throws SQLException {
		qreplyDAO.deleteQre(qnaNo);
		
	}

	@Override
	public void insertQre(QreplyVO qre) throws SQLException {
		qreplyDAO.insertQre(qre);
		
	}

	
	
	
}
