package com.spring.command;

import com.spring.dto.PIReplyVO;

public class PiReplyModifyCommand extends PiReplyRegistCommand{
	
	private int piRpCode;


	public int getPiRpCode() {
		return piRpCode;
	}
	public void setPiRpCode(int piRpCode) {
		this.piRpCode = piRpCode;
	}


	@Override
	public PIReplyVO toPiReplyVO() {
		PIReplyVO piReply = super.toPiReplyVO();
		piReply.setPiRpCode(this.piRpCode);
		
		return piReply;
	}
	
	
	
}
