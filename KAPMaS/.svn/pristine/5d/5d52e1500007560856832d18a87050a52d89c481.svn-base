package com.spring.service;

import java.sql.SQLException;
import java.util.List;

import com.spring.dao.NoticeDAO;
import com.spring.dto.NoticeVO;

public class NoticeServiceImpl implements NoticeService{

	private NoticeDAO noticeDAO;
	public void setNoticeDAO(NoticeDAO noticeDAO) {
		this.noticeDAO = noticeDAO;
	}
	
	@Override
	public List<NoticeVO> getNoticeList() throws SQLException {
		List<NoticeVO> noticeList = null;
		noticeList = noticeDAO.selectNoticeList();
		return noticeList;
	}

	@Override
	public NoticeVO getNoticeByNno(String noticeNo) throws SQLException {
		NoticeVO notice= null;
		notice = noticeDAO.selectNoticeByNno(noticeNo);
		return notice;
	}

	@Override
	public void registNotice(NoticeVO notice) throws SQLException {
		noticeDAO.insertNotice(notice);
	}

	@Override
	public void modifyNotice(NoticeVO notice) throws SQLException {
		noticeDAO.updateNotice(notice);
	}

	@Override
	public void removeNotice(String noticeNo) throws SQLException {
		noticeDAO.deleteNotice(noticeNo);
	}

}
