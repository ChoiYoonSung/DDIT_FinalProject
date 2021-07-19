package com.spring.command;

import java.util.Date;

import com.spring.dto.TkReplyVO;

public class TkReplyRegistCommand {
	
	private String tkCode;
	private String tkRpWriter;
	private String tkRpContent;
	
	
	
	public String getTkCode() {
		return tkCode;
	}



	public void setTkCode(String tkCode) {
		this.tkCode = tkCode;
	}



	public String getTkRpWriter() {
		return tkRpWriter;
	}



	public void setTkRpWriter(String tkRpWriter) {
		this.tkRpWriter = tkRpWriter;
	}



	public String getTkRpContent() {
		return tkRpContent;
	}



	public void setTkRpContent(String tkRpContent) {
		this.tkRpContent = tkRpContent;
	}



	public TkReplyVO toTkReplyVO() {
		TkReplyVO tkReply = new TkReplyVO();
		tkReply.setTkCode(tkCode);
		tkReply.setTkRpWriter(tkRpWriter);
		tkReply.setTkRpContent(tkRpContent);
		tkReply.setTkRpRegdate(new Date());
		
		return tkReply;
	}
	
}
