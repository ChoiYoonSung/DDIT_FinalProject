package com.spring.dao;

import java.sql.SQLException;
import java.util.List;

import com.spring.dto.PRBVO;

public interface PRBDAO {
	
	/*전체 리스트 조회*/
	List<PRBVO> getAllList() throws SQLException;
	
	/*작성 게시물 숫자*/
	int getAllListCount(String empId) throws SQLException;
	
	/*최근 인기게시물 조회*/
	List<PRBVO> selectSearchPrbListViewOrder() throws SQLException;
	
	/*검색 결과 조회*/
	List<PRBVO> selectSearchPrbListArr(String[] userArray) throws SQLException;
	List<PRBVO> selectSearchPrbListArr2(String[] userArray) throws SQLException;
	
	/*코드로 게시물 조회*/
	PRBVO selectPrbByPrbCode(String prCode) throws SQLException;
	
	/*비활성화*/
	void disablePrb(String prCode) throws SQLException;
	
	/*추천,조회수*/
	void increaseViewCnt(String prCode) throws SQLException;
	void increaseLikeCnt(String prCode) throws SQLException;
	void decreaseLikeCnt(String prCode) throws SQLException;
	
	String selectPrbSeqNext() throws SQLException;

	PRBVO selectPrbByPcode(String pCode) throws SQLException;
}
