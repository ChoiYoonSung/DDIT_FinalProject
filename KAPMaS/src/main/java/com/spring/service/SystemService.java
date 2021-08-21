package com.spring.service;

import java.sql.SQLException;
import java.util.List;

import com.spring.dto.SystemVO;

public interface SystemService {

	//시스템 이용가이드 리스트 조회
	List<SystemVO> getSystemList()throws SQLException;
	
	//시스템 이용가이드 내용 조회
	SystemVO getSystemInfo(String sgCode)throws SQLException;
	
	//시스템 이용가이드 등록
	void insertSystem(SystemVO system)throws SQLException;
	
	//시스템 이용가이드 수정
	void updateSystem(SystemVO system)throws SQLException;
	
	//시스템 이용가이드 삭제
	void deleteSystem(String sgCode)throws SQLException;
	
	//시스템 이용가이드 뷰 카운트 올리기
	void increaseSystemCnt(String sgCode)throws SQLException;
	
	//시스템 이용가이드 뷰 카운트 내리기
	void decreaseSystemCnt(String sgCode)throws SQLException;

	List<SystemVO> getGuideList(String keyword);

	
	
	
	
	
	
	
	
	
	
	
}
