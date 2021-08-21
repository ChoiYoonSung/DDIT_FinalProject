package com.spring.service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.spring.command.PageMaker;
import com.spring.command.SearchCriteria;
import com.spring.dao.LikeDAO;
import com.spring.dao.ReportDAO;
import com.spring.dao.TkAttachDAO;
import com.spring.dao.TotalKnowledgeDAO;
import com.spring.dto.LikeVO;
import com.spring.dto.ReportVO;
import com.spring.dto.TkAttachVO;
import com.spring.dto.TotalKnowledgeVO;

public class TotalKnowledgeServiceImpl implements TotalKnowledgeService {

	private TotalKnowledgeDAO totalKnowledgeDAO;

	public void setTotalKnowledgeDAO(TotalKnowledgeDAO totalKnowledgeDAO) {
		this.totalKnowledgeDAO = totalKnowledgeDAO;
	}

	private TkAttachDAO tkAttachDAO;

	public void setTkAttachDAO(TkAttachDAO tkAttachDAO) {
		this.tkAttachDAO = tkAttachDAO;
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
	public TotalKnowledgeVO getTk(String tkCode) throws SQLException {

		TotalKnowledgeVO tk = totalKnowledgeDAO.selectTkByTkCode(tkCode);
		addAttachList(tk);
		
		return tk;
	}

	@Override
	public void regist(TotalKnowledgeVO tk) throws SQLException {
		
		String tkCode = "TKB" + totalKnowledgeDAO.getSeqNextValue();
		
		tk.setTkCode(tkCode);
		totalKnowledgeDAO.insertTk(tk);
		
		if(tk.getAttachList() != null) {
			for(TkAttachVO attach : tk.getAttachList()) {
				attach.setTkCode(tkCode);
				attach.setTkAtAttacher(tk.getEmpId());
				tkAttachDAO.insertAttach(attach);
			}
		}

		
	}

	@Override
	public void modify(TotalKnowledgeVO tk) throws SQLException {
		
		totalKnowledgeDAO.updateTk(tk);
		
		if(tk.getAttachList() != null) {
			for(TkAttachVO attach : tk.getAttachList()) {
				attach.setTkCode(tk.getTkCode());
				attach.setTkAtAttacher(tk.getEmpId());
				tkAttachDAO.insertAttach(attach);
			}
		}
		
	}

	@Override
	public void remove(String tkCode) throws SQLException {
		totalKnowledgeDAO.deleteTk(tkCode);
		
	}

	@Override
	public Map<String, Object> getList(SearchCriteria cri) throws Exception {
		List<TotalKnowledgeVO> tkList = totalKnowledgeDAO.selectTkCriteria(cri);

		if (tkList != null)
			for (TotalKnowledgeVO tk : tkList)
				addAttachList(tk);

		Map<String, Object> dataMap = new HashMap<String, Object>();
		dataMap.put("tkList", tkList);

		return dataMap;
	}
	
	@Override
	public Map<String, Object> getListArr(String[] userArray) throws Exception {
		List<TotalKnowledgeVO> tkList = totalKnowledgeDAO.selectTkCriteriaArr(userArray);
		
		if (tkList != null)
			for (TotalKnowledgeVO tk : tkList)
				addAttachList(tk);
		
		Map<String, Object> dataMap = new HashMap<String, Object>();
		dataMap.put("tkList", tkList);
		
		return dataMap;
	}
	@Override
	public Map<String, Object> getListArr2(String[] userArray) throws Exception {
		List<TotalKnowledgeVO> tkList = totalKnowledgeDAO.selectTkCriteriaArr2(userArray);
		
		if (tkList != null)
			for (TotalKnowledgeVO tk : tkList)
				addAttachList(tk);
		
		Map<String, Object> dataMap = new HashMap<String, Object>();
		dataMap.put("tkList", tkList);
		
		return dataMap;
	}
	@Override
	public Map<String, Object> getList2(SearchCriteria cri) throws Exception {
		List<TotalKnowledgeVO> tkList = totalKnowledgeDAO.selectTkCriteria2(cri);
		
		if (tkList != null)
			for (TotalKnowledgeVO tk : tkList)
				addAttachList(tk);
		
		Map<String, Object> dataMap = new HashMap<String, Object>();
		dataMap.put("tkList", tkList);
		
		return dataMap;
	}
	

	@Override
	public List<TotalKnowledgeVO> getListList() throws SQLException, Exception {
		List<TotalKnowledgeVO> list = new ArrayList<>();
		list = totalKnowledgeDAO.getAllList();
		
		return list;
	}
	@Override
	public TotalKnowledgeVO findFileInContent(String fileName) throws SQLException {
		TotalKnowledgeVO tk = totalKnowledgeDAO.selectTkByFileName(fileName);
		return tk;
	}

	@Override
	public TkAttachVO getAttachByTkAtNo(int tkAtNo) throws SQLException {
		TkAttachVO attach = tkAttachDAO.selectAttachByTkAtNo(tkAtNo);
		
		return attach;
	}

	@Override
	public void removeAttachByTkAtNo(int tkAtNo) throws SQLException {
		tkAttachDAO.deleteAttach(tkAtNo);
		
	}

	@Override
	public TotalKnowledgeVO read(String tkCode) throws SQLException {
		TotalKnowledgeVO tk = totalKnowledgeDAO.selectTkByTkCode(tkCode);
		totalKnowledgeDAO.increaseViewCnt(tkCode);
		
		addAttachList(tk);
		
		return tk;
	}


	@Override
	public void like(String tkCode, LikeVO like) throws SQLException {
		totalKnowledgeDAO.increaseLikeCnt(tkCode);
		likeDAO.insertLike(like);
	}
	
	@Override
	public void likeCancel(String tkCode, LikeVO like) throws SQLException {
		totalKnowledgeDAO.decreaseLikeCnt(tkCode);
		likeDAO.deleteLike(like);
	}
	
	@Override
	public int likeCount(LikeVO like) throws Exception {
		int count = likeDAO.likeCount(like);
		return count;
	}
	
	@Override
	public void report(String tkCode, ReportVO rep) throws SQLException {
		totalKnowledgeDAO.increaseReportCnt(tkCode);
		reportDAO.insertReport(rep);
	}
	
	@Override
	public void reportCancel(String tkCode, ReportVO rep) throws SQLException {
		totalKnowledgeDAO.decreaseReportCnt(tkCode);
		reportDAO.deleteReport(rep);
	}
	
	@Override
	public int reportCount(ReportVO rep) throws SQLException {
		int count = reportDAO.reportCount(rep);
		return count;
	}
	
	private void addAttachList(TotalKnowledgeVO tk) throws SQLException {
 		if (tk == null)	return;

		String tkCode = tk.getTkCode();
		List<TkAttachVO> attachList = tkAttachDAO.selectAttachesByTkCode(tkCode);
		tk.setAttachList(attachList);
	}

	@Override
	public void disable(String tkCode) throws SQLException {
		totalKnowledgeDAO.disableTk(tkCode);
	}





	


}
