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
import com.spring.dto.CopMemberVO;
import com.spring.dto.EmpVO;
import com.spring.dto.ProVO;
import com.spring.dto.caAttachVO;
import com.spring.dto.familyDiscussionContentVO;
import com.spring.dto.shareProjectVO;

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

	@Override
	public CopArchiveVO getArchiveDetail(String caCode) throws SQLException {
		CopArchiveVO ca = session.selectOne("Cop-Mapper.getArchiveDetail", caCode);
		return ca;
	}

	@Override
	public List<caAttachVO> getArchiveAttach(String caCode) throws SQLException {
		List<caAttachVO> cav = session.selectList("Cop-Mapper.getArchiveAttach", caCode);
		return cav;
	}

	@Override
	public caAttachVO getAttachByCaAtNo(int caatno) throws SQLException {
		caAttachVO cavo = session.selectOne("CAAttach-Mapper.getAttachByCaAtNo", caatno);
		return cavo;
	}

	@Override
	public void removeAttachByCaAtNo(int caatno) throws SQLException {
		session.delete("CAAttach-Mapper.removeAttachByCaAtNo", caatno);
	}

	@Override
	public void modifyCa(CopArchiveVO ca) throws SQLException {
		session.update("CAAttach-Mapper.modifyCa", ca);
	}

	@Override
	public void deleteArchive(String caCode) throws SQLException {
		session.update("Cop-Mapper.deleteArchive", caCode);
	}

	@Override
	public void increaseArchiveViewCnt(String caCode) {
		session.update("Cop-Mapper.increaseArchiveViewCnt", caCode);

	}

	@Override
	public List<ProVO> getMyProjectList(String loginUserId) {
		List<ProVO> projectList = session.selectList("Cop-Mapper.getMyProjectList", loginUserId);
		return projectList;
	}

	@Override
	public List<EmpVO> getCopFamilyList(String copCode) {
		List<EmpVO> famailyList = session.selectList("Cop-Mapper.getCopFamilyList", copCode);
		return famailyList;
	}

	@Override
	public void shareProject(shareProjectVO sp) {
		session.insert("Cop-Mapper.insertProjectObserveMember", sp);
		session.insert("Cop-Mapper.projectShareSendMail", sp);
	}

	@Override
	public void projectConfirmRequest(shareProjectVO sp) {
		session.insert("Cop-Mapper.shareProjectRequest", sp);
	}

	@Override
	public List<EmpVO> getSignUpRequestMember(String copCode) {
		List<EmpVO> list = session.selectList("Cop-Mapper.getSignUpRequestMember", copCode);
		return list;
	}

	@Override
	public int approveCopSignUpRequest(CopMemberVO copMemberVO) {
		int cnt = session.update("Cop-Mapper.approveCopSignUpRequest", copMemberVO);
		return cnt;
	}

	@Override
	public int rejectCopSignUpRequest(CopMemberVO copMemberVO) {
		int cnt = session.delete("Cop-Mapper.rejectCopSignUpRequest", copMemberVO);
		return cnt;
	}

	@Override
	public void exileMember(CopMemberVO copMember) {
		session.delete("Cop-Mapper.exileMemeber", copMember);
	}

	@Override
	public void sendMail(CopMemberVO copMemberVO) {
		session.insert("Cop-Mapper.sendMail", copMemberVO);
	}

	@Override
	public void modifyCopInfo(CoPVO cop) {
		session.update("Cop-Mapper.modifyCopInfo", cop);
	}

	@Override
	public void createFdis(CopFamilyDiscussionVO fdisVO) {
		session.insert("Cop-Mapper.createFdis", fdisVO);
	}

	@Override
	public List<CopFamilyDiscussionVO> getCopFdisList(String copCode) {
		List<CopFamilyDiscussionVO> list = session.selectList("Cop-Mapper.getCopFdisList", copCode);
		return list;
	}

	@Override
	public List<CopFamilyDiscussionVO> getIcreatedFdisList(CopFamilyDiscussionVO fdisVO) {
		List<CopFamilyDiscussionVO> list = session.selectList("Cop-Mapper.getIcreatedFdisList", fdisVO);
		return list;
	}

	@Override
	public List<familyDiscussionContentVO> getFdisContentListByFdisCode(String fdisCode) {
		List<familyDiscussionContentVO> list = session.selectList("Cop-Mapper.getFdisContent", fdisCode);
		return list;
	}

	@Override
	public int registDiscussionContent(familyDiscussionContentVO fdisVO) {
		int cnt = session.insert("Cop-Mapper.registDiscussionContent", fdisVO);
		return cnt;
	}

	@Override
	public CopFamilyDiscussionVO getFdisInfoByFdisCode(String fdisCode) {
		CopFamilyDiscussionVO fdisInfo = session.selectOne("Cop-Mapper.getFdisInfoByFdisCode", fdisCode);
		return fdisInfo;
	}

	@Override
	public int modifyFdisInfo(CopFamilyDiscussionVO fdisVO) {
		int cnt = session.update("Cop-Mapper.modifyFdisInfo", fdisVO);
		return cnt;
	}

	@Override
	public EmpVO getEmpIDByFdisCode(String fdisCode) {
		EmpVO empId= session.selectOne("Cop-Mapper.getEmpIDByFdisCode", fdisCode);
		return empId;
	}

	@Override
	public int deleteDiscussionContent(String fdisCode) {
		int cnt = session.delete("Cop-Mapper.deleteDiscussionContent", fdisCode);
		return cnt;
	}

	@Override
	public int deleteDiscussion(String fdisCode) {
		int cnt = session.delete("Cop-Mapper.deleteDiscussion", fdisCode);
		return cnt;
	}

	@Override
	public int joinCopToInvite(CoPVO param) {
		int cnt = session.insert("Cop-Mapper.joinCopToInvite", param);
		return cnt;
	}

	@Override
	public void deleteArchiveAttachOnDB(String caCode) {
		session.delete("Cop-Mapper.deleteArchiveAttachOnDB", caCode);
	}

	@Override
	public void deleteCopArchive(String copCode) {
		session.delete("Cop-Mapper.deleteCopArchive", copCode);
	}

	@Override
	public void deleteCopMember(String copCode) {
		session.delete("Cop-Mapper.deleteCopMember", copCode);
	}

	@Override
	public int deleteCop(String copCode) {
		int cnt = session.delete("Cop-Mapper.deleteCop", copCode);
		return cnt;
	}

	@Override
	public List<CopFamilyDiscussionVO> getIcreatedFdisListOnMyCop(String userId) {
		List<CopFamilyDiscussionVO> list = session.selectList("Cop-Mapper.getIcreatedFdisListOnMyCop", userId);
		return list;
	}

	@Override
	public int getApproveRequestCnt(String copCode) {
		int cnt = session.selectOne("Cop-Mapper.getApproveRequestCnt", copCode);
		return cnt;
	}
}
