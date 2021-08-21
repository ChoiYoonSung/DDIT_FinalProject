package com.spring.service;

import java.sql.SQLException;
import java.util.List;

import com.spring.dao.QnaDAO;
import com.spring.dto.QnaVO;

public class QnaServiceImpl implements QnaService {

	private QnaDAO qnaDAO;

	public void setQnaDAO(QnaDAO qnaDAO) {
		this.qnaDAO = qnaDAO;
	}

	@Override
	public List<QnaVO> selectQnaList() throws SQLException {
		List<QnaVO> qnaList = qnaDAO.selectQnaList();

		return qnaList;
	}

	@Override
	public QnaVO selectQnaInfo(String qnaNo) throws SQLException {
		QnaVO qna = qnaDAO.selectQnaInfo(qnaNo);

		return qna;
	}

	@Override
	public void updateQna(QnaVO qna) throws SQLException {
		qnaDAO.updateQna(qna);

	}

	@Override
	public void deleteQna(String qnaNo) throws SQLException {
		qnaDAO.deleteQna(qnaNo);

	}

	@Override
	public void increaseQnaCnt(String qnaNo) throws SQLException {
		qnaDAO.increaseQnaCnt(qnaNo);

	}

	@Override
	public void decreaseQnaCnt(String qnaNo) throws SQLException {
		qnaDAO.decreaseQnaCnt(qnaNo);

	}

	@Override
	public void insertQna(QnaVO qna) throws SQLException {

		qnaDAO.insertQna(qna);

	}

	@Override
	public String getQnaSequenceNo() throws SQLException {
		String qnaNo = qnaDAO.getQnaSequenceNo();
		return qnaNo;
	}

}
