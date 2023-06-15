package com.spring.boot.websoket;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.socket.WebSocketHandler;
import org.springframework.web.socket.config.annotation.EnableWebSocket;
import org.springframework.web.socket.config.annotation.WebSocketConfigurer;
import org.springframework.web.socket.config.annotation.WebSocketHandlerRegistry;


import lombok.RequiredArgsConstructor;

@Configuration
@RequiredArgsConstructor
@EnableWebSocket
public class WebSoketConfig implements WebSocketConfigurer   {
    
  @Override
    public void registerWebSocketHandlers(WebSocketHandlerRegistry registry) {
    
        registry.addHandler(myHandler(), "ws/chat").setAllowedOrigins("*");

        // registry.addHandler(myHandler(), "ws/chat")
        //         .withSockJS();

    }

    @Bean
    public WebSocketHandler myHandler() {
      return new ChatHandler();
    }


    
    
   
    
}
