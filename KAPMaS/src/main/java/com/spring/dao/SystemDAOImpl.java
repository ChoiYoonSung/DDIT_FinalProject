package com.spring.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.spring.dto.SystemVO;

public class SystemDAOImpl implements SystemDAO{
	
	private SqlSession session;
	public void setSqlSession(SqlSession session) {
		this.session = session;
	}

	@Override
	public List<SystemVO> getSystemList() throws SQLException {
		
		 List<SystemVO> sysList = session.selectList("Sys-Mapper.getSystemList");
		
		return sysList;
	}

	@Override
	public SystemVO getSystemInfo(String sgCode) throws SQLException {
		
		SystemVO system = session.selectOne("Sys-Mapper.getSystemInfo", sgCode);
		
		return system;
	}

	@Override
	public void insertSystem(SystemVO system) throws SQLException {
		session.update("Sys-Mapper.insertSystem",system);
		
	}

	@Override
	public void updateSystem(SystemVO system) throws SQLException {
		session.update("Sys-Mapper.updateSystem",system);
		
	}

	@Override
	public void deleteSystem(String sgCode) throws SQLException {
		session.update("Sys-Mapper.deleteSystem",sgCode);
		
	}

	@Override
	public void increaseSystemCnt(String sgCode) throws SQLException {
		
		session.update("Sys-Mapper.increaseSystemCnt",sgCode);
		
	}

	@Override
	public void decreaseSystemCnt(String sgCode) throws SQLException {
		session.update("Sys-Mapper.decreaseSystemCnt",sgCode);
		
	}

	@Override
	public List<SystemVO> getGuideList(String keyword) {
		List<SystemVO> guideList = session.selectList("Sys-Mapper.getGuideList", keyword);
		return guideList;
	}

}
