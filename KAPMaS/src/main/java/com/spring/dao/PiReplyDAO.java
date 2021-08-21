package com.spring.dao;

import java.sql.SQLException;
import java.util.List;

import com.spring.command.SearchCriteria;
import com.spring.dto.PIReplyVO;

public interface PiReplyDAO {
	
	void insertPiReply(PIReplyVO piReply)throws SQLException;
	void updatePiReply(PIReplyVO piReply)throws SQLException;
	void deletePiReply(int piRpCode)throws SQLException;
	
	int selectPiReplySeqNextValue()throws SQLException;
	List<PIReplyVO> selectPiReplyListPage(String piCode,SearchCriteria cri)throws SQLException;
	int countPiReply(String piCode) throws SQLException;

}
