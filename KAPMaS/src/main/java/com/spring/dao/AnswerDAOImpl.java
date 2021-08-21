package com.spring.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import com.spring.command.SearchCriteria;
import com.spring.dto.AnswerVO;

public class AnswerDAOImpl implements AnswerDAO{

	private SqlSession session;

	public void setSqlsession(SqlSession session) {
		this.session = session;
	}
	
	@Override
	public void insertAnswer(AnswerVO answer) throws SQLException {
		session.update("Answer-Mapper.insertAnswer",answer);
		
	}

	@Override
	public void updateAnswer(AnswerVO answer) throws SQLException {
		session.update("Answer-Mapper.updatAnswer",answer);
		
	}

	@Override
	public void deleteAnswer(String aCode) throws SQLException {
		session.update("AsReply-Mapper.deleteAsReplyByAcode",aCode);
		session.update("Answer-Mapper.deleteAnswer",aCode);
		
	}

	@Override
	public List<AnswerVO> selectAnswerListPage(String khCode, SearchCriteria cri) throws SQLException {
		int offset = cri.getStartRowNum();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		
		List<AnswerVO> answerList = session.selectList("Answer-Mapper.selectAnswerList",khCode,rowBounds);
		
		return answerList;
	}

	@Override
	public int countAnswer(String khCode) throws SQLException {
		
		int count = session.selectOne("Answer-Mapper.countAnswer", khCode);
		
		return count;
	}

	@Override
	public List<AnswerVO> selectAnswerListById(String aWriter) throws SQLException {
		
		
		List<AnswerVO> answerList = session.selectList("Answer-Mapper.selectAnswerListById",aWriter);
		
		
		return answerList;
	}

	@Override
	public void increaseCnt(String aCode) throws SQLException {
		session.update("Answer-Mapper.increaseCnt",aCode);
		
	}

	@Override
	public void decreaseCnt(String aCode) throws SQLException {
		session.update("Answer-Mapper.decreaseCnt",aCode);
		
	}

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
