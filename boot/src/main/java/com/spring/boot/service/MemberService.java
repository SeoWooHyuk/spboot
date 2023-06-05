package com.spring.boot.service;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.boot.dao.InfoDao;
import com.spring.boot.vo.InfoMember;
import com.spring.boot.vo.Information;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class MemberService {
    
    @Autowired
    InfoDao lnfodao;

    public Optional<InfoMember> findOne(String id) {

    // log.info(""+ id +"인설트 부분 파라미터전달 체크");
    return lnfodao.findByUserid(id); //셀렉으로 유저정보를 찾아서 보내준다.
    }  

}
