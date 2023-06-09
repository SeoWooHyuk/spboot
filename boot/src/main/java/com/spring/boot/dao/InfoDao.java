package com.spring.boot.dao;

import java.util.Optional;
import org.apache.ibatis.annotations.Mapper;
import com.spring.boot.vo.InfoMember;
@Mapper
public interface InfoDao {
    
   // public List<InfoMember> loginslist(Information login);  //생성한 인터페이스 이름으로 sql.xml 파일 id값으로 주어준다.

    public InfoMember loginscheck(InfoMember login);

    public Optional<InfoMember> findByUserid(String id);
    
    public int joininsert(InfoMember join);
}
