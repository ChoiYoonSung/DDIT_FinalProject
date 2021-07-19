package com.spring.service;

import java.sql.SQLException;
import java.util.List;

import com.spring.dto.DepVO;


public interface DepService {

	
	
	//부서리스트 조회
	List<DepVO> getDepList()throws SQLException;
	
	
	//부서코드로 부서 조회
	DepVO getDepListByCode(String depCode)throws SQLException;
		
	
}
