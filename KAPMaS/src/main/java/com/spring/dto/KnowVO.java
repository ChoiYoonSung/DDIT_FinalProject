package com.spring.dto;

public class KnowVO {
	
	private String khCode     ;
	private String empId      ;
	private String khTitle    ;
	private String khContent  ;
	private String khRegdate  ;
	private int khReportcnt;
	private String khKeyword  ;
	private int khEnabled  ;
	private int khViewcnt  ;
	private int khLikecnt  ;
	private String khCategory ;
	private int answercnt;
	private String empName;
	
	
	
	public String getEmpName() {
		return empName;
	}
	public void setEmpName(String empName) {
		this.empName = empName;
	}
	public int getKhLikecnt() {
		return khLikecnt;
	}
	public void setKhLikecnt(int khLikecnt) {
		this.khLikecnt = khLikecnt;
	}
	public int getAnswercnt() {
		return answercnt;
	}
	public void setAnswercnt(int answercnt) {
		this.answercnt = answercnt;
	}
	public String getKhCode() {
		return khCode;
	}
	public void setKhCode(String khCode) {
		this.khCode = khCode;
	}
	public String getEmpId() {
		return empId;
	}
	public void setEmpId(String empId) {
		this.empId = empId;
	}
	public String getKhTitle() {
		return khTitle;
	}
	public void setKhTitle(String khTitle) {
		this.khTitle = khTitle;
	}
	public String getKhContent() {
		return khContent;
	}
	public void setKhContent(String khContent) {
		this.khContent = khContent;
	}
	public String getKhRegdate() {
		return khRegdate;
	}
	public void setKhRegdate(String khRegdate) {
		this.khRegdate = khRegdate;
	}
	public int getKhReportcnt() {
		return khReportcnt;
	}
	public void setKhReportcnt(int khReportcnt) {
		this.khReportcnt = khReportcnt;
	}
	public String getKhKeyword() {
		return khKeyword;
	}
	public void setKhKeyword(String khKeyword) {
		this.khKeyword = khKeyword;
	}
	public int getKhEnabled() {
		return khEnabled;
	}
	public void setKhEnabled(int khEnabled) {
		this.khEnabled = khEnabled;
	}
	public int getKhViewcnt() {
		return khViewcnt;
	}
	public void setKhViewcnt(int khViewcnt) {
		this.khViewcnt = khViewcnt;
	}
	public String getKhCategory() {
		return khCategory;
	}
	public void setKhCategory(String khCategory) {
		this.khCategory = khCategory;
	}




}
