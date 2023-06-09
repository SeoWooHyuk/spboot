package com.spring.boot.vo;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Optional;
import org.springframework.security.crypto.password.PasswordEncoder;
import lombok.Getter;


@Getter
public class InfoMember  {

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

    public List<String> getRoleList(){
        if(this.roles.length()>0){
            return Arrays.asList(this.roles.split(","));
        }
        return new ArrayList<>();
    }

    public static InfoMember createUser(String id, String pw, PasswordEncoder passwordEncoder) {
      //  log.info(""+ id +"인포멤버 크리에트 유저아디 체크");
       // log.info(""+ passwordEncoder +"인포멤버 크리에트 유저비번 체크");
        return new InfoMember(null, id, passwordEncoder.encode(pw),"USER"); //회언가입시 user권한 일반 권한 자동 저장
    }

    public Optional<InfoMember> map(Object object) {
        return null;
    }


}
