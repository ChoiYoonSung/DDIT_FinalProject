package com.spring.chat;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.socket.config.annotation.EnableWebSocket;
import org.springframework.web.socket.config.annotation.WebSocketConfigurer;
import org.springframework.web.socket.config.annotation.WebSocketHandlerRegistry;
import org.springframework.web.socket.server.support.HttpSessionHandshakeInterceptor;

@Configuration
@EnableWebSocket
public class WebSocketConfig2 implements WebSocketConfigurer{
	@Autowired
	private WebSocketHandler webSocketHandler;

	@Override
	public void registerWebSocketHandlers(WebSocketHandlerRegistry registry) {
		
		registry.addHandler(webSocketHandler, "/project/room").setAllowedOrigins("*").withSockJS()
		.setInterceptors(new HttpSessionHandshakeInterceptor())
		.setClientLibraryUrl("http://localhost:9090/resources/sockjs.min.js");
	}
	
}