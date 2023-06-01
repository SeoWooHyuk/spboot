package com.spring.boot.vo;

import lombok.Data;

@Data
public class BoardVo extends PageVo {
    private int boardnum;
    private String id;
    private String title;
    private String writes;
    private String date;
    private String files;

    private String searchKeyword; //검색키워드 생성
}
