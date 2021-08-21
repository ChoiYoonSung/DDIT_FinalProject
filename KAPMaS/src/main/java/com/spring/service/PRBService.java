package com.spring.service;

import java.util.List;
import java.util.Map;

import com.spring.dto.LikeVO;
import com.spring.dto.PRBVO;

import java.sql.SQLException;

public interface PRBService {
	
	/*검색 결과 조회*/
	Map<String, Object> getListArr (String[] userArray) throws SQLException, Exception; 
	Map<String, Object> getListArr2 (String[] userArray) throws SQLException, Exception; 
	Map<String, Object> getListArr () throws SQLException, Exception; 
	
	/*리스트 조회*/
	List<PRBVO> getList() throws SQLException;
	List<PRBVO> selectSearchPrbListViewOrder() throws SQLException;
	
	/*추천하기*/
	void likePrb(String prCode, LikeVO like) throws SQLException;
	void likeCancelPrb(String prCode, LikeVO like) throws SQLException;
	int likeCount(LikeVO like) throws Exception;
	
	/*비활성화*/
	void disable(String prCode) throws SQLException;
	
	/*읽기*/
	PRBVO read(String prCode) throws SQLException;
	
	PRBVO getPrb(String prCode) throws SQLException;

	PRBVO getPrbByPcode(String pCode) throws SQLException;
}
