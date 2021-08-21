package com.spring.chat;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;

import com.fasterxml.jackson.databind.ObjectMapper;


public class ChatRoom {
    private String roomId;
    private String name;
    private String pCode;
    
	public String getpCode() {
		return pCode;
	}

	public void setpCode(String pCode) {
		this.pCode = pCode;
	}

	public String getRoomId() {
		return roomId;
	}

	public void setRoomId(String roomId) {
		this.roomId = roomId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	private static Map<String,List<WebSocketSession>> rmem = new HashMap<>();
	
	
    public void handleMessage(WebSocketSession session, ChatMessage chatMessage,
                              ObjectMapper objectMapper,String roomId) throws IOException {
    	
    	
        if(chatMessage.getType() == MessageType.ENTER){
        	 List<WebSocketSession> sessions = rmem.get(roomId);
        	 if(sessions == null) {
        		 sessions = new ArrayList<WebSocketSession>();
        	 }
        			 
            sessions.add(session);
            rmem.put(roomId,sessions);
            chatMessage.setMessage(chatMessage.getWriter() + "님이 입장하셨습니다.");
        }
        
        else if(chatMessage.getType() == MessageType.LEAVE){
        	 List<WebSocketSession> sessions = rmem.get(roomId);
            sessions.remove(session);
            chatMessage.setMessage(chatMessage.getWriter() + "님임 퇴장하셨습니다.");
        }
        
        else if(chatMessage.getType() == MessageType.CHAT){
            chatMessage.setMessage(chatMessage.getWriter() + " : " + chatMessage.getMessage());
        }
        send(chatMessage,objectMapper,roomId);
    }

    
    private void send(ChatMessage chatMessage, ObjectMapper objectMapper,String roomId) throws IOException {
        TextMessage textMessage = new TextMessage(objectMapper.writeValueAsString(chatMessage.getMessage()));
        
   	 	List<WebSocketSession> sessions = rmem.get(roomId);
        
        for(WebSocketSession sess : sessions){
            sess.sendMessage(textMessage);
        }
    }
}