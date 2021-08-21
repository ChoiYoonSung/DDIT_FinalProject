package com.spring.service;

import java.sql.SQLException;
import java.util.Map;

import com.spring.command.SearchCriteria;
import com.spring.dto.PIReplyVO;

public interface PiReplyService {

	//리스트보기
	Map<String,Object> getPiReplyList(String tkCode,SearchCriteria cri)	throws SQLException;	
	
	//리스트 개수
	int getPiReplyListCount(String tkCode)throws SQLException;
	
	//등록
	void registPiReply(PIReplyVO tkReply)throws SQLException;
		
	//수정
	void modifyPiReply(PIReplyVO tkReply)throws SQLException;
	
	//삭제
	void removePiReply(int tkRpCode)throws SQLException;

}
