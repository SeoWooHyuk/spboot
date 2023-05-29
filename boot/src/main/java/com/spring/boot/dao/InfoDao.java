package com.spring.boot.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.spring.boot.vo.InfoMember;
import com.spring.boot.vo.Information;

@Mapper
public interface InfoDao {
    
    public List<Information> loginslist(Information login);  //생성한 인터페이스 이름으로 sql.xml 파일 id값으로 주어준다.
    public InfoMember loginscheck(InfoMember login);
    
    
    public int joininsert(Information join);
}
