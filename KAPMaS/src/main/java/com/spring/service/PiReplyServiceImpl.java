package com.spring.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.spring.command.PageMaker;
import com.spring.command.SearchCriteria;
import com.spring.dao.PiReplyDAO;
import com.spring.dto.PIReplyVO;

public class PiReplyServiceImpl implements PiReplyService {
	
	private PiReplyDAO piReplyDAO;

	public void setPiReplyDAO(PiReplyDAO piReplyDAO) {
		this.piReplyDAO = piReplyDAO;
	}

	@Override
	public Map<String, Object> getPiReplyList(String piCode, SearchCriteria cri) throws SQLException {

		Map<String, Object> dataMap = new HashMap<String, Object>();

		List<PIReplyVO> replyList = piReplyDAO.selectPiReplyListPage(piCode, cri);

		int count = piReplyDAO.countPiReply(piCode);

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(count);

		dataMap.put("replyList", replyList);
		dataMap.put("pageMaker", pageMaker);

		return dataMap;
	}

	@Override
	public int getPiReplyListCount(String piCode) throws SQLException {
		int count = piReplyDAO.countPiReply(piCode);
		return count;
	}

	@Override
	public void registPiReply(PIReplyVO piReply) throws SQLException {
		int piRpCode = piReplyDAO.selectPiReplySeqNextValue();
		piReply.setPiRpCode(piRpCode);

		piReplyDAO.insertPiReply(piReply);

	}

	@Override
	public void modifyPiReply(PIReplyVO piReply) throws SQLException {
		piReplyDAO.updatePiReply(piReply);

	}

	@Override
	public void removePiReply(int piRpCode) throws SQLException {
		piReplyDAO.deletePiReply(piRpCode);
	}

}
