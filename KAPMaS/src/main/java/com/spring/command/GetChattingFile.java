package com.spring.command;

import com.spring.dto.MeetingVO;

public class GetChattingFile {

	
	private String titl;
	private String hhh ;
	
	
	
	public String getTitl() {
		return titl;
	}
	public void setTitl(String titl) {
		this.titl = titl;
	}
	public String getHhh() {
		return hhh;
	}
	public void setHhh(String hhh) {
		this.hhh = hhh;
	}
	
	
	public MeetingVO toMeetingVO() {
		MeetingVO meeting = new MeetingVO();
		meeting.setMtTitle(titl);
		meeting.setMtAtName(hhh);
		
		return meeting;
	}
	
	
	
	
	
}
