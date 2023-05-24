package com.spring.boot.vo;



@lombok.Data
public class BoardVo extends PageVo {
    private int boardnum;
    private String id;
    private String title;
    private String writes;
    private String date;



}
