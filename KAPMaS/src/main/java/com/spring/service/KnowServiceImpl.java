package com.spring.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.spring.dao.KnowDAO;
import com.spring.dao.LikeDAO;
import com.spring.dao.ReportDAO;
import com.spring.dto.KnowVO;
import com.spring.dto.LikeVO;
import com.spring.dto.ReportVO;

public class KnowServiceImpl implements KnowService{

	private KnowDAO knowDAO;
	public void setKnowDAO(KnowDAO knowDAO) {
		this.knowDAO = knowDAO;
	}
	
	private LikeDAO likeDAO;
	public void setLikeDAO(LikeDAO likeDAO) {
		this.likeDAO = likeDAO;
	}
	
	private ReportDAO reportDAO;
	public void setReportDAO(ReportDAO reportDAO) {
		this.reportDAO = reportDAO;
	}	
	
	@Override
	public List<KnowVO> getAllKnowList() throws SQLException {
		List<KnowVO> knowList = knowDAO.getAllKnowList();
		
		return knowList;
	}
	
	@Override
	public List<KnowVO> getAllKnowListViewOrder() throws SQLException {
		List<KnowVO> knowList = knowDAO.getAllKnowList();
		
		return knowList;
	}
	@Override
	public Map<String, Object> getListArr(String[] userArray) throws Exception {
		List<KnowVO> khList = knowDAO.selectSearchKhListArr(userArray);
		
		Map<String, Object> dataMap = new HashMap<String, Object>();
		dataMap.put("khList", khList);
		
		return dataMap;
	}	
	@Override
	public Map<String, Object> getListArr2(String[] userArray) throws Exception {
		List<KnowVO> khList = knowDAO.selectSearchKhListArr2(userArray);
		
		Map<String, Object> dataMap = new HashMap<String, Object>();
		dataMap.put("khList", khList);
		
		return dataMap;
	}	

	@Override
	public List<KnowVO> getKnowListByCategory(String khCategory) throws SQLException {
		
		List<KnowVO> knowList = knowDAO.getKnowListByCategory(khCategory);
		
		
		return knowList;
	}

	@Override
	public void insertKnow(KnowVO know) throws SQLException {
		knowDAO.insertKnow(know);
	}

	@Override
	public void updateKnow(KnowVO know) throws SQLException {
		knowDAO.updateKnow(know);
	}

	@Override
	public void disableKnow(String khCode) throws SQLException {
		knowDAO.disableKnow(khCode);
	}

	
	@Override
	public KnowVO selectInfoKnow(String khCode) throws SQLException {
		KnowVO know = knowDAO.selectInfoKnow(khCode);
		knowDAO.increaseViewCnt(khCode);
		return know;
	}


	@Override
	public List<KnowVO> getKnowListById(String empId) throws SQLException {
		List<KnowVO> knowList = knowDAO.getKnowListById(empId);
		return knowList;
	}


	@Override
	public void likeKnow(String khCode, LikeVO like) throws SQLException {
		knowDAO.increaseLikecnt(khCode);
		likeDAO.insertLike(like);
	}


	@Override
	public void likeCancelKnow(String khCode, LikeVO like) throws SQLException {
		knowDAO.decreaseLikecnt(khCode);
		likeDAO.deleteLike(like);
	}


	@Override
	public void reportKnow(String khCode, ReportVO rep) throws SQLException {
		knowDAO.increaseReportcnt(khCode);
		reportDAO.insertReport(rep);
	}


	@Override
	public void reportCancelKnow(String khCode, ReportVO rep) throws SQLException {
		knowDAO.decreaseReportcnt(khCode);
		reportDAO.deleteReport(rep);
	}

}
