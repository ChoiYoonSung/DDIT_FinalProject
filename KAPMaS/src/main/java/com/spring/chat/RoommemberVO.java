package com.spring.chat;

import org.springframework.web.socket.WebSocketSession;

public class RoommemberVO {

	private String roomId    ;
	private WebSocketSession empSession;
	
	
	public String getRoomId() {
		return roomId;
	}
	public void setRoomId(String roomId) {
		this.roomId = roomId;
	}
	public WebSocketSession getEmpSession() {
		return empSession;
	}
	public void setEmpSession(WebSocketSession empSession) {
		this.empSession = empSession;
	}

	
	
	
	
}
