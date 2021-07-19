package com.spring.dao;

import java.sql.SQLException;
import java.util.List;

import com.spring.dto.NoticeVO;

public interface NoticeDAO {
	// Notice List
	public List<NoticeVO> selectNoticeList() throws SQLException;
	
	// Notice 상세정보
	public NoticeVO selectNoticeByNno(String noticeNo)throws SQLException;
	
	// 공지사항 추가
	public void insertNotice(NoticeVO notice)throws SQLException;
	
	// 공지사항 수정
	public void updateNotice(NoticeVO notice)throws SQLException;
	
	// 공지사항 삭제
	public void deleteNotice(String noticeNo)throws SQLException;
}
