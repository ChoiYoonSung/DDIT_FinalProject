package com.spring.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.spring.dto.DepVO;

public class DepDAOImpl implements DepDAO{

	
	
	private SqlSession session;
	public void setSqlSession(SqlSession session) {
		this.session = session;
	}
	
	
	
	@Override
	public List<DepVO> depList() throws SQLException {
		
		List<DepVO> depList=session.selectList("Dep-Mapper.getDepList");
		
		return depList;
	}



	@Override
	public DepVO getDepListByCode(String depCode) throws SQLException {
		
		DepVO dep = session.selectOne("Dep-Mapper.getDepListByCode", depCode);
		
		return dep;
	}
	
	
	
	
	
	
	
	
	
	
}
