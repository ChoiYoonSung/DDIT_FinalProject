package com.spring.dao;

import java.sql.SQLException;
import java.util.List;

import com.spring.dto.TkAttachVO;

public interface TkAttachDAO {

	
	public List<TkAttachVO> selectAttachesByTkCode(String tkCode)throws SQLException;
	public TkAttachVO selectAttachByTkAtNo(int tkAtNo)throws SQLException;
	
	public void insertAttach(TkAttachVO attach) throws SQLException;

	public void deleteAttach(int tkAtNo) throws SQLException;

	public void deleteAllAttach(int tkAtNo)throws SQLException;
}
