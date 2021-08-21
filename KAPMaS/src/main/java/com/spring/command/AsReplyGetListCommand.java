package com.spring.command;

import com.spring.dto.AsReplyVO;

public class AsReplyGetListCommand {
	private String aCode;

	public String getaCode() {
		return aCode;
	}

	public void setaCode(String aCode) {
		this.aCode = aCode;
	}
	
	
	
	
	public AsReplyVO toAsReplyVO() {
		AsReplyVO as = new AsReplyVO();
		as.setaCode(aCode);
		
		return as;
	}
	
	
	
	
	
	
	
	
	
	
	
}
