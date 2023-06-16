package com.spring.boot.websoket;

import org.springframework.context.annotation.Configuration;
import org.springframework.messaging.simp.config.MessageBrokerRegistry;
import org.springframework.web.socket.config.annotation.EnableWebSocketMessageBroker;
import org.springframework.web.socket.config.annotation.StompEndpointRegistry;
import org.springframework.web.socket.config.annotation.WebSocketMessageBrokerConfigurer;

@EnableWebSocketMessageBroker //Stomp를 사용하기위해 선언하는 어노테이션
@Configuration
public class WebSoketConfig implements WebSocketMessageBrokerConfigurer { //stomp사용
    
     @Override
    public void registerStompEndpoints(StompEndpointRegistry registry) {
    
         registry.addEndpoint("/stomp/chat")
                .setAllowedOrigins("http://localhost:8080")
                .withSockJS();
                // .setClientLibraryUrl("https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.1.2/sockjs.js");
        ///example는 WebSocket 또는 SockJS Client가 웹소켓 핸드셰이크 커넥션을 생성할 경로이다.
    }

    @Override
    public void configureMessageBroker(MessageBrokerRegistry registry) {
    
        registry.setApplicationDestinationPrefixes("/pub");
        //pub 경로로 시작하는 STOMP 메세지의 "destination" 헤더는 @Controller 객체의 @MessageMapping 메서드로 라우팅된다.
        registry.enableSimpleBroker("/sub");
        //내장된 메세지 브로커를 사용해 Client에게 Subscriptions, Broadcasting 기능을 제공한다. 또한 /topic, /queue로 시작하는 "destination" 헤더를 가진 메세지를 브로커로 라우팅한다.
        //"sub/.." --> publish-subscribe (1:N)
        //"queue/" --> point-to-point (1:1)
        //내장된 Simple Message Broker는 /topic, /queue prefix에 대해 특별한 의미를 부여하지 않는다.
    }
}
