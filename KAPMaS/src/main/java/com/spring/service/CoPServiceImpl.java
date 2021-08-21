package com.spring.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.spring.command.PageMakerByIdForCop;
import com.spring.command.SearchCriteriaById;
import com.spring.dao.CAAttachDAO;
import com.spring.dao.CoPDAO;
import com.spring.dto.CoPVO;
import com.spring.dto.CopArchiveVO;
import com.spring.dto.CopFamilyDiscussionVO;
import com.spring.dto.CopMemberVO;
import com.spring.dto.EmpVO;
import com.spring.dto.ProVO;
import com.spring.dto.caAttachVO;
import com.spring.dto.familyDiscussionContentVO;
import com.spring.dto.shareProjectVO;

public class CoPServiceImpl implements CoPService {

	private CoPDAO copDAO;

	public void setCopDAO(CoPDAO copDAO) {
		this.copDAO = copDAO;
	}

	private CAAttachDAO caDAO;

	public void setCaDAO(CAAttachDAO caDAO) {
		this.caDAO = caDAO;
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
		// pageMaker.setTotalCount(copDAO.getCopCriteriaTotalCount(cri));

		copVO.put("pageMaker", pageMaker);

		return copVO;
	}

	@Override
	public Map<String, Object> getOwnCopList(SearchCriteriaById cri) throws SQLException {
		Map<String, Object> ownCopMap = copDAO.getOwnCopList(cri);

		PageMakerByIdForCop pageMaker = new PageMakerByIdForCop();
		pageMaker.setCrid(cri);
		// pageMaker.setTotalCount(copDAO.getCopCriteriaOwnCop(cri));

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
	public void signUpToCop(CoPVO signUpInfo) throws SQLException {
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

	@Override
	public void registCA(CopArchiveVO ca) throws SQLException {

		int cpno = copDAO.getCASeqNextValue();
		String cpnos = "cpa" + Integer.toString(cpno);

		ca.setCaCode(cpnos);
		copDAO.insertCA(ca);

		if (ca.getAttachList() != null)
			for (caAttachVO attach : ca.getAttachList()) {
				attach.setCaCode(cpnos);
				caDAO.insertCAAttach(attach);
			}

	}

	@Override
	public CopArchiveVO getArchiveDetail(String caCode) throws SQLException {

		CopArchiveVO ca = copDAO.getArchiveDetail(caCode);
		addAttachList(ca);
		return ca;
	}

	private void addAttachList(CopArchiveVO ca) throws SQLException {
		if (ca == null)
			return;

		String caCode = ca.getCaCode();
		List<caAttachVO> attachList = copDAO.getArchiveAttach(caCode);

		ca.setAttachList(attachList);
	}

	@Override
	public caAttachVO getAttachByCaAtNo(int caatno) throws SQLException {
		caAttachVO cavo = copDAO.getAttachByCaAtNo(caatno);
		return cavo;
	}

	@Override
	public void removeAttachByCaAtNo(int caatno) throws SQLException {
		copDAO.removeAttachByCaAtNo(caatno);
	}

	@Override
	public void modifyCa(CopArchiveVO ca) throws SQLException {
		copDAO.modifyCa(ca);
		
		if(ca.getAttachList() != null)
			for(caAttachVO attach : ca.getAttachList()) {
				attach.setCaCode(ca.getCaCode());
				caDAO.insertCAAttach(attach);
			}
	}

	@Override
	public void archiveRemove(String caCode) throws SQLException {
//		caDAO.deleteAllAttach(caCode);
		copDAO.deleteArchive(caCode);
	}

	@Override
	public void increaseArchiveViewCnt(String caCode) throws SQLException {
		copDAO.increaseArchiveViewCnt(caCode);
	}

	@Override
	public List<ProVO> getMyProjectList(String loginUserId) {
		List<ProVO> projectList = copDAO.getMyProjectList(loginUserId);
		return projectList;
	}

	@Override
	public List<EmpVO> getCopFamilyList(String copCode) {
		List<EmpVO> familyList = copDAO.getCopFamilyList(copCode);
		return familyList;
	}

	@Override
	public void projectDirectShare(shareProjectVO sp) {
		List<String> paramFamily = sp.getSelectedFamily();
		
		for(String family : paramFamily) {
			sp.setFamily(family);
			copDAO.shareProject(sp);
		}
	}

	@Override
	public void projectConfirmRequest(shareProjectVO sp) {
		copDAO.projectConfirmRequest(sp);
	}

	@Override
	public List<EmpVO> getSignUpRequestMember(String copCode) {
		List<EmpVO> signUpList = copDAO.getSignUpRequestMember(copCode);
		return signUpList;
	}

	@Override
	public int approveCopSignUpRequest(CopMemberVO copMemberVO) {
		int cnt = copDAO.approveCopSignUpRequest(copMemberVO);
		return cnt;
	}

	@Override
	public int rejectCopSignUpRequest(CopMemberVO copMemberVO) {
		int cnt = copDAO.rejectCopSignUpRequest(copMemberVO);
		return cnt;
	}

	@Override
	public void exileMember(CopMemberVO copMember) {
		copDAO.exileMember(copMember);
	}

	@Override
	public void sendMail(CopMemberVO copMemberVO) {
		copDAO.sendMail(copMemberVO);
	}

	@Override
	public void modifyCopInfo(CoPVO cop) {
		copDAO.modifyCopInfo(cop);
	}

	@Override
	public void createFdis(CopFamilyDiscussionVO fdisVO) {
		copDAO.createFdis(fdisVO);
	}

	@Override
	public List<CopFamilyDiscussionVO> getCopFdisList(String copCode) {
		List<CopFamilyDiscussionVO> list = copDAO.getCopFdisList(copCode);
		return list;
	}

	@Override
	public List<CopFamilyDiscussionVO> getIcreatedFdisList(CopFamilyDiscussionVO fdisVO) {
		List<CopFamilyDiscussionVO> list = copDAO.getIcreatedFdisList(fdisVO);
		return list;
	}

	@Override
	public List<familyDiscussionContentVO> getFdisContentListByFdisCode(String fdisCode) {
		List<familyDiscussionContentVO> list = copDAO.getFdisContentListByFdisCode(fdisCode);
		return list;
	}

	@Override
	public int registDiscussionContent(familyDiscussionContentVO fdisVO) {
		int cnt = copDAO.registDiscussionContent(fdisVO);
		return cnt;
	}

	@Override
	public CopFamilyDiscussionVO getFdisInfoByFdisCode(String fdisCode) {
		CopFamilyDiscussionVO fdisInfo = copDAO.getFdisInfoByFdisCode(fdisCode);
		return fdisInfo;
	}

	@Override
	public int modifyFdisInfo(CopFamilyDiscussionVO fdisVO) {
		int cnt = copDAO.modifyFdisInfo(fdisVO);
		return cnt;
	}

	@Override
	public EmpVO getEmpIDByFdisCode(String fdisCode) {
		EmpVO empId = copDAO.getEmpIDByFdisCode(fdisCode);
		return empId;
	}

	@Override
	public int deleteDiscussionContent(String fdisCode) {
		int cnt = copDAO.deleteDiscussionContent(fdisCode);
		return cnt;
	}

	@Override
	public int deleteDiscussion(String fdisCode) {
		int cnt = copDAO.deleteDiscussion(fdisCode);
		return cnt;
	}

	@Override
	public int joinCopToInvite(CoPVO param) {
		int cnt = copDAO.joinCopToInvite(param);
		return cnt;
	}

	@Override
	public List<caAttachVO> getArchiveAttach(String caCode) throws SQLException {
		List<caAttachVO> attachList = copDAO.getArchiveAttach(caCode);
		return attachList;
	}

	@Override
	public void deleteArchiveAttachOnDB(String caCode) {
		copDAO.deleteArchiveAttachOnDB(caCode);
	}

	@Override
	public void deleteCopArchive(String copCode) {
		copDAO.deleteCopArchive(copCode);
	}

	@Override
	public void deleteCopMember(String copCode) {
		copDAO.deleteCopMember(copCode);
	}

	@Override
	public int deleteCop(String copCode) {
		int cnt = copDAO.deleteCop(copCode);
		return cnt;
	}

	@Override
	public List<CopFamilyDiscussionVO> getIcreatedFdisListOnMyCop(String userId) {
		List<CopFamilyDiscussionVO> list = copDAO.getIcreatedFdisListOnMyCop(userId);
		return list;
	}

	@Override
	public int getCopApproveRequestCnt(String copCode) {
		int cnt = copDAO.getApproveRequestCnt(copCode);
		return cnt;
	}

}
