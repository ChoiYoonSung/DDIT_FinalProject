package com.spring.dto;

import java.util.List;

public class TotalKnowledgeVO {
	
	private String tkCode;
	private String empId;
	private String tkTitle;
	private String tkContent;
	private String tkRegdate;
	private int tkViewCnt;
	private int tkLikeCnt;
	private String tkKeyword;
	private int tkEnabled;
	private int tkReportCnt;
	private List<TkAttachVO> attachList;
	private String empName;
	
	public String getEmpName() {
		return empName;
	}
	public void setEmpName(String empName) {
		this.empName = empName;
	}
	public List<TkAttachVO> getAttachList() {
		return attachList;
	}
	public void setAttachList(List<TkAttachVO> attachList) {
		this.attachList = attachList;
	}
	
	public String getTkCode() {
		return tkCode;
	}
	public void setTkCode(String tkCode) {
		this.tkCode = tkCode;
	}
	public String getEmpId() {
		return empId;
	}
	public void setEmpId(String empId) {
		this.empId = empId;
	}
	public String getTkTitle() {
		return tkTitle;
	}
	public void setTkTitle(String tkTitle) {
		this.tkTitle = tkTitle;
	}
	public String getTkContent() {
		return tkContent;
	}
	public void setTkContent(String tkContent) {
		this.tkContent = tkContent;
	}
	public String getTkRegdate() {
		return tkRegdate;
	}
	public void setTkRegdate(String tkRegdate) {
		this.tkRegdate = tkRegdate;
	}
	public int getTkViewCnt() {
		return tkViewCnt;
	}
	public void setTkViewCnt(int tkViewCnt) {
		this.tkViewCnt = tkViewCnt;
	}
	public int getTkLikeCnt() {
		return tkLikeCnt;
	}
	public void setTkLikeCnt(int tkLikeCnt) {
		this.tkLikeCnt = tkLikeCnt;
	}
	public String getTkKeyword() {
		return tkKeyword;
	}
	public void setTkKeyword(String tkKeyword) {
		this.tkKeyword = tkKeyword;
	}
	public int getTkEnabled() {
		return tkEnabled;
	}
	public void setTkEnabled(int tkEnabled) {
		this.tkEnabled = tkEnabled;
	}
	public int getTkReportCnt() {
		return tkReportCnt;
	}
	public void setTkReportCnt(int tkReportCnt) {
		this.tkReportCnt = tkReportCnt;
	}

	
	

}
