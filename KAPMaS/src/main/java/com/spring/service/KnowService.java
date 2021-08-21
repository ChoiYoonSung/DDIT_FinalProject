package com.spring.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.spring.dto.KnowVO;
import com.spring.dto.LikeVO;
import com.spring.dto.ReportVO;

public interface KnowService {

	
		//전체 노하우 리스트 
		List<KnowVO> getAllKnowList()throws SQLException;
		List<KnowVO> getAllKnowListViewOrder()throws SQLException;
		Map<String, Object> getListArr(String[] userArray) throws SQLException, Exception;
		Map<String, Object> getListArr2(String[] userArray) throws SQLException, Exception;
		
		//카테고리별 노하우 리스트
		List<KnowVO>getKnowListByCategory(String khCategory)throws SQLException;
		
		//노하우 요청 등록
		void insertKnow(KnowVO know)throws SQLException;
		
		//노하우 요청 수정
		void updateKnow(KnowVO know)throws SQLException;

		//노하우 휴지통으로 
		void disableKnow(String khCode)throws SQLException;
	
		//노하우 요청 상세
		KnowVO selectInfoKnow(String khCode)throws SQLException;
		
		void likeKnow(String khCode, LikeVO like) throws SQLException;
		void likeCancelKnow(String khCode, LikeVO like) throws SQLException;
		void reportKnow(String khCode, ReportVO rep) throws SQLException;
		void reportCancelKnow(String khCode, ReportVO rep) throws SQLException;
	
	
		List<KnowVO> getKnowListById(String empId) throws SQLException;
}
