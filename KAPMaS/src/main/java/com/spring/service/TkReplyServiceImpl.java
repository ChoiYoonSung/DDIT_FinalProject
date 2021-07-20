package com.spring.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.spring.command.PageMaker;
import com.spring.command.SearchCriteria;
import com.spring.dao.LikeDAO;
import com.spring.dao.TkReplyDAO;
import com.spring.dto.TkReplyVO;

public class TkReplyServiceImpl implements TkReplyService {
	
	private TkReplyDAO tkReplyDAO;

	public void setTkReplyDAO(TkReplyDAO tkReplyDAO) {
		this.tkReplyDAO = tkReplyDAO;
	}

	@Override
	public Map<String, Object> getTkReplyList(String tkCode, SearchCriteria cri) throws SQLException {

		Map<String, Object> dataMap = new HashMap<String, Object>();

		List<TkReplyVO> replyList = tkReplyDAO.selectTkReplyListPage(tkCode, cri);

		int count = tkReplyDAO.countTkReply(tkCode);

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(count);

		dataMap.put("replyList", replyList);
		dataMap.put("pageMaker", pageMaker);

		return dataMap;
	}

	@Override
	public int getTkReplyListCount(String tkCode) throws SQLException {
		int count = tkReplyDAO.countTkReply(tkCode);
		return count;
	}

	@Override
	public void registTkReply(TkReplyVO tkReply) throws SQLException {
		int tkRpCode = tkReplyDAO.selectTkReplySeqNextValue();
		tkReply.setTkRpCode(tkRpCode);

		tkReplyDAO.insertTkReply(tkReply);

	}

	@Override
	public void modifyTkReply(TkReplyVO tkReply) throws SQLException {
		tkReplyDAO.updateTkReply(tkReply);

	}

	@Override
	public void removeTkReply(int tkRpCode) throws SQLException {
		tkReplyDAO.deleteTkReply(tkRpCode);
	}

}
