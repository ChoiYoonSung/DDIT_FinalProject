package com.spring.command;

import com.spring.dto.AnswerLikeVO;

public class AnswerLikeCommand2 {
	private String aCode ;
	private String empId ;
	
	
	public String getaCode() {
		return aCode;
	}
	public void setaCode(String aCode) {
		this.aCode = aCode;
	}
	public String getEmpId() {
		return empId;
	}
	public void setEmpId(String empId) {
		this.empId = empId;
	}
	
	
	public AnswerLikeVO toLikeVO() {
		AnswerLikeVO aLike = new AnswerLikeVO();
		aLike.setEmpId(this.empId);
		aLike.setaCode(this.aCode);
		
		return aLike;
	}
	
	
	
	
	
	
}
