package com.spring.service;

import java.sql.SQLException;
import java.util.List;

import com.spring.dao.SystemDAO;
import com.spring.dto.SystemVO;

public class SystemServiceImpl implements SystemService{

	private SystemDAO systemDAO;
	public void setSystemDAO(SystemDAO systemDAO) {
		this.systemDAO = systemDAO;
	}

	@Override
	public List<SystemVO> getSystemList() throws SQLException {
		
		List<SystemVO> sysList = systemDAO.getSystemList();
		
		
		return sysList;
	}

	@Override
	public SystemVO getSystemInfo(String sgCode) throws SQLException {
		
		SystemVO system = systemDAO.getSystemInfo(sgCode);
		
		
		return system;
	}

	@Override
	public void insertSystem(SystemVO system) throws SQLException {
		systemDAO.insertSystem(system);
		
	}

	@Override
	public void updateSystem(SystemVO system) throws SQLException {
		
		systemDAO.updateSystem(system);
		
	}

	@Override
	public void deleteSystem(String sgCode) throws SQLException {
		
		
		systemDAO.deleteSystem(sgCode);
		
	}

	@Override
	public void increaseSystemCnt(String sgCode) throws SQLException {
		systemDAO.increaseSystemCnt(sgCode);
		
	}

	@Override
	public void decreaseSystemCnt(String sgCode) throws SQLException {
		
		systemDAO.decreaseSystemCnt(sgCode);
		
	}

	@Override
	public List<SystemVO> getGuideList(String keyword) {
		List<SystemVO> guideList = systemDAO.getGuideList(keyword);
		return guideList;
	}

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
