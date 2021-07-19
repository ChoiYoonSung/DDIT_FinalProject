package com.spring.service;

import java.sql.SQLException;
import java.util.Map;

import com.spring.command.SearchCriteria;
import com.spring.dto.TkReplyVO;

public interface TkReplyService {

	//리스트보기
	Map<String,Object> getTkReplyList(String tkCode,SearchCriteria cri)	throws SQLException;	
	
	//리스트 개수
	int getTkReplyListCount(String tkCode)throws SQLException;
	
	//등록
	void registTkReply(TkReplyVO tkReply)throws SQLException;
		
	//수정
	void modifyTkReply(TkReplyVO tkReply)throws SQLException;
	
	//삭제
	void removeTkReply(int tkRpCode)throws SQLException;
}
