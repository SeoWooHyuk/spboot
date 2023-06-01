package com.spring.boot.vo;

import org.springframework.security.crypto.password.PasswordEncoder;

import lombok.Getter;
import lombok.extern.slf4j.Slf4j;

@Getter
@Slf4j
public class InfoMember {

    private Long secuid;
    private String id;
    private String pw;
    private String roles;

    private InfoMember(Long secuid, String id, String pw ,String roles) {
        this.secuid= secuid;
        this.id = id;
        this.pw = pw;
        this.roles = roles;
    }

    protected InfoMember() {}

    public static InfoMember createUser(String id, String pw, PasswordEncoder passwordEncoder) {
      //  log.info(""+ id +"인포멤버 크리에트 유저아디 체크");
       // log.info(""+ passwordEncoder +"인포멤버 크리에트 유저비번 체크");
        return new InfoMember(null, id, passwordEncoder.encode(pw),"USER"); //회언가입시 user권한 일반 권한 자동 저장
    }


}
