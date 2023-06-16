package com.spring.boot.websoket;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ChatMessageVo {
    private String roomId;
    private String writer;
    private String data;
    private String message;

}
