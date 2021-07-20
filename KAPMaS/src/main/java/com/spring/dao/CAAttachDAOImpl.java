package com.spring.dao;

import java.sql.SQLException;

import org.apache.ibatis.session.SqlSession;

import com.spring.dto.caAttachVO;

public class CAAttachDAOImpl implements CAAttachDAO {

	private SqlSession session;

	public void setSqlsession(SqlSession session) {
		this.session = session;
	}

	@Override
	public void insertCAAttach(caAttachVO attach) throws SQLException {
		session.update("CAAttach-Mapper.insertAttach", attach);
	}

}
