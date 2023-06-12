package com.spring.boot.security;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.stream.Collectors;

import org.apache.catalina.User;
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
        this.member = member;
    }

    // 중복처리 커스텀 구현
    @Override
    public boolean equals(Object obj) {
        if (obj instanceof CustomUserDetails) {
            CustomUserDetails other = (CustomUserDetails) obj;
            return member.getId().equals(other.member.getId());
        }
        return false;
    }

    @Override
    public int hashCode() {
        return member.getId().hashCode();
    }

    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
     List<GrantedAuthority> authorities = new ArrayList<>();
        authorities.add(new SimpleGrantedAuthority("ROLE_"+member.getRoles().toString())); //ROLE_이놈때문이었어 디테일에서 권한부여가안된이유
        return authorities;
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
