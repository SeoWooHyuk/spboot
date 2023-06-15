package com.spring.boot.websoket;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.messaging.simp.config.MessageBrokerRegistry;
import org.springframework.web.socket.config.annotation.EnableWebSocket;
import org.springframework.web.socket.config.annotation.EnableWebSocketMessageBroker;
import org.springframework.web.socket.config.annotation.StompEndpointRegistry;
import org.springframework.web.socket.config.annotation.WebSocketConfigurer;
import org.springframework.web.socket.config.annotation.WebSocketHandlerRegistry;
import org.springframework.web.socket.config.annotation.WebSocketMessageBrokerConfigurer;

import lombok.RequiredArgsConstructor;

@Configuration
@RequiredArgsConstructor
@EnableWebSocket
public class WebSoketConfig implements WebSocketConfigurer   {

    @Autowired
    ChatHandler chatHandler;

    
  @Override
    public void registerWebSocketHandlers(WebSocketHandlerRegistry registry) {
    
        registry.addHandler(chatHandler, "ws/chat").setAllowedOrigins("*");
    }

    
    
   
    
}
