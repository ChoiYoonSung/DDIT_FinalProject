package com.spring.chat;




import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.fasterxml.jackson.databind.ObjectMapper;


public class EchoHandler2 extends TextWebSocketHandler {
	
	@Autowired
	private ChatRoomRepository chatRoomRepository;
	
	@Autowired
	private ObjectMapper objectMapper;
	
	
	  @Override
	    protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
	       // log.info("메세지 전송 = {} : {}",session,message.getPayload());
	        String msg = message.getPayload();
	        ChatMessage chatMessage = objectMapper.readValue(msg,ChatMessage.class);
	        ChatRoom chatRoom = chatRoomRepository.findRoomById(chatMessage.getChatRoomId());
	        chatRoom.handleMessage(session,chatMessage,objectMapper);
	    }
}