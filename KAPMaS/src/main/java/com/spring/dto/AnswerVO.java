package com.spring.dto;

public class AnswerVO {

	
	private String aCode   ;
	private String khCode  ;
	private String aWriter ;
	private String aContent;
	private String aRegdate;
	private int aLikecnt;
	private String empName;
	private int replyCnt;
	
	
	public int getReplyCnt() {
		return replyCnt;
	}
	public void setReplyCnt(int replyCnt) {
		this.replyCnt = replyCnt;
	}
	public String getEmpName() {
		return empName;
	}
	public void setEmpName(String empName) {
		this.empName = empName;
	}
	public String getaCode() {
		return aCode;
	}
	public void setaCode(String aCode) {
		this.aCode = aCode;
	}
	public String getKhCode() {
		return khCode;
	}
	public void setKhCode(String khCode) {
		this.khCode = khCode;
	}
	public String getaWriter() {
		return aWriter;
	}
	public void setaWriter(String aWriter) {
		this.aWriter = aWriter;
	}
	public String getaContent() {
		return aContent;
	}
	public void setaContent(String aContent) {
		this.aContent = aContent;
	}
	public String getaRegdate() {
		return aRegdate;
	}
	public void setaRegdate(String aRegdate) {
		this.aRegdate = aRegdate;
	}
	public int getaLikecnt() {
		return aLikecnt;
	}
	public void setaLikecnt(int aLikecnt) {
		this.aLikecnt = aLikecnt;
	}
	
	
	
	
	
	
	
	
	
	
	
}
