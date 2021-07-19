package com.spring.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.spring.dto.TrashVO;

public class TrashDAOImpl implements TrashDAO{

	private SqlSession session;
	public void setSqlSession(SqlSession session) {
		this.session = session;
	}
	

	// 테이블 명 / 개수 조회
	@Override
	public Map<String, Object> getTrashCntAsTrType(TrashVO trash) throws SQLException {
		List<String> trashTable = session.selectList("Trash-Mapper.selectTrashTable");
		List<Integer> trashCnt = new ArrayList<>();
		
		for(String tr : trashTable) {
			trash.setTrTable(tr);
			int cnt = session.selectOne("Trash-Mapper.selectTrashCntByTrType",trash);
			trashCnt.add(cnt);
		}
		
		Map<String, Object> dataMap = new HashMap<String, Object>();
		dataMap.put("trashTable", trashTable);
		dataMap.put("trashCnt", trashCnt);
		return dataMap;
	}


	@Override
	public List<TrashVO> getTrashListFromTrTable(TrashVO trash) throws SQLException {
		List<TrashVO> trashList = session.selectList("Trash-Mapper.selectTrashListFromTrTable",trash);
		
		return trashList;
	}

	
	
	@Override
	public void insertTrash(TrashVO trash) throws SQLException {
		session.update("Trash-Mapper.insertTrash", trash);
	}
	

	@Override
	public void restoreTrash(TrashVO trash) throws SQLException {
		session.update("Trash-Mapper.restoreTrash", trash);
	}


	@Override
	public void deleteTrash(TrashVO trash) throws SQLException {
		session.update("Trash-Mapper.restoreTrash", trash);
	}

}
