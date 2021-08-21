package com.spring.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.spring.dto.QreplyVO;

public class QreplyDAOImpl implements QreplyDAO{
	private SqlSession session;
	public void setSqlSession(SqlSession session) {
		this.session = session;
	}
	
	@Override
	public List<QreplyVO> selectQreList(String qnaNo) throws SQLException {
		List<QreplyVO> qreList = session.selectList("Qreply-Mapper.selectQreList", qnaNo);
		
		return qreList;
	}

	@Override
	public void updateQre(QreplyVO qre) throws SQLException {
		session.update("Qreply-Mapper.updateQre", qre );
		
	}

	@Override
	public void deleteQre(String qnaNo) throws SQLException {
		session.update("Qreply-Mapper.deleteQre", qnaNo );
		
	}

	@Override
	public void insertQre(QreplyVO qre) throws SQLException {
		session.update("Qreply-Mapper.insertQre",  qre);
		
	}

	
	
	
	
	
	
	
	
	
	
	
}
