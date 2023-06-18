package com.spring.boot.websoket;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ChatMessageVo {
    private String roomId;
    private String mid; //글쓴이
    private String data;
    private boolean checks;
    private boolean checkd;
    private String message;

}
