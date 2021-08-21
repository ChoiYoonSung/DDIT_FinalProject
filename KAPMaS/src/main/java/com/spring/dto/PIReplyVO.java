package com.spring.dto;

public class PIReplyVO {
	private int piRpCode;
	private String piCode;
	private String piRpContent;
	private String piRpRegdate;
	private String empId;
	
	public int getPiRpCode() {
		return piRpCode;
	}
	public void setPiRpCode(int piRpCode) {
		this.piRpCode = piRpCode;
	}
	public String getPiCode() {
		return piCode;
	}
	public void setPiCode(String piCode) {
		this.piCode = piCode;
	}
	public String getPiRpContent() {
		return piRpContent;
	}
	public void setPiRpContent(String piRpContent) {
		this.piRpContent = piRpContent;
	}
	public String getPiRpRegdate() {
		return piRpRegdate;
	}
	public void setPiRpRegdate(String piRpRegdate) {
		this.piRpRegdate = piRpRegdate;
	}
	public String getEmpId() {
		return empId;
	}
	public void setEmpId(String empId) {
		this.empId = empId;
	}
}
