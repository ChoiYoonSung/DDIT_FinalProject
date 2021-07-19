package com.spring.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import com.spring.command.SearchCriteria;
import com.spring.dto.TotalKnowledgeVO;

public class TotalKnowledgeDAOImpl implements TotalKnowledgeDAO {
	
	private SqlSession session;
	public void setSqlSession(SqlSession session) {
		this.session=session;
	}

	@Override
	public TotalKnowledgeVO selectTkByTkCode(String tkCode) throws SQLException {
		TotalKnowledgeVO tk=session.selectOne("Totalknowledge-Mapper.selectTkByTkCode",tkCode);
		return tk;
	}

	@Override
	public void insertTk(TotalKnowledgeVO tk) throws SQLException {
		session.update("Totalknowledge-Mapper.insertTk",tk);

	}

	@Override
	public void updateTk(TotalKnowledgeVO tk) throws SQLException {
		session.update("Totalknowledge-Mapper.updateTk",tk);

	}

	@Override
	public void deleteTk(String tkCode) throws SQLException {
		session.update("Totalknowledge-Mapper.deleteTk",tkCode);

	}

	@Override
	public List<TotalKnowledgeVO> selectTkCriteria(SearchCriteria cri) throws SQLException {
		
		int offset=cri.getStartRowNum();
		int limit=cri.getPerPageNum();
		RowBounds rowBounds=new RowBounds(offset,limit);
		
		List<TotalKnowledgeVO> tkList=
		   session.selectList("Totalknowledge-Mapper.selectSearchTkList",cri,rowBounds);
			
		return tkList;
	}
	
	@Override
	public List<TotalKnowledgeVO> getAllList() throws SQLException {
		List<TotalKnowledgeVO> list= session.selectList("Totalknowledge-Mapper.getAllList");
		return list;
	}

	@Override
	public int selectTkCriteriaTotalCount(SearchCriteria cri) throws SQLException {
		int count=session.selectOne("Totalknowledge-Mapper.selectSearchTkListCount",cri);
		return count;
	}

	@Override
	public TotalKnowledgeVO selectTkByFileName(String fileName) throws SQLException {
		TotalKnowledgeVO tk = session.selectOne("Totalknowledge-Mapper.selectTkByFileName",fileName);
		return tk;
	}

	@Override
	public String getSeqNextValue() throws SQLException {
		String tkCode =session.selectOne("Totalknowledge-Mapper.selectTkSeqNext");
		return tkCode;
	}
	
	@Override
	public void increaseViewCnt(String tkCode) throws SQLException {
		session.update("Totalknowledge-Mapper.increaseViewCnt",tkCode);
	}

	@Override
	public void increaseLikeCnt(String tkCode) throws SQLException {
		session.update("Totalknowledge-Mapper.increaseLikeCnt",tkCode);
		
	}

	@Override
	public void increaseReportCnt(String tkCode) throws SQLException {
		session.update("Totalknowledge-Mapper.increaseReportCnt",tkCode);
		
	}

	@Override
	public void disableTk(String tkCode) throws SQLException {
		session.update("Totalknowledge-Mapper.disableTk",tkCode);
		
	}



}
