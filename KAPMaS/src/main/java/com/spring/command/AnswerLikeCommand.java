package com.spring.command;

import com.spring.dto.LikeVO;

public class AnswerLikeCommand {
	private String aCode ;
	private String khCode;
	private String empId ;
	
	
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
	public String getEmpId() {
		return empId;
	}
	public void setEmpId(String empId) {
		this.empId = empId;
	}
	
	
	public LikeVO toLikeVO() {
		LikeVO like = new LikeVO();
		like.setEmpId(this.empId);
		like.setBdCode(khCode);
		
		return like;
	}
	
	
	
	
	
	
}
