package com.spring.command;

import com.spring.dto.AsReplyVO;

public class AsReplyDeleteCommand {

	private String aRpCode;
	private String aCode  ;
	public String getaRpCode() {
		return aRpCode;
	}
	public void setaRpCode(String aRpCode) {
		this.aRpCode = aRpCode;
	}
	public String getaCode() {
		return aCode;
	}
	public void setaCode(String aCode) {
		this.aCode = aCode;
	}
	
	
	
	public AsReplyVO toAsReplyVO() {
		AsReplyVO asReply = new AsReplyVO();
		asReply.setaCode(aCode);
		asReply.setaRpCode(aRpCode);
		
		return asReply;
		
	}
	
	
	
	
	
	
	
	
	
	
	
}
