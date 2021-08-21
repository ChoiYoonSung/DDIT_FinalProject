package com.spring.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.spring.dto.PRBVO;

public class PRBDAOImpl implements PRBDAO {
	
	private SqlSession session;
	public void setSqlSession(SqlSession session) {
		this.session=session;
	}	

	@Override
	public List<PRBVO> getAllList() throws SQLException {
		List<PRBVO> list = session.selectList("PRB-Mapper.getAllList");
		return list;
	}

	@Override
	public int getAllListCount(String empId) throws SQLException {
		int cnt = session.selectOne("PRB-Mapper.getAllListCount", empId);
		return cnt;
	}

	@Override
	public List<PRBVO> selectSearchPrbListViewOrder() throws SQLException {
		List<PRBVO> list = session.selectList("PRB-Mapper.selectSearchPrbListViewOrder");
		return list;
	}

	@Override
	public List<PRBVO> selectSearchPrbListArr(String[] userArray) throws SQLException {
		List<PRBVO> list = session.selectList("PRB-Mapper.selectSearchPrbListArr", userArray);
		return list;
	}
	@Override
	public List<PRBVO> selectSearchPrbListArr2(String[] userArray) throws SQLException {
		List<PRBVO> list = session.selectList("PRB-Mapper.selectSearchPrbListArr2", userArray);
		return list;
	}

	@Override
	public PRBVO selectPrbByPrbCode(String prCode) throws SQLException {
		PRBVO prb = session.selectOne("PRB-Mapper.selectPrbByPrbCode", prCode);
		return prb;
	}

	@Override
	public void disablePrb(String prCode) throws SQLException {
		session.update("PRB-Mapper.disablePrb",prCode);

	}

	@Override
	public void increaseViewCnt(String prCode) throws SQLException {
		session.update("PRB-Mapper.increaseViewCnt",prCode);

	}

	@Override
	public void increaseLikeCnt(String prCode) throws SQLException {
		session.update("PRB-Mapper.increaseLikeCnt",prCode);

	}

	@Override
	public void decreaseLikeCnt(String prCode) throws SQLException {
		session.update("PRB-Mapper.decreaseLikeCnt",prCode);

	}

	@Override
	public String selectPrbSeqNext() throws SQLException {
		String prCode = session.selectOne("PRB-Mapper.selectSeqNext");
		return prCode;
	}

	@Override
	public PRBVO selectPrbByPcode(String pCode) throws SQLException {
		PRBVO prb = session.selectOne("PRB-Mapper.selectPrbByPcode", pCode);
		return prb;
	}

}
