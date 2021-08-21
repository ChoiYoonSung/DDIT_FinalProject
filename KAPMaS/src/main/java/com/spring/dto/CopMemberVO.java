package com.spring.dto;

public class CopMemberVO {

	private String empId;
	private String copCode;
	private String copmAuth;

	private String copName;

	private String title;
	private String content;

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getCopName() {
		return copName;
	}

	public void setCopName(String copName) {
		this.copName = copName;
	}

	public String getEmpId() {
		return empId;
	}

	public void setEmpId(String empId) {
		this.empId = empId;
	}

	public String getCopCode() {
		return copCode;
	}

	public void setCopCode(String copCode) {
		this.copCode = copCode;
	}

	public String getCopmAuth() {
		return copmAuth;
	}

	public void setCopmAuth(String copmAuth) {
		this.copmAuth = copmAuth;
	}

}
