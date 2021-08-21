package com.spring.command;

import com.spring.dto.NoticeVO;

public class NoticeRegistFormCommand {

	private String noticeTitle  ;
	private String noticeContent;
	
	
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
		notice.setNoticeTitle(noticeTitle);
		notice.setNoticeContent(noticeContent);
		
		return notice;
	}
	
	
	
	
	
}
