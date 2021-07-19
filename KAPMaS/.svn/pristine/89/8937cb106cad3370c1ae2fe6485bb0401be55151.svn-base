package com.spring.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.spring.dto.TrashVO;

public interface TrashService {
	
	// 휴지통 분류 별 갯수 조회
	Map<String, Object> getTrashCntAsTrType(TrashVO trash) throws SQLException;
	
	// 휴지통 코드로 리스트 조회
	List<TrashVO> getTrashListFromTrTable(TrashVO trash) throws SQLException;
	
	// 휴지통에 자료 추가
	void insertTrash(TrashVO trash)throws SQLException;
	
	// 휴지통에서 복원
	void restoreTrash(TrashVO trash) throws SQLException;
	
	// 휴지통에서 영구삭제
	void removeTrash(TrashVO trash) throws SQLException;
	
	
}
