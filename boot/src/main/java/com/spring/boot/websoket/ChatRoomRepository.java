package com.spring.boot.websoket;

import java.util.ArrayList;
import java.util.Collections;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import jakarta.annotation.PostConstruct;

@Repository //해당 클래스를 루트 컨테이너에 빈(Bean) 객체로 생성해주는 어노테이션입니다.
public class ChatRoomRepository {
     private Map<String, ChatRoomVo> chatRoomDTOMap;

     @PostConstruct
    private void init(){
        chatRoomDTOMap = new LinkedHashMap<>();
    }

    public List<ChatRoomVo> findAllRooms(){
        //채팅방 생성 순서 최근 순으로 반환
        List<ChatRoomVo> result = new ArrayList<>(chatRoomDTOMap.values());
        Collections.reverse(result);

        return result;
    }

    public ChatRoomVo findRoomById(String id){
        return chatRoomDTOMap.get(id);
    }

    public ChatRoomVo createChatRoomDTO(String name){
        ChatRoomVo room = ChatRoomVo.create(name);
        chatRoomDTOMap.put(room.getRoomId(), room);

        return room;
    }
}
