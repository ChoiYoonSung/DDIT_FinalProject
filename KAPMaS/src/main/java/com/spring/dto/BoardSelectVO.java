package com.spring.dto;

public class BoardSelectVO {
	private String bdType;
	private String bdCode;
	private String bdTitle;
	private String empId;
	private String bdRegDate;
	
	private String bdName;

	public String getBdType() {
		return bdType;
	}

	public void setBdType(String bdType) {
		this.bdType = bdType;
	}

	public String getBdCode() {
		return bdCode;
	}

	public void setBdCode(String bdCode) {
		this.bdCode = bdCode;
	}

	public String getBdTitle() {
		return bdTitle;
	}

	public void setBdTitle(String bdTitle) {
		this.bdTitle = bdTitle;
	}

	public String getEmpId() {
		return empId;
	}

	public void setEmpId(String empId) {
		this.empId = empId;
	}

	public String getBdRegDate() {
		return bdRegDate;
	}

	public void setBdRegDate(String bdRegDate) {
		this.bdRegDate = bdRegDate;
	}

	public String getBdName() {
		return bdName;
	}

	public void setBdName(String bdName) {
		this.bdName = bdName;
	}
}
