package com.spring.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import com.spring.command.SearchCriteria;
import com.spring.dto.TkReplyVO;

public class TkReplyDAOImpl implements TkReplyDAO {
	
	private SqlSession session;
	
	public void setSqlSession(SqlSession session) {
		this.session = session;
	}

	@Override
	public void insertTkReply(TkReplyVO tkReply) throws SQLException {
		session.update("TkReply-Mapper.insertTkReply", tkReply);

	}

	@Override
	public void updateTkReply(TkReplyVO tkReply) throws SQLException {
		session.update("TkReply-Mapper.updateTkReply", tkReply);
	}

	@Override
	public void deleteTkReply(int tkRpCode) throws SQLException {
		session.update("TkReply-Mapper.deleteTkReply", tkRpCode);

	}

	@Override
	public int selectTkReplySeqNextValue() throws SQLException {
		int tkRpCode = (Integer) session.selectOne("TkReply-Mapper.selectTkReplySeqNextValue");
		return tkRpCode;
	}

	@Override
	public List<TkReplyVO> selectTkReplyListPage(String tkCode, SearchCriteria cri) throws SQLException {
		int offset = cri.getStartRowNum();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset, limit);

		List<TkReplyVO> replyList = session.selectList("TkReply-Mapper.selectTkReplyList", tkCode, rowBounds);
		return replyList;
	}

	@Override
	public int countTkReply(String tkCode) throws SQLException {
		int count = session.selectOne("TkReply-Mapper.countTkReply", tkCode);
		return count;
	}

}
