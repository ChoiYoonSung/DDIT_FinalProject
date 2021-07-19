package com.spring.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.spring.command.PageMakerByIdForCop;
import com.spring.command.SearchCriteriaById;
import com.spring.dao.CoPDAO;
import com.spring.dto.CoPVO;
import com.spring.dto.CopArchiveVO;
import com.spring.dto.CopFamilyDiscussionVO;

public class CoPServiceImpl implements CoPService {

	private CoPDAO copDAO;

	public void setCopDAO(CoPDAO copDAO) {
		this.copDAO = copDAO;
	}

	@Override
	public List<CoPVO> getCopList() throws SQLException {
		List<CoPVO> copVO = copDAO.getCopList();
		
		return copVO;
	}

	@Override
	public void create(CoPVO copVO) throws SQLException {
		copDAO.createCop(copVO);
	}

	@Override
	public Map<String, Object> getJoiningCopList(SearchCriteriaById cri) throws SQLException {
		Map<String, Object> copVO = copDAO.getJoiningCopList(cri);

		PageMakerByIdForCop pageMaker = new PageMakerByIdForCop();
		pageMaker.setCrid(cri);
		//pageMaker.setTotalCount(copDAO.getCopCriteriaTotalCount(cri));
		
		copVO.put("pageMaker", pageMaker);
		
		return copVO;
	}

	@Override
	public Map<String, Object> getOwnCopList(SearchCriteriaById cri) throws SQLException {
		Map<String, Object> ownCopMap = copDAO.getOwnCopList(cri);
		
		PageMakerByIdForCop pageMaker = new PageMakerByIdForCop();
		pageMaker.setCrid(cri);
		//pageMaker.setTotalCount(copDAO.getCopCriteriaOwnCop(cri));
		
		ownCopMap.put("ownPagerMaker", pageMaker);
		
		return ownCopMap;
	}

	@Override
	public Map<String, Object> getCopInfo(String copCode) throws SQLException {
		Map<String, Object> copInfoMap = copDAO.getCopInfo(copCode);
		return copInfoMap;
	}

	@Override
	public int doubleCheck(String copName) throws SQLException {
		int doubleCheck = copDAO.doubleCheck(copName);
		return doubleCheck;
	}

	@Override
	public List<CoPVO> getLargestCopDescList() throws SQLException {
		List<CoPVO> list = copDAO.getLargestCopDescList();
		return list;
	}

	@Override
	public List<CoPVO> getLargestCopFdDescList() throws SQLException {
		List<CoPVO> list = copDAO.getLargestCopFdDescList();
		return list;
	}

	@Override
	public void signUpToCop(CoPVO signUpInfo) throws SQLException{
		copDAO.signUpRequestToCop(signUpInfo);
	}

	@Override
	public List<CopArchiveVO> getCopArchiveList(String copCode) throws SQLException {
		List<CopArchiveVO> ca = copDAO.getCopArchiveList(copCode);
		return ca;
	}

	@Override
	public List<CopFamilyDiscussionVO> getCopDiscussionList(String copCode) throws SQLException {
		List<CopFamilyDiscussionVO> cfd = copDAO.getCopDiscussionList(copCode);
		return cfd;
	}

	@Override
	public Map<String, Object> getJoiningCopListNotCri(String empId) {
		Map<String, Object> copVO = copDAO.getJoiningCopListNotCri(empId);
		return copVO;
	}

	@Override
	public List<CopFamilyDiscussionVO> getFamilyDiscussionList(SearchCriteriaById cri) {
		List<CopFamilyDiscussionVO> discussionMap = copDAO.getMyCopDiscussionList(cri);

		return discussionMap;
	}

	@Override
	public List<CopArchiveVO> getRegistarchiveList(SearchCriteriaById cri) {
		List<CopArchiveVO> archiveList = copDAO.getArchiveListToCri(cri);
		
		return archiveList;
	}

	@Override
	public Map<String, Object> getOwnCopListNotCri(String userId) throws SQLException {
		Map<String, Object> ownCopList = copDAO.getOwnCopListNotCri(userId);
		return ownCopList;
	}

	@Override
	public List<CopFamilyDiscussionVO> getJoinDiscussionNotCri(String userId) throws SQLException {
		List<CopFamilyDiscussionVO> discussionList = copDAO.getJoinDisussionList(userId);
		return discussionList;
	}

	@Override
	public List<CopArchiveVO> getMyArchiveList(String userId) throws SQLException {
		List<CopArchiveVO> archiveList = copDAO.getMyArchiveList(userId);
		return archiveList;
	}

}
