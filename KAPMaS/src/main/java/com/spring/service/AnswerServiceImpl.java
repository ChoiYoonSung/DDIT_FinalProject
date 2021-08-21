package com.spring.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.spring.command.PageMaker;
import com.spring.command.SearchCriteria;
import com.spring.dao.AnswerDAO;
import com.spring.dao.AnswerLikeDAO;
import com.spring.dao.KnowDAO;
import com.spring.dto.AnswerLikeVO;
import com.spring.dto.AnswerVO;

public class AnswerServiceImpl implements AnswerService{

	private AnswerDAO answerDAO;
	public void setAnswerDAO(AnswerDAO answerDAO) {
		this.answerDAO = answerDAO;
	}

	private KnowDAO knowDAO;
	public void setKnowDAO(KnowDAO knowDAO) {
		this.knowDAO = knowDAO;
	}
	
	private AnswerLikeDAO answerLikeDAO;
	public void setAnswerLikeDAO(AnswerLikeDAO answerLikeDAO) {
		this.answerLikeDAO = answerLikeDAO;
	}

	@Override
	public void insertAnswer(AnswerVO answer) throws SQLException {
		answerDAO.insertAnswer(answer);
		
	}

	@Override
	public void updateAnswer(AnswerVO answer) throws SQLException {
		
		answerDAO.updateAnswer(answer);
		
	}

	@Override
	public void deleteAnswer(String aCode,String khCode) throws SQLException {
		answerDAO.deleteAnswer(aCode);
		knowDAO.decreaseReportCnt(khCode);
		
	}

	@Override
	public Map<String, Object> selectAnswerListPage(String khCode, SearchCriteria cri) throws SQLException {
		
		
		Map<String, Object> dataMap = new HashMap<String, Object>();
		
		List<AnswerVO> answerList = answerDAO.selectAnswerListPage(khCode, cri);
		
		int count =answerDAO.countAnswer(khCode);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(count);
		
		dataMap.put("answerList", answerList);
		dataMap.put("pageMaker", pageMaker);
		
		return dataMap;
	}

	@Override
	public int countAnswer(String khCode) throws SQLException {
		
		int count = answerDAO.countAnswer(khCode);
		return count;
	}


	@Override
	public List<AnswerVO> selectAnswerListById(String aWriter) throws SQLException {
		List<AnswerVO> answerList = answerDAO.selectAnswerListById(aWriter);
		
		return answerList;
	}

	@Override
	public void increaseCnt(String aCode, AnswerLikeVO aLike) throws SQLException {
		answerDAO.increaseCnt(aCode);
		answerLikeDAO.insertAnswerLike(aLike);
		
	}

	@Override
	public void decreaseCnt(String aCode, AnswerLikeVO aLike) throws SQLException {
		answerDAO.decreaseCnt(aCode);
		answerLikeDAO.deleteAnswerLike(aLike);
	}

	@Override
	public int answerLikeCount(AnswerLikeVO aLike) throws SQLException {
		int count =	answerLikeDAO.answerLikeCount(aLike);
		return count;
	}

}
