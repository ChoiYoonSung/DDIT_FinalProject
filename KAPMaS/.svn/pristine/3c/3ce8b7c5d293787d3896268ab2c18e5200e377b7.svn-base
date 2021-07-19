package com.spring.dao;

import java.sql.SQLException;
import java.util.List;

import com.spring.dto.PAAttachVO;
import com.spring.dto.PAVO;

public interface PAAttachDAO {
	public void insertPAAttach(PAAttachVO attach) throws SQLException;

	public List<PAAttachVO> selectAttachesByPACode(String pacode) throws SQLException;

	public PAAttachVO selectAttachByPaAtNo(int paatno) throws SQLException;

	public void deleteAttach(int paatno) throws SQLException;
	
	public void deleteAttachAll(String pacode) throws SQLException;
	
	public List<PAAttachVO> selectPAAllAttachesBypCode(String pCode) throws SQLException;
}
	