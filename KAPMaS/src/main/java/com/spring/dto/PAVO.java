package com.spring.dto;

import java.util.List;

public class PAVO {
	private int paRowNum;
	private String pCode;
	private String paCode;
	private String empId;
	private String paTitle;
	private String paContent;
	private String paRegdate;
	private String empName;
	private String paAtType;
	
	private List<PAAttachVO> attachList;
	
	
	public int getPaRowNum() {
		return paRowNum;
	}
	public void setPaRowNum(int paRowNum) {
		this.paRowNum = paRowNum;
	}
	public String getPaCode() {
		return paCode;
	}
	public void setPaCode(String paCode) {
		this.paCode = paCode;
	}
	public String getpCode() {
		return pCode;
	}
	public void setpCode(String pCode) {
		this.pCode = pCode;
	}
	
	public String getPaTitle() {
		return paTitle;
	}
	public void setPaTitle(String paTitle) {
		this.paTitle = paTitle;
	}
	public String getPaContent() {
		return paContent;
	}
	public void setPaContent(String paContent) {
		this.paContent = paContent;
	}
	public String getPaRegdate() {
		return paRegdate;
	}
	public void setPaRegdate(String paRegdate) {
		this.paRegdate = paRegdate;
	}
	public List<PAAttachVO> getAttachList() {
		return attachList;
	}
	public void setAttachList(List<PAAttachVO> attachList) {
		this.attachList = attachList;
	}
	public String getEmpName() {
		return empName;
	}
	public void setEmpName(String empName) {
		this.empName = empName;
	}
	public String getPaAtType() {
		return paAtType;
	}
	public void setPaAtType(String paAtType) {
		this.paAtType = paAtType;
	}
	public String getEmpId() {
		return empId;
	}
	public void setEmpId(String empId) {
		this.empId = empId;
	}

	

	
	
}
