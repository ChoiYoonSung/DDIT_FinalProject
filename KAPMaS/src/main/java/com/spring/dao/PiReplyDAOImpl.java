package com.spring.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import com.spring.command.SearchCriteria;
import com.spring.dto.PIReplyVO;

public class PiReplyDAOImpl implements PiReplyDAO {
	
	private SqlSession session;
	
	public void setSqlSession(SqlSession session) {
		this.session = session;
	}

	@Override
	public void insertPiReply(PIReplyVO piReply) throws SQLException {
		session.update("PI-Mapper.insertPiReply", piReply);

	}

	@Override
	public void updatePiReply(PIReplyVO piReply) throws SQLException {
		session.update("PI-Mapper.updatePiReply", piReply);
	}

	@Override
	public void deletePiReply(int piRpCode) throws SQLException {
		session.update("PI-Mapper.deletePiReply", piRpCode);

	}

	@Override
	public int selectPiReplySeqNextValue() throws SQLException {
		int piRpCode = (Integer) session.selectOne("PI-Mapper.selectPiReplySeqNextValue");
		return piRpCode;
	}

	@Override
	public List<PIReplyVO> selectPiReplyListPage(String piCode, SearchCriteria cri) throws SQLException {
		int offset = cri.getStartRowNum();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset, limit);

		List<PIReplyVO> replyList = session.selectList("PI-Mapper.selectPiReplyList", piCode, rowBounds);
		return replyList;
	}

	@Override
	public int countPiReply(String piCode) throws SQLException {
		int count = session.selectOne("PI-Mapper.countPiReply", piCode);
		return count;
	}

}
