package com.spring.dto;

public class NoticeVO {
	private  String noticeNo;
	private  String noticeTitle;
	private  String noticeContent;
	private  String noticeRegdate;
	private  int noticeViewcnt;
	
	
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
	public String getNoticeRegdate() {
		return noticeRegdate;
	}
	public void setNoticeRegdate(String noticeRegdate) {
		this.noticeRegdate = noticeRegdate;
	}
	public int getNoticeViewcnt() {
		return noticeViewcnt;
	}
	public void setNoticeViewcnt(int noticeViewcnt) {
		this.noticeViewcnt = noticeViewcnt;
	}

	
}
