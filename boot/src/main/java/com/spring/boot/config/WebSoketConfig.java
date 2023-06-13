package com.spring.boot.config;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Configurable;
import org.springframework.messaging.simp.config.MessageBrokerRegistry;
import org.springframework.web.socket.config.annotation.EnableWebSocketMessageBroker;
import org.springframework.web.socket.config.annotation.StompEndpointRegistry;
import org.springframework.web.socket.config.annotation.WebSocketConfigurer;
import org.springframework.web.socket.config.annotation.WebSocketHandlerRegistry;
import org.springframework.web.socket.config.annotation.WebSocketMessageBrokerConfigurer;

import com.spring.boot.websoket.ChatHandler;

@Configurable
@EnableWebSocketMessageBroker
public class WebSoketConfig implements WebSocketMessageBrokerConfigurer  {

    @Autowired
    ChatHandler chatHandler;

    @Override
    public void configureMessageBroker(MessageBrokerRegistry registry) {
           //클라이언트의 send요청 처리
           registry.setApplicationDestinationPrefixes("/pub");
           //sub하는 클라이언트에게 메시지 전달
           registry.enableSimpleBroker("/sub");
    }

    @Override
    public void registerStompEndpoints(StompEndpointRegistry registry) {

           //stomp의 접속 주소
           registry.addEndpoint("/ws").withSockJS();
   
    }


    
    
   
    
}
