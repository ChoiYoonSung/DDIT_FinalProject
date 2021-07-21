package com.spring.chat;

import lombok.Getter;
import lombok.Setter;

@Getter @Setter
public class ChatRoomForm {
    private String name;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
    
    
    
}
