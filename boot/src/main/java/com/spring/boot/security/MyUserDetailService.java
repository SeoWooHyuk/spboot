package com.spring.boot.security;

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
    public UserDetails loadUserByUsername(String id)  {


        Optional<InfoMember> findOne = memberService.findOne(id); //로그인시 셀렉으로 조회

        if(findOne.isEmpty())
        {
            log.info("널일때 실행");
        }

        InfoMember member = findOne.orElseThrow(() -> new UsernameNotFoundException("계정이 존재하지 않습니다. 회원가입 진행 후 로그인 해주세요."));

        //InfoMember member = findOne.get();

        return User.builder()
        .username(member.getId())
        .password(member.getPw())
        .roles(member.getRoles())
        .build();

    }
}