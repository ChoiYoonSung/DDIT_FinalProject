package com.spring.dao;

import java.sql.SQLException;
import java.util.List;

import com.spring.dto.DocumentVO;

public interface DocumentDAO {

	
	//파일 저장
	void insertDocument(DocumentVO doc)throws SQLException;
	
	//파일리스트 가져오기
	List<DocumentVO> selectFileListByFolder(DocumentVO doc)throws SQLException;
	
	
	//파일 삭제
	void deleteDocument(String docCode)throws SQLException;
	
	
	
	//폴더 옮기기
	void updateDocument(DocumentVO doc)throws SQLException;
	
	//파일 정보 가져오기 
	DocumentVO selectImfoDocument(String docCode)throws SQLException;
	
	
	List<DocumentVO> selectFileListById(String empId) throws SQLException;
	
}
