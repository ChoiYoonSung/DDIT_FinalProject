package com.spring.dto;

public class WeeklyReportVO {
	private String wrCode;				// 보고서 코드
	private String empId;				// 작성자 아이디
	private String pCode;				// 프로젝트 코드
	private String wrTitle;				// 보고서 제목
	private String wrRegDate;			// 보고서 작성일
	private String wrPlan;				// 보고서 계획
	private String wrProg;				// 보고서  진행현황
	private String wrIssue;				// 보고서 이슈
	private String wrIssueMeasures;		// 보고서 이슈 해결방안
	private String wrRemark;			// 보고서 비고
	
	private String empName;
	
	public String getEmpName() {
		return empName;
	}
	public void setEmpName(String empName) {
		this.empName = empName;
	}
	public String getWrCode() {
		return wrCode;
	}
	public void setWrCode(String wrCode) {
		this.wrCode = wrCode;
	}
	public String getEmpId() {
		return empId;
	}
	public void setEmpId(String empId) {
		this.empId = empId;
	}
	public String getpCode() {
		return pCode;
	}
	public void setpCode(String pCode) {
		this.pCode = pCode;
	}
	public String getWrTitle() {
		return wrTitle;
	}
	public void setWrTitle(String wrTitle) {
		this.wrTitle = wrTitle;
	}
	public String getWrRegDate() {
		return wrRegDate;
	}
	public void setWrRegDate(String wrRegDate) {
		this.wrRegDate = wrRegDate;
	}
	public String getWrPlan() {
		return wrPlan;
	}
	public void setWrPlan(String wrPlan) {
		this.wrPlan = wrPlan;
	}
	public String getWrProg() {
		return wrProg;
	}
	public void setWrProg(String wrProg) {
		this.wrProg = wrProg;
	}
	public String getWrIssue() {
		return wrIssue;
	}
	public void setWrIssue(String wrIssue) {
		this.wrIssue = wrIssue;
	}
	public String getWrIssueMeasures() {
		return wrIssueMeasures;
	}
	public void setWrIssueMeasures(String wrIssueMeasures) {
		this.wrIssueMeasures = wrIssueMeasures;
	}
	public String getWrRemark() {
		return wrRemark;
	}
	public void setWrRemark(String wrRemark) {
		this.wrRemark = wrRemark;
	}
}
