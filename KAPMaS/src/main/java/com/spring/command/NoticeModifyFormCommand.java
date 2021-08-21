package com.spring.command;

import com.spring.dto.NoticeVO;

public class NoticeModifyFormCommand {

	private String noticeNo     ;
	private String noticeTitle  ;
	private String noticeContent;
	public String getNoticeNo() {
		return noticeNo;
	}
	public void setNoticeNo(String noticeNo) {
		this.noticeNo = noticeNo;
	}
	public String getNoticeTitle() {
		return noticeTitle;
	}
	public void setNoticeTitle(String noticeTitle) {
		this.noticeTitle = noticeTitle;
	}
	public String getNoticeContent() {
		return noticeContent;
	}
	public void setNoticeContent(String noticeContent) {
		this.noticeContent = noticeContent;
	}
	

public NoticeVO toNoticeVO() {
	NoticeVO notice = new NoticeVO();
	notice.setNoticeNo(noticeNo);
	notice.setNoticeTitle(noticeTitle);
	notice.setNoticeContent(noticeContent);
	
	
	return notice;
}
	
	
	
	
	
	
}
