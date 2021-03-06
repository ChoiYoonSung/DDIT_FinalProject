package com.spring.dao;

import java.sql.SQLException;
import java.util.List;

import com.spring.command.SearchCriteria;
import com.spring.dto.TotalKnowledgeVO;

public interface TotalKnowledgeDAO {
	
	List<TotalKnowledgeVO> selectTkCriteria(SearchCriteria cri)	throws SQLException;
	List<TotalKnowledgeVO> selectTkCriteriaArr(String[] userArray)	throws SQLException;
	List<TotalKnowledgeVO> selectTkCriteriaArr2(String[] userArray)	throws SQLException;
	List<TotalKnowledgeVO> selectTkCriteria2(SearchCriteria cri)	throws SQLException;
	List<TotalKnowledgeVO> getAllList() throws SQLException;
	
	int selectTkCriteriaTotalCount(SearchCriteria cri) throws SQLException;
	public TotalKnowledgeVO selectTkByFileName(String fileName) throws SQLException; 
	
	TotalKnowledgeVO selectTkByTkCode(String tkCode)throws SQLException;
	
	void insertTk(TotalKnowledgeVO tk)throws SQLException;
	void updateTk(TotalKnowledgeVO tk)throws SQLException;
	void disableTk(String tkCode)throws SQLException;
	
	void deleteTk(String tkCode)throws SQLException;
	
	void increaseViewCnt(String tkCode)throws SQLException;
	void increaseLikeCnt(String tkCode)throws SQLException;
	void increaseReportCnt(String tkCode)throws SQLException;
	void decreaseLikeCnt(String tkCode)throws SQLException;
	void decreaseReportCnt(String tkCode)throws SQLException;
	
	String getSeqNextValue() throws SQLException;
	

}
