package com.spring.dto;

import java.util.Date;

public class TkReplyVO {
	
	private int tkRpCode;
	private String tkCode;
	private String tkRpContent;
	private Date tkRpRegdate;
	private String tkRpWriter;
	private String empName;
	
	public String getEmpName() {
		return empName;
	}
	public void setEmpName(String empName) {
		this.empName = empName;
	}
	public Date getTkRpRegdate() {
		return tkRpRegdate;
	}
	public void setTkRpRegdate(Date tkRpRegdate) {
		this.tkRpRegdate = tkRpRegdate;
	}
	
	public int getTkRpCode() {
		return tkRpCode;
	}
	public void setTkRpCode(int tkRpCode) {
		this.tkRpCode = tkRpCode;
	}
	public String getTkCode() {
		return tkCode;
	}
	public void setTkCode(String tkCode) {
		this.tkCode = tkCode;
	}
	public String getTkRpContent() {
		return tkRpContent;
	}
	public void setTkRpContent(String tkRpContent) {
		this.tkRpContent = tkRpContent;
	}

	public String getTkRpWriter() {
		return tkRpWriter;
	}
	public void setTkRpWriter(String tkRpWriter) {
		this.tkRpWriter = tkRpWriter;
	}
	
	

}
