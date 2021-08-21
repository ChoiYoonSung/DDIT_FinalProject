package com.spring.service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.spring.dao.LikeDAO;
import com.spring.dao.PRBDAOImpl;
import com.spring.dto.LikeVO;
import com.spring.dto.PRBVO;

public class PRBServiceImpl implements PRBService {

	private PRBDAOImpl prbDAO;

	public void setPrbDAO(PRBDAOImpl prbDAO) {
		this.prbDAO = prbDAO;
	}
	private LikeDAO likeDAO;
	public void setLikeDAO(LikeDAO likeDAO) {
		this.likeDAO = likeDAO;
	}

	@Override
	public Map<String, Object> getListArr(String[] userArray) throws SQLException, Exception {
		List<PRBVO> prbList = prbDAO.selectSearchPrbListArr(userArray);
		Map<String, Object> dataMap = new HashMap<String, Object>();
		dataMap.put("prbList", prbList);
		
		return dataMap;
	}
	@Override
	public Map<String, Object> getListArr2(String[] userArray) throws SQLException, Exception {
		List<PRBVO> prbList = prbDAO.selectSearchPrbListArr2(userArray);
		Map<String, Object> dataMap = new HashMap<String, Object>();
		dataMap.put("prbList", prbList);
		
		return dataMap;
	}
	@Override
	public Map<String, Object> getListArr() throws SQLException, Exception {
		String[] userArray = {""};
		
		List<PRBVO> list = prbDAO.selectSearchPrbListArr(userArray);
		
		Map<String, Object> dataMap = new HashMap<String, Object>();
		dataMap.put("list", list);
		
		return dataMap;
	}

	@Override
	public List<PRBVO> getList() throws SQLException {
		List<PRBVO> list = new ArrayList<>();
		list = prbDAO.getAllList();
		return list;
	}

	@Override
	public void likePrb(String prCode, LikeVO like) throws SQLException {
		prbDAO.increaseLikeCnt(prCode);
		likeDAO.insertLike(like);

	}

	@Override
	public void likeCancelPrb(String prCode, LikeVO like) throws SQLException {
		prbDAO.decreaseLikeCnt(prCode);
		likeDAO.deleteLike(like);
	}

	@Override
	public int likeCount(LikeVO like) throws Exception {
		int count = likeDAO.likeCount(like);
		return count;
	}

	@Override
	public void disable(String prCode) throws SQLException {
		prbDAO.disablePrb(prCode);

	}

	@Override
	public PRBVO read(String prCode) throws SQLException {
		PRBVO prb = prbDAO.selectPrbByPrbCode(prCode);
		prbDAO.increaseViewCnt(prCode);
		return prb;
	}

	@Override
	public List<PRBVO> selectSearchPrbListViewOrder() throws SQLException {
		List<PRBVO> list = new ArrayList<>();
		list = prbDAO.selectSearchPrbListViewOrder();
		return list;
	}

	@Override
	public PRBVO getPrb(String prCode) throws SQLException {
		PRBVO prb = prbDAO.selectPrbByPrbCode(prCode);
		return prb;
	}

	@Override
	public PRBVO getPrbByPcode(String pCode) throws SQLException {
		PRBVO prb = prbDAO.selectPrbByPcode(pCode);
		return prb;
	}

}
