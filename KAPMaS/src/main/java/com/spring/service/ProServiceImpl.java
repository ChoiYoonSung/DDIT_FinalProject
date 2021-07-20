package com.spring.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.spring.command.PageMaker;
import com.spring.command.PageMakerByPA;
import com.spring.command.SearchCriteriaByPA;
import com.spring.dao.PAAttachDAO;
import com.spring.dao.ProDAO;
import com.spring.dto.PAAttachVO;
import com.spring.dto.PAVO;
import com.spring.dto.PIVO;
import com.spring.dto.PjmVO;
import com.spring.dto.ProEmpVO;
import com.spring.dto.ProPjmVO;
import com.spring.dto.ProVO;
import com.spring.dto.RelegateVO;

public class ProServiceImpl implements ProService {

	private ProDAO proDAO;

	public void setProDAO(ProDAO proDAO) {
		this.proDAO = proDAO;
	}

	private PAAttachDAO paattachDAO;

	public void setPaattachDAO(PAAttachDAO paattachDAO) {
		this.paattachDAO = paattachDAO;
	}

	@Override
	public List<ProPjmVO> getListProById(String empId) throws SQLException {
		List<ProPjmVO> proList = proDAO.getlistProById(empId);
		return proList;
	}

	@Override
	public List<ProVO> getListDoProById(String empId) throws SQLException {

		List<ProVO> proList = proDAO.getListDoProById(empId);

		return proList;
	}

	@Override
	public List<ProVO> getListAopProById(String empId) throws SQLException {
		List<ProVO> proList = proDAO.getListAopProById(empId);

		return proList;
	}

	@Override
	public List<ProVO> getListNotProById(String empId) throws SQLException {
		List<ProVO> proList = proDAO.getListNotProById(empId);

		return proList;
	}

	@Override
	public void insertProject(ProVO pro) throws SQLException {
		proDAO.insertProject(pro);

	}

	@Override
	public void updateProject(ProVO pro) throws SQLException {
		proDAO.updateProject(pro);

	}

	@Override
	public void notDoProject(String pCode) throws SQLException {
		proDAO.notDoProject(pCode);

	}

	@Override
	public void insertPL(PjmVO pjm) throws SQLException {
		proDAO.insertPL(pjm);

	}

	@Override
	public String getPcode() throws SQLException {

		String pCode = proDAO.getPcode();

		return pCode;
	}

	@Override
	public ProVO getProInfo(String pCode) throws SQLException {

		ProVO proInfo = proDAO.getProInfo(pCode);

		return proInfo;
	}

	@Override
	public void registPA(PAVO pa) throws SQLException {

		int pano = proDAO.getPASeqNextValue();
		String panos = "pra" + Integer.toString(pano);

		pa.setPaCode(panos);
		proDAO.insertPA(pa);

		if (pa.getAttachList() != null)
			for (PAAttachVO attach : pa.getAttachList()) {
				attach.setPaCode(panos);
				paattachDAO.insertPAAttach(attach);
			}

	}

	@Override
	public Map<String, Object> getPAList(SearchCriteriaByPA cri) throws SQLException {
		List<PAVO> paList = proDAO.selectPACriteria(cri);

		if (paList != null)
			for (PAVO pa : paList)
				addAttachList(pa);

		PageMakerByPA pageMaker = new PageMakerByPA();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(proDAO.selectPACriteriaTotalCount(cri));

		Map<String, Object> dataMap = new HashMap<String, Object>();
		dataMap.put("paList", paList);
		dataMap.put("pageMaker", pageMaker);

		return dataMap;
	}

	private void addAttachList(PAVO pa) throws SQLException {
		if (pa == null)
			return;

		String pacode = pa.getPaCode();
		List<PAAttachVO> attachList = paattachDAO.selectAttachesByPACode(pacode);

		pa.setAttachList(attachList);

	}

	@Override
	public PAVO getPA(String pacode) throws SQLException {
		PAVO pa = proDAO.selectPAByPACode(pacode);
		addAttachList(pa);

		return pa;
	}

	@Override
	public PAAttachVO getAttachByPaAtNo(int paatno) throws SQLException {
		PAAttachVO attach = paattachDAO.selectAttachByPaAtNo(paatno);

		return attach;
	}
	
	@Override
	public List<PAAttachVO> getPAAllAttachesBypCode(String pCode) throws SQLException {
		List<PAAttachVO> attachList = paattachDAO.selectPAAllAttachesBypCode(pCode);

		return attachList;
	}

	@Override
	public void removeAttachByPaAtNo(int paatno) throws SQLException {
		// TODO Auto-generated method stub
		paattachDAO.deleteAttach(paatno);
	}

	@Override
	public void modifyPA(PAVO pa) throws SQLException {
		proDAO.updatePA(pa);

		if (pa.getAttachList() != null)
			for (PAAttachVO attach : pa.getAttachList()) {
				attach.setPaCode(pa.getPaCode());
				paattachDAO.insertPAAttach(attach);
			}
	}

	@Override
	public void remove(String pacode) throws SQLException {
		paattachDAO.deleteAttachAll(pacode);
		proDAO.deletePds(pacode);
	}

	@Override
	public List<ProEmpVO> selectProMemberList(String pCode) throws SQLException {

		List<ProEmpVO> pjmList = proDAO.selectProMemberList(pCode);

		return pjmList;
	}

	@Override
	public void registRelegate(RelegateVO rlvo) throws SQLException {
		proDAO.insertRelegate(rlvo);
	}

	@Override
	public void insertMember(PjmVO pjm) throws SQLException {
		proDAO.insertMember(pjm);
		
	}

	@Override
	public RelegateVO selectRelegate(String pCode) throws SQLException {
		RelegateVO relegate = proDAO.selectRelegate(pCode);
		return relegate;
	}

	@Override
	public void removeRelegate(String pCode) throws SQLException {
		proDAO.deleteRelegate(pCode);
	}

	@Override
	public void DoProject(String pCode) throws SQLException {
		proDAO.DoProject(pCode);
		
	}

	@Override
	public void updateAu(PjmVO pjm) throws SQLException {
		
		proDAO.updateAu(pjm);
		
	}

	@Override
	public List<ProVO> getCompletionDateProList() throws SQLException{
		List<ProVO> cdList = proDAO.getCompletionDateProList();
		return cdList;
	}

	@Override
	public void updateService(ProVO pro) throws SQLException {
		
		proDAO.updateService(pro);
		
	}

	@Override
	public List<PIVO> selectPIList(String pCode) throws SQLException {
		List<PIVO> piList = proDAO.selectPIList(pCode);
		return piList;
	}

	@Override
	public List<Object> selectPIMileStoneList(String pCode) throws SQLException {
		List<Object> piMileStoneList = proDAO.selectPIMileStoneList(pCode);
		return piMileStoneList;
	}

	@Override
	public PIVO selectPI(String piCode) throws SQLException {
		PIVO pi = proDAO.selectPI(piCode);
		return pi;
	}

	@Override
	public void insertPI(PIVO pi) throws SQLException {
		proDAO.insertPI(pi);
	}

	@Override
	public void insertPINew(PIVO pi) throws SQLException {
		proDAO.insertPINew(pi);
	}

	@Override
	public void completePI(String piCode) throws SQLException {
		proDAO.completePI(piCode);
	}

}
