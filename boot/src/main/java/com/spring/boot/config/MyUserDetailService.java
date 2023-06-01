package com.spring.boot.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Component;

import com.spring.boot.service.MemberService;
import com.spring.boot.vo.InfoMember;

import lombok.extern.slf4j.Slf4j;

import java.util.Optional;

@Component //pring Framework에서 컴포넌트 스캔(Component scanning)에 자주 사용되는 어노테이션입니다.
//이 어노테이션을 사용하면 Spring이 해당 클래스를 빈(Bean)으로 등록하고 관리할 수 있게 됩니다.
@Slf4j
public class MyUserDetailService implements UserDetailsService {
    
    @Autowired
    MemberService memberService;

    @Override
    public UserDetails loadUserByUsername(String id) throws UsernameNotFoundException {
        Optional<InfoMember> findOne = memberService.findOne(id);
        //log.info(""+ id +" 파라미터전달 체크");
        //log.info(""+ findOne +"파라미터전달 체크2");

        InfoMember member = findOne.orElseThrow(() -> new UsernameNotFoundException("없는 회원입니다 ㅠ"));
        //log.info(""+ member.getId() +"셀렉 전달 체크");
        //log.info(""+ member.getPw() +"셀렉 전달 체크");
        
        log.info(""+ member.getRoles() +"셀렉 유저권한전달 체크");
        return User.builder()
                .username(member.getId())
                .password(member.getPw())
                .roles(member.getRoles())
                .build();
    }
}