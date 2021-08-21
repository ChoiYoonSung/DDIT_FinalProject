package com.spring.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.spring.dto.PRBVO;
import com.spring.dto.ScrapVO;

public class ScrapDAOImpl implements ScrapDAO{
	
	private SqlSession session;
	public void setSqlSession(SqlSession session) {
		this.session=session;
	}

	@Override
	public List<ScrapVO> selectScrapList(String empId) throws SQLException {
		List<ScrapVO> scrapList = session.selectList("Scrap-Mapper.selectScrapList",empId);
		return scrapList;
	}
	
	@Override
	public void insertScrap(ScrapVO scr) throws SQLException {
		session.update("Scrap-Mapper.insertScrap", scr);
		
	}

	@Override
	public void deleteScrap(ScrapVO scr) throws SQLException {
		session.delete("Scrap-Mapper.deleteScrap", scr);
	}

	@Override
	public int scrapCount(ScrapVO scr) throws SQLException {
		int cnt = session.selectOne("Scrap-Mapper.scrapCount", scr);
		return cnt;
	}

	@Override
	public void deleteBdScrap(String bdCode) throws SQLException {
		if(bdCode.substring(0,1).equals("p") || bdCode.substring(0,1).equals("P")) {
			session.update("Scrap-Mapper.deletePrbScrap",bdCode);
		}else if(bdCode.substring(0,1).equals("k") || bdCode.substring(0,1).equals("K")) {
			session.update("Scrap-Mapper.deleteKhScrap",bdCode);
		}else if(bdCode.substring(0,1).equals("t") || bdCode.substring(0,1).equals("T")) {
			session.update("Scrap-Mapper.deleteTkScrap",bdCode);
		}
	}

}
