package com.spring.boot.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.spring.boot.vo.Login;

@Mapper
public interface LoginDao {

    public List<Login> loginslist(Login login);  //생성한 인터페이스 이름으로 sql.xml 파일 id값으로 주어준다.
    
}
