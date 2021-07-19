package com.spring.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.spring.dto.PAAttachVO;
import com.spring.dto.PAVO;

public class PAAttachDAOImpl implements PAAttachDAO{
	
	private SqlSession session;
	public void setSqlSession(SqlSession session) {
		this.session=session;
				
	}

	@Override
	public void insertPAAttach(PAAttachVO attach) throws SQLException {
		session.update("PAAttach-Mapper.insertAttach",attach);
	}

	@Override
	public List<PAAttachVO> selectAttachesByPACode(String pacode) throws SQLException{
		List<PAAttachVO> attachList = session.selectList("PAAttach-Mapper.selectAttachByPACode",pacode);
		return attachList;
	}

	@Override
	public PAAttachVO selectAttachByPaAtNo(int paatno) throws SQLException {
		PAAttachVO attach=session.selectOne("PAAttach-Mapper.selectAttachByPaAtNo",paatno);
		return attach;
	}

	@Override
	public void deleteAttach(int paatno) throws SQLException {
		session.update("PAAttach-Mapper.deleteAttach",paatno);		
	}
	
	@Override
	public void deleteAttachAll(String pacode) throws SQLException {
		session.update("PAAttach-Mapper.deleteAllAttach",pacode);		
	}
	
	@Override
	public List<PAAttachVO> selectPAAllAttachesBypCode(String pCode) throws SQLException {
		List<PAAttachVO> attachList = session.selectList("PAAttach-Mapper.selectPAAllAttachesBypCode",pCode);
		return attachList;
	}

}
