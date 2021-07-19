package com.spring.dto;

public class NoticeVO {
	private static String noticeNo;
	private static String empId;
	private static String noticeTitle;
	private static String noticeContent;
	private static String noticeRegdate;
	private static int noticeViewcnt;
	public static String getNoticeNo() {
		return noticeNo;
	}
	public static void setNoticeNo(String noticeNo) {
		NoticeVO.noticeNo = noticeNo;
	}
	public static String getEmpId() {
		return empId;
	}
	public static void setEmpId(String empId) {
		NoticeVO.empId = empId;
	}
	public static String getNoticeTitle() {
		return noticeTitle;
	}
	public static void setNoticeTitle(String noticeTitle) {
		NoticeVO.noticeTitle = noticeTitle;
	}
	public static String getNoticeContent() {
		return noticeContent;
	}
	public static void setNoticeContent(String noticeContent) {
		NoticeVO.noticeContent = noticeContent;
	}
	public static String getNoticeRegdate() {
		return noticeRegdate;
	}
	public static void setNoticeRegdate(String noticeRegdate) {
		NoticeVO.noticeRegdate = noticeRegdate;
	}
	public static int getNoticeViewcnt() {
		return noticeViewcnt;
	}
	public static void setNoticeViewcnt(int noticeViewcnt) {
		NoticeVO.noticeViewcnt = noticeViewcnt;
	}
}
