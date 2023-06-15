package com.spring.boot.websoket;

import lombok.extern.log4j.Log4j2;

import org.springframework.boot.autoconfigure.web.ServerProperties.Reactive.Session;
import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import jakarta.websocket.OnOpen;

import java.util.ArrayList;
import java.util.List;

@Component
@Log4j2
public class ChatHandler extends TextWebSocketHandler {

    private static List<WebSocketSession> list = new ArrayList<>();

    @Override
    protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
        String payload = message.getPayload();
        log.info("payload : " + payload);

        for(WebSocketSession sess: list) {
            sess.sendMessage(message);
        }
    }

    /* Client가 접속 시 호출되는 메서드 */
    @Override
    public void afterConnectionEstablished(WebSocketSession session) throws Exception {
    String clientIpAddress = session.getRemoteAddress().getAddress().getHostAddress();
        list.add(session);
        log.info(clientIpAddress + " 접속자ip 확인");
        log.info("접속자수: " + list.size());
        log.info(session + " 클라이언트 접속");
    }

    /* Client가 접속 해제 시 호출되는 메서드드 */

    @Override
    public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {

        log.info(session + " 클라이언트 접속 해제");
        list.remove(session);
    }

    
}