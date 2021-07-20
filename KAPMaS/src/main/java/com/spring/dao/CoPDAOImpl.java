package com.spring.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import com.spring.command.SearchCriteriaById;
import com.spring.dto.CoPVO;
import com.spring.dto.CopArchiveVO;
import com.spring.dto.CopFamilyDiscussionVO;

public class CoPDAOImpl implements CoPDAO {

	private SqlSession session;

	public void setSqlSession(SqlSession session) {
		this.session = session;
	}

	@Override
	public List<CoPVO> getCopList() throws SQLException {

		List<CoPVO> copList = session.selectList("Cop-Mapper.getCopList");
		return copList;
	}

	@Override
	public void createCop(CoPVO copVO) throws SQLException {
		CoPVO copCode = session.selectOne("Cop-Mapper.getCopCode");
		System.out.println(copCode.getCopCode());
		copVO.setCopCode(copCode.getCopCode());
		session.insert("Cop-Mapper.createCop", copVO);
		session.insert("Cop-Mapper.setCopOwner", copVO);
	}

	@Override
	public Map<String, Object> getJoiningCopList(SearchCriteriaById cri) throws SQLException {

		int offset = cri.getStartRowNum();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset, limit);

		List<CoPVO> copVO = session.selectList("Cop-Mapper.getJoiningCopList", cri, rowBounds);
		List<CoPVO> copPersonnel = new ArrayList<CoPVO>();
		for (CoPVO cop : copVO) {
			String copCode = cop.getCopCode();
			CoPVO copPer = session.selectOne("Cop-Mapper.getCopHumanCnt", copCode);
			copPersonnel.add(copPer);
		}

		Map<String, Object> dataMap = new HashMap<String, Object>();
		dataMap.put("joinCopVO", copVO);
		dataMap.put("joinCopCnt", copPersonnel);

		return dataMap;
	}

	@Override
	public Map<String, Object> getOwnCopList(SearchCriteriaById cri) throws SQLException {

		int offset = cri.getStartRowNum();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset, limit);

		List<CoPVO> ownCopVO = session.selectList("Cop-Mapper.getOwnCopList", cri, rowBounds);
		List<CoPVO> copPersonnel = new ArrayList<CoPVO>();
		for (CoPVO cop : ownCopVO) {
			String copCode = cop.getCopCode();
			CoPVO copPer = session.selectOne("Cop-Mapper.getCopHumanCnt", copCode);
			copPersonnel.add(copPer);
		}

		Map<String, Object> dataMap = new HashMap<String, Object>();
		dataMap.put("ownCopVO", ownCopVO);
		dataMap.put("ownCopCnt", copPersonnel);

		return dataMap;
	}

	@Override
	public Map<String, Object> getCopInfo(String copCode) throws SQLException {
		CoPVO copInfo = session.selectOne("Cop-Mapper.getCopInfo", copCode);
		CoPVO copPersonnel = session.selectOne("Cop-Mapper.getCopHumanCnt", copInfo.getCopCode());
		copInfo.setCopPersonnel(copPersonnel);

		Map<String, Object> copInfoMap = new HashMap<String, Object>();
		copInfoMap.put("copInfo", copInfo);
		copInfoMap.put("copPersonnel", copPersonnel);

		return copInfoMap;
	}

	@Override
	public int doubleCheck(String copName) throws SQLException {
		int doubleCheck = session.selectOne("Cop-Mapper.doubleCheck", copName);
		return doubleCheck;
	}

	/*
	 * @Override public int getCOPCriteriaTotalCount(SearchCriteriaById cri) { int
	 * count = session.selectOne("Cop-Mapper.selectSearchCopList", cri); return 0; }
	 */

	@Override
	public List<CoPVO> getLargestCopDescList() throws SQLException {
		List<CoPVO> list = session.selectList("Cop-Mapper.getLargestCopDescList");
		return list;
	}

	@Override
	public List<CoPVO> getLargestCopFdDescList() throws SQLException {
		List<CoPVO> list = session.selectList("Cop-Mapper.getLargestCopFdDescList");
		return list;
	}

	@Override
	public void signUpRequestToCop(CoPVO signUpInfo) throws SQLException {
		session.insert("Cop-Mapper.copSignUpRequest", signUpInfo);
	}

	@Override
	public List<CopArchiveVO> getCopArchiveList(String copCode) throws SQLException {
		List<CopArchiveVO> ca = session.selectList("Cop-Mapper.getArchiveList", copCode);
		return ca;
	}

	@Override
	public List<CopFamilyDiscussionVO> getCopDiscussionList(String copCode) {
		List<CopFamilyDiscussionVO> cfd = session.selectList("Cop-Mapper.getDiscussionList", copCode);
		return cfd;
	}

	@Override
	public int getCopCriteriaTotalCount(SearchCriteriaById cri) {
		int count = session.selectOne("Cop-Mapper.getJoiningCopCnt", cri);
		return count;
	}

	@Override
	public int getCopCriteriaOwnCop(SearchCriteriaById cri) throws SQLException {
		int count = session.selectOne("Cop-Mapper.getOwnCopListCnt", cri);
		return count;
	}

	@Override
	public Map<String, Object> getJoiningCopListNotCri(String empId) {

		List<CoPVO> copVO = session.selectList("Cop-Mapper.getJoiningCopList", empId);
		List<CoPVO> copPersonnel = new ArrayList<CoPVO>();
		for (CoPVO cop : copVO) {
			String copCode = cop.getCopCode();
			CoPVO copPer = session.selectOne("Cop-Mapper.getCopHumanCnt", copCode);
			copPersonnel.add(copPer);
		}

		Map<String, Object> dataMap = new HashMap<String, Object>();
		dataMap.put("joinCopVO", copVO);
		dataMap.put("joinCopCnt", copPersonnel);

		return dataMap;
	}

	@Override
	public List<CopFamilyDiscussionVO> getMyCopDiscussionList(SearchCriteriaById cri) {

		int offset = cri.getStartRowNum();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset, limit);

		List<CopFamilyDiscussionVO> myDiscussionList = session.selectList("Cop-Mapper.getMyCopDiscussionList", cri,
				rowBounds);
		return myDiscussionList;
	}

	@Override
	public List<CopArchiveVO> getArchiveListToCri(SearchCriteriaById cri) {

		int offset = cri.getStartRowNum();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset, limit);

		List<CopArchiveVO> myArchiveList = session.selectList("Cop-Mapper.getMyArchiveListToCri", cri, rowBounds);

		return myArchiveList;
	}

	@Override
	public Map<String, Object> getOwnCopListNotCri(String userId) throws SQLException {

		List<CoPVO> ownCopVO = session.selectList("Cop-Mapper.getOwnCopList", userId);
		List<CoPVO> copPersonnel = new ArrayList<CoPVO>();
		for (CoPVO cop : ownCopVO) {
			String copCode = cop.getCopCode();
			CoPVO copPer = session.selectOne("Cop-Mapper.getCopHumanCnt", copCode);
			copPersonnel.add(copPer);
		}

		Map<String, Object> dataMap = new HashMap<String, Object>();
		dataMap.put("ownCopVO", ownCopVO);
		dataMap.put("ownCopCnt", copPersonnel);

		return dataMap;
	}

	public List<CopFamilyDiscussionVO> getJoinDisussionList(String userId) throws SQLException {
		List<CopFamilyDiscussionVO> discussionList = session.selectList("Cop-Mapper.getMyCopDiscussionList", userId);
		return discussionList;
	}

	@Override
	public List<CopArchiveVO> getMyArchiveList(String userId) throws SQLException {
		List<CopArchiveVO> archiveList = session.selectList("Cop-Mapper.getMyArchiveListToCri", userId);
		return archiveList;
	}

	@Override
	public int getCASeqNextValue() throws SQLException {
		int cano = session.selectOne("CAAttach-Mapper.selectCASeqNext");
		return cano;
	}

	@Override
	public void insertCA(CopArchiveVO ca) throws SQLException {
		session.update("CAAttach-Mapper.insertCA", ca);
	}

}
