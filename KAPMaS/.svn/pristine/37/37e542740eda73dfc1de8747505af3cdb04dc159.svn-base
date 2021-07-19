package com.spring.service;

import java.sql.SQLException;
import java.util.List;

import com.spring.dto.NoticeVO;

public interface NoticeService {
	
	//공지사항 리스트 조회
	List<NoticeVO> getNoticeList() throws SQLException;
	//공지사항 상세 조회
	NoticeVO getNoticeByNno(String noticeNo)throws SQLException;
	//공지사항 등록
	void registNotice(NoticeVO notice) throws SQLException;
	//공지사항 수정
	void modifyNotice(NoticeVO notice) throws SQLException;
	//공지사항 삭제
	void removeNotice(String noticeNo) throws SQLException;
	
}
