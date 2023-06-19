package com.spring.boot.websoket;

import java.util.HashSet;
import java.util.Set;
import java.util.UUID;

import org.springframework.web.socket.WebSocketSession;
import lombok.Getter;
import lombok.Setter;


@Getter
@Setter
public class ChatRoomVo {
    
    private String roomId;
    private String name;
    private Set<WebSocketSession> sessions = new HashSet<>();


    public static ChatRoomVo create(String name){
        ChatRoomVo room = new ChatRoomVo();
        room.roomId = UUID.randomUUID().toString();
        room.name = name;
        return room;
    }

}
