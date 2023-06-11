package com.spring.boot.security;

import java.util.Collection;
import java.util.stream.Collectors;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import com.spring.boot.vo.InfoMember;

import lombok.Getter;

@Getter
public class CustomUserDetails implements UserDetails {

 

    private final InfoMember member;

    public CustomUserDetails(InfoMember member) {
        
        // if (member == null) {
        //     throw  new IllegalArgumentException("계정이 존재하지 않습니다. 회원가입 진행 후 로그인 해주세요.");
        // }else
        // {
             this.member = member;
        //}
        
       
    }

    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
        return member.getRoleList().stream()
                .map(SimpleGrantedAuthority::new)
                .collect(Collectors.toList());
    }

    @Override
    public String getPassword() {
        // TODO Auto-generated method stub

        if (member == null) {
            return null;
        }else
        {
            return member.getPw();
        }
    
    }

    @Override
    public String getUsername() {
        // TODO Auto-generated method stub
       
        if (member == null) {
            return null;
        }else
        {
             return member.getId();
        }
       
    }


    /**
     * 계정 만료 여부
     * true : 만료 안됨
     * false : 만료
     * @return
     */
    @Override
    public boolean isAccountNonExpired() {
        // TODO Auto-generated method stub
        return true;
    }


    /**
     * 계정 잠김 여부
     * true : 잠기지 않음
     * false : 잠김
     * @return
     */
    @Override
    public boolean isAccountNonLocked() {
        // TODO Auto-generated method stub
        return true;
    }


     /**
     * 비밀번호 만료 여부
     * true : 만료 안됨
     * false : 만료
     * @return
     */
    @Override
    public boolean isCredentialsNonExpired() {
        // TODO Auto-generated method stub
        return true;
    }


    /**
     * 사용자 활성화 여부
     * ture : 활성화
     * false : 비활성화
     * @return
     */
    @Override
    public boolean isEnabled() {
        // TODO Auto-generated method stub
        return true;
    }
    
}
