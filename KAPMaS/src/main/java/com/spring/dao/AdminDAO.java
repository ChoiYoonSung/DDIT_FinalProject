package com.spring.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import com.spring.dto.BoardSelectVO;

public interface AdminDAO {

	List<HashMap<String, Object>> selectProjectStatistics() throws SQLException;

	List<HashMap<String, Object>> selectProjectByMonth() throws SQLException;
	
	List<BoardSelectVO> selectBoardOrderByRegDate() throws SQLException;

	List<HashMap<String, Object>> selectKMSByMonth() throws SQLException;
	
	int countEmployee() throws SQLException;

	int countReport() throws SQLException;

	int countQNA() throws SQLException;

	int countGuide() throws SQLException;

	int countNotice() throws SQLException;


}
