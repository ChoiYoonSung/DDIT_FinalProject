package com.spring.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.spring.dto.NoticeVO;

public class NoticeDAOImpl implements NoticeDAO{
	
	private SqlSession session;
	public void setSqlSession(SqlSession session) {
		this.session = session;
	}

	@Override
	public List<NoticeVO> selectNoticeList() throws SQLException {
		List<NoticeVO> noticeList = session.selectList("Notice-Mapper.selectNoticeList");
		return noticeList;
	}
	
	@Override
	public NoticeVO selectNoticeByNno(String noticeNo) throws SQLException {
		NoticeVO notice = session.selectOne("Notice-Mapper.selectNoticeByNno",noticeNo);
		return notice;
	}

	@Override
	public void insertNotice(NoticeVO notice) throws SQLException {
		session.update("Notice-Mapper.insertNotice",notice);
	}

	@Override
	public void updateNotice(NoticeVO notice) throws SQLException {
		session.update("Notice-Mapper.updateNotice",notice);
	}

	@Override
	public void deleteNotice(String noticeNo) throws SQLException {
		session.update("Notice-Mapper.deleteNotice",noticeNo);
	}




}
