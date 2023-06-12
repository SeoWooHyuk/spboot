package com.spring.boot.config;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Configurable;
import org.springframework.web.socket.config.annotation.EnableWebSocket;
import org.springframework.web.socket.config.annotation.WebSocketConfigurer;
import org.springframework.web.socket.config.annotation.WebSocketHandlerRegistry;


import com.spring.boot.websoket.ChatHandler;

import lombok.RequiredArgsConstructor;

@Configurable
@RequiredArgsConstructor
@EnableWebSocket
public class WebSoketConfig implements WebSocketConfigurer {

    @Autowired
    ChatHandler chatHandler;

    @Override
    public void registerWebSocketHandlers(WebSocketHandlerRegistry registry) {
        // TODO Auto-generated method stub
        registry.addHandler(chatHandler, "ws/chat").setAllowedOrigins("*");
        
    }
    
}
