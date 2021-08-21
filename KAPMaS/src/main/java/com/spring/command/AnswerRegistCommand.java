package com.spring.command;

import com.spring.dto.AnswerVO;

public class AnswerRegistCommand {

	private String khCode  ;
	private String aWriter ;
	private String aContent;
	
	
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
	
	
	public AnswerVO toAnswerVO() {
		AnswerVO answer = new AnswerVO();
		answer.setKhCode(khCode);
		answer.setaWriter(aWriter);
		answer.setaContent(aContent);

		return answer;
		
	}
	
	
	
	
	
	
	
	
}
