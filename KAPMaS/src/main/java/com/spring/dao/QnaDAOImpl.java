package com.spring.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.spring.dto.QnaVO;

public class QnaDAOImpl implements QnaDAO {

	private SqlSession session;

	public void setSqlsession(SqlSession session) {
		this.session = session;
	}

	@Override
	public List<QnaVO> selectQnaList() throws SQLException {
		List<QnaVO> qnaList = session.selectList("Qna-Mapper.selectQnaList");

		return qnaList;
	}

	@Override
	public QnaVO selectQnaInfo(String qnaNo) throws SQLException {

		QnaVO qna = session.selectOne("Qna-Mapper.selectQnaInfo", qnaNo);

		return qna;
	}

	@Override
	public void updateQna(QnaVO qna) throws SQLException {
		session.update("Qna-Mapper.updateQna", qna);

	}

	@Override
	public void deleteQna(String qnaNo) throws SQLException {
		session.update("Qna-Mapper.deleteQna", qnaNo);

	}

	@Override
	public void increaseQnaCnt(String qnaNo) throws SQLException {
		session.update("Qna-Mapper.increaseQnaCnt", qnaNo);

	}

	@Override
	public void decreaseQnaCnt(String qnaNo) throws SQLException {
		session.update("Qna-Mapper.decreaseQnaCnt", qnaNo);

	}

	@Override
	public void insertQna(QnaVO qna) throws SQLException {

		session.update("Qna-Mapper.insertQna", qna);

	}

	@Override
	public String getQnaSequenceNo() {
		String qnaNo = session.selectOne("Qna-Mapper.getQnaSequenceNO");
		return qnaNo;
	}

}
