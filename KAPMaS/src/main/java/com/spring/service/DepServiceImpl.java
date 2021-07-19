package com.spring.service;

import java.sql.SQLException;
import java.util.List;

import com.spring.dao.DepDAO;
import com.spring.dto.DepVO;

public class DepServiceImpl implements DepService{

	
	private DepDAO depDAO;
	public void setDepDAO(DepDAO depDAO) {
		this.depDAO = depDAO;
	}


	
	
	@Override
	public List<DepVO> getDepList() throws SQLException {
		
		List<DepVO> depList=depDAO.depList();
		
		
		return depList;
	}




	@Override
	public DepVO getDepListByCode(String depCode) throws SQLException {
		
		DepVO dep = depDAO.getDepListByCode(depCode);
		
		
		return dep;
	}

	
	
	
	
	
	
	
	
	
	
	
}
