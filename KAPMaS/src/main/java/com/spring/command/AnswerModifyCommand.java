package com.spring.command;

import com.spring.dto.AnswerVO;

public class AnswerModifyCommand {
	private String aCode   ;
	private String aContent;
	private String khCode;
	
	
	
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
	public String getaContent() {
		return aContent;
	}
	public void setaContent(String aContent) {
		this.aContent = aContent;
	}
	
	
	
	
	
	
	public AnswerVO toAnswerVO() {
		AnswerVO answer = new AnswerVO();
		answer.setaCode(aCode);
		answer.setaContent(aContent);
		answer.setKhCode(khCode);
		
		return answer;
	}
	
	
	
	
	
	
	
	
	
}
