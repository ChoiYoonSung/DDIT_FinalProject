package com.spring.command;

import com.spring.dto.PIReplyVO;

public class PiReplyRegistCommand {
	
	private String piCode;
	private String empId;
	private String piRpContent;
	
	public String getPiCode() {
		return piCode;
	}
	public void setPiCode(String piCode) {
		this.piCode = piCode;
	}
	public String getEmpId() {
		return empId;
	}
	public void setEmpId(String empId) {
		this.empId = empId;
	}
	public String getPiRpContent() {
		return piRpContent;
	}
	public void setPiRpContent(String piRpContent) {
		this.piRpContent = piRpContent;
	}

	public PIReplyVO toPiReplyVO() {
		PIReplyVO piReply = new PIReplyVO();
		piReply.setPiCode(piCode);
		piReply.setEmpId(empId);
		piReply.setPiRpContent(piRpContent);
		
		return piReply;
	}
	
}
