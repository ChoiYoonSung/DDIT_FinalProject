package com.spring.dto;

public class DailyReportVO {
	private String drCode;		// 보고서 코드
	private String pCode;		// 프로젝트 코드
	private String empId;		// 작성일
	private String jobCode;		// 업무코드
	private String drContent;	// 보고서내용
	private String drTitle;		// 보고서 제목
	private String drRegDate;	// 보고서 작성일
	
	private String empName;

	public String getdrCode() {
		return drCode;
	}

	public void setdrCode(String drCode) {
		this.drCode = drCode;
	}

	public String getpCode() {
		return pCode;
	}

	public void setpCode(String pCode) {
		this.pCode = pCode;
	}

	public String getEmpId() {
		return empId;
	}

	public void setEmpId(String empId) {
		this.empId = empId;
	}

	public String getJobCode() {
		return jobCode;
	}

	public void setJobCode(String jobCode) {
		this.jobCode = jobCode;
	}

	public String getDrContent() {
		return drContent;
	}

	public void setDrContent(String drContent) {
		this.drContent = drContent;
	}

	public String getDrTitle() {
		return drTitle;
	}

	public void setDrTitle(String drTitle) {
		this.drTitle = drTitle;
	}

	public String getDrRegDate() {
		return drRegDate;
	}

	public void setDrRegDate(String drRegDate) {
		this.drRegDate = drRegDate;
	}

	public String getEmpName() {
		return empName;
	}

	public void setEmpName(String empName) {
		this.empName = empName;
	}
	
}
