package com.spring.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.spring.dto.DfolderVO;

public class DfolderDAOImple implements DfolderDAO{

	private SqlSession session;
	public void setSqlSession(SqlSession session) {
		this.session = session;
	}
	
	@Override
	public void createFolder(DfolderVO df) throws SQLException {
		
		session.update("Dfolder-Mapper.createFolder", df);
		
	}

	@Override
	public void deleteFolder(String fId) throws SQLException {
		session.update("Dfolder-Mapper.deleteFolder", fId);
		
	}

	@Override
	public List<DfolderVO> findFolderById(String empId) throws SQLException {
		List<DfolderVO> dfList = session.selectList("Dfolder-Mapper.findFolderById", empId);
		
		return dfList;
	}

	
	
	
}
