package com.spring.command;

import com.spring.dto.TkReplyVO;

public class TkReplyModifyCommand extends TkReplyRegistCommand{
	
	private int tkRpCode;

	public int getTkRpCode() {
		return tkRpCode;
	}

	public void setTkRpCode(int tkRpCode) {
		this.tkRpCode = tkRpCode;
	}

	@Override
	public TkReplyVO toTkReplyVO() {
		TkReplyVO tkReply = super.toTkReplyVO();
		tkReply.setTkRpCode(this.tkRpCode);
		
		return tkReply;
	}
	
	
	
}
