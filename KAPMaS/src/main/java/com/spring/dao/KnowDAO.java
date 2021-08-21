package com.spring.dao;

import java.sql.SQLException;
import java.util.List;

import com.spring.dto.KnowVO;

public interface KnowDAO {

	//전체 노하우 리스트 
	List<KnowVO> getAllKnowList()throws SQLException;
	List<KnowVO> getAllKnowListViewOrder()throws SQLException;
	List<KnowVO> selectSearchKhListArr(String[] userArray) throws SQLException;
	List<KnowVO> selectSearchKhListArr2(String[] userArray) throws SQLException;
	
	//카테고리별 노하우 리스트
	List<KnowVO>getKnowListByCategory(String khCategory)throws SQLException;
	
	//노하우 요청 등록
	void insertKnow(KnowVO know)throws SQLException;
	
	//노하우 요청 수정
	void updateKnow(KnowVO know)throws SQLException;

	//노하우 휴지통으로 
	void disableKnow(String khCode)throws SQLException;
	void deleteKnow(String khCode)throws SQLException;
	
	//노하우 조회수 증가 
	void increaseViewCnt(String khCode)throws SQLException;
	
	//노하우 앤서수 증가
	void increaseReportCnt(String khCode)throws SQLException;
	
	//노하우 앤서수 감소 
	void decreaseReportCnt(String khCode)throws SQLException;
	
	//노하우 요청 상세
	KnowVO selectInfoKnow(String khCode)throws SQLException;
	
	void increaseLikecnt(String khCode)throws SQLException;
	void decreaseLikecnt(String khCode)throws SQLException;
	void increaseReportcnt(String khCode)throws SQLException;
	void decreaseReportcnt(String khCode)throws SQLException;
	
	List<KnowVO> getKnowListById(String empId) throws SQLException;
	
	
}
