package com.spring.command;

import com.spring.dto.AnswerVO;

public class AnswerDeleteCommand {
	private String aCode;
	private String khCode;
	private String empId;
	
	
	public String getEmpId() {
		return empId;
	}

	public void setEmpId(String empId) {
		this.empId = empId;
	}

	public String getKhCode() {
		return khCode;
	}

	public void setKhCode(String khCode) {
		this.khCode = khCode;
	}

	public String getaCode() {
		return aCode;
	}

	public void setaCode(String aCode) {
		this.aCode = aCode;
	}
	
	
	
	public AnswerVO toAnswerVO() {
		AnswerVO answer = new AnswerVO();
		answer.setaCode(aCode);
		answer.setKhCode(khCode);
		return answer;
	}
	
	
	
	
	
	
	
	
	
}
