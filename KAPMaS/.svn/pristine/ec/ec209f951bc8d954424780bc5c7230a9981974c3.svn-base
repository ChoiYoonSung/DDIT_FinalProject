package com.spring.service;

import java.sql.SQLException;
import java.util.Map;

import com.spring.command.SearchCriteriaById;
import com.spring.dto.RmailVO;

public interface RmailService {

	
	
	//받은 메세지 리스트 
	Map<String,Object> selectRMailListById(SearchCriteriaById  crid)throws SQLException;
			
			
	//메세지 받기
	void receiveMail(RmailVO rmail)throws SQLException;
	
	
	//받은 메세지 확인학디
	RmailVO selectRmailInfo(String rmCode)throws SQLException;
	
	
	//메세지 휴지통으로 보내기
	void deleteRmail(String rmCode)throws SQLException;
		
	//메세지 읽음 표시
	void readRmail(String rmCode)throws SQLException;


	void deleteAllRmail(String rmCode) throws SQLException;
	
	
	
	
}
