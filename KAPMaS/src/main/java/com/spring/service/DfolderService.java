package com.spring.service;

import java.sql.SQLException;
import java.util.List;

import com.spring.dto.DfolderVO;

public interface DfolderService {
	
	
	//폴더 생성
	void createFolder(DfolderVO df)throws SQLException;
	
	//폴더 삭제
	void deleteFolder(String fId)throws SQLException;
	
	//폴더 리스트
	List<DfolderVO> findFolderById(String empId)throws SQLException;
	
	
	
	
	
	

}
