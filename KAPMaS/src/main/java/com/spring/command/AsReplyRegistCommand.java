package com.spring.command;

import com.spring.dto.AsReplyVO;

public class AsReplyRegistCommand {

	private String khCode  ;
	private String aWriter ;
	private String aContent;
	private String aCode;
	
	
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
	public String getaCode() {
		return aCode;
	}
	public void setaCode(String aCode) {
		this.aCode = aCode;
	}
	
	
	public AsReplyVO toAsReplyVO() {
		AsReplyVO asReply= new AsReplyVO();
		asReply.setaCode(aCode);
		asReply.setaRpContent(aContent);
		asReply.setaRpWriter(aWriter);
		asReply.setKhCode(khCode);
		
		return asReply;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
