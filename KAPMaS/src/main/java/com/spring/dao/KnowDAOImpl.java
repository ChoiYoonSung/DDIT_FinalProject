package com.spring.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.spring.dto.KnowVO;
import com.spring.dto.TotalKnowledgeVO;

public class KnowDAOImpl implements KnowDAO{

	private SqlSession session;
	public void setSqlSession(SqlSession session) {
		this.session=session;
	}
	
	@Override
	public List<KnowVO> getAllKnowList() throws SQLException {
		
		List<KnowVO> knowList=session.selectList("Know-Mapper.getAllKnowList");
		
		return knowList;
	}
	@Override
	public List<KnowVO> getAllKnowListViewOrder() throws SQLException {
		
		List<KnowVO> knowList=session.selectList("Know-Mapper.getAllKnowListViewOrder");
		
		return knowList;
	}

	@Override
	public List<KnowVO> selectSearchKhListArr(String[] userArray) throws SQLException {
		
		List<KnowVO> khList=
				session.selectList("Know-Mapper.selectSearchKhListArr",userArray);
		
		return khList;
	}	
	@Override
	public List<KnowVO> selectSearchKhListArr2(String[] userArray) throws SQLException {
		
		List<KnowVO> khList=
				session.selectList("Know-Mapper.selectSearchKhListArr2",userArray);
		
		return khList;
	}	
	@Override
	public List<KnowVO> getKnowListByCategory(String khCategory) throws SQLException {
		
		List<KnowVO>knowList=session.selectList("Know-Mapper.getKnowListByCategory",khCategory);
		
		return knowList;
	}

	@Override
	public void insertKnow(KnowVO know) throws SQLException {
		
		session.update("Know-Mapper.insertKnow", know);
		
		
	}

	@Override
	public void updateKnow(KnowVO know) throws SQLException {
		
		session.update("Know-Mapper.updateKnow", know);
		
		
	}

	@Override
	public void deleteKnow(String khCode) throws SQLException {
		
		session.update("Know-Mapper.deleteKnow", khCode);
		
		
	}
	
	@Override
	public void disableKnow(String khCode) throws SQLException {
		
		session.update("Know-Mapper.disableKnow", khCode);
		
		
	}

	@Override
	public void increaseViewCnt(String khCode) throws SQLException {
		session.update("Know-Mapper.increaseViewCnt", khCode);
		
		
	}

	@Override
	public void increaseReportCnt(String khCode) throws SQLException {
		session.update("Know-Mapper.increaseReportCnt", khCode);
		
	}

	@Override
	public void decreaseReportCnt(String khCode) throws SQLException {
		session.update("Know-Mapper.decreaseReportCnt", khCode);
		
	}

	@Override
	public KnowVO selectInfoKnow(String khCode) throws SQLException {
		
		KnowVO know = session.selectOne("Know-Mapper.selectInfoKnow",khCode );
		
		return know;
	}

	@Override
	public List<KnowVO> getKnowListById(String empId) throws SQLException {
		List<KnowVO> knowList = session.selectList("Know-Mapper.getKnowListById",empId);
		return knowList;
	}

	@Override
	public void increaseLikecnt(String khCode) throws SQLException {
		session.update("Know-Mapper.increaseLikeCnt", khCode);
		
	}

	@Override
	public void decreaseLikecnt(String khCode) throws SQLException {
		session.update("Know-Mapper.decreaseLikeCnt", khCode);
		
	}

	@Override
	public void increaseReportcnt(String khCode) throws SQLException {
		session.update("Know-Mapper.increaseReportcnt", khCode);
		
	}

	@Override
	public void decreaseReportcnt(String khCode) throws SQLException {
		session.update("Know-Mapper.decreaseReportCnt", khCode);
		
	}

	
	
}
