package com.spring.chat;


import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import org.springframework.web.socket.WebSocketSession;

@Repository
public class ChatRoomRepository {
	
	private SqlSession session;
	public void setSqlSession(SqlSession session) {
		this.session = session;
	}
	
    public List<ChatRoom> findAllRoom(String pCode){
    	
    	List<ChatRoom> chatList = session.selectList("Chat-Mapper.getAllChatList", pCode);
    	
    	return chatList;
    	
    }

    public ChatRoom findRoomById(String roomId){
    	ChatRoom chat = session.selectOne("Chat-Mapper.findRoomById", roomId);
    	
    	
        return chat;
    }

    public void createChatRoom(ChatRoom chat){
    	
        session.update("Chat-Mapper.createChatRoom", chat);
        
    }
    
    
    public void deleteChatRoom(String roomId) {
    	session.update("Chat-Mapper.deleteChatRoom",roomId);
    }
    
    
    
}











