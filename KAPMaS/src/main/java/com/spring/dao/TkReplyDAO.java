package com.spring.dao;

import java.sql.SQLException;
import java.util.List;

import com.spring.command.SearchCriteria;
import com.spring.dto.TkReplyVO;

public interface TkReplyDAO {
	
	void insertTkReply(TkReplyVO tkReply)throws SQLException;
	void updateTkReply(TkReplyVO tkReply)throws SQLException;
	void deleteTkReply(int tkRpCode)throws SQLException;
	
	int selectTkReplySeqNextValue()throws SQLException;
	List<TkReplyVO> selectTkReplyListPage(String tkCode,SearchCriteria cri)throws SQLException;
	int countTkReply(String tkCode) throws SQLException;

}
