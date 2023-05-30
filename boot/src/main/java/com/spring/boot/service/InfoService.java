package com.spring.boot.service;

import org.apache.catalina.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.spring.boot.dao.InfoDao;
import com.spring.boot.vo.InfoMember;
import com.spring.boot.vo.Information;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class InfoService {
    @Autowired
    InfoDao lnfodao;

    @Autowired
    PasswordEncoder passwordEncoder;

    //회원가입
    public int joininsert(Information info)
    {

  
        InfoMember infoMember = InfoMember.createUser(info.getId(), info.getPw(), passwordEncoder);
        validateDuplicateMember(infoMember); 
        //  log.info(""+ info.getId()  +"인설트 부분 파라미터전달 체크");
        // log.info(""+ infoMember.getPw() +"비밀번호 보안 처리 확인");
        // log.info(""+ infoMember.getId() +"아이디 보안 처리 확인");
        // log.info(""+ infoMember.getSecuid() +"시크릿 아이디 보안 처리 확인");
        int intI = lnfodao.joininsert(infoMember);
        return intI;
    }



    //회원가입시 중복체크
    private void validateDuplicateMember(InfoMember infoMember) {
      
        InfoMember infom = lnfodao.loginscheck(infoMember);
        
        log.info(""+ infom  +"널이라고 뜨면 중복이아닌거 ");

        if(infom != null)
        {
            throw new IllegalStateException("이미 존재하는 회원입니다.");
        }
          
    }


}

    /* 
    public boolean loginslist(Information login)
    {

        boolean lgchek = false;
        List<Information> list = new ArrayList<Information>();
        list = lg.loginslist(login);

        for (int i = 0; i < list.size(); i++) {
            
            if(login.getId().equals(list.get(i).getId()) && login.getPw().equals(list.get(i).getPw()))
            {
                lgchek =true;
                break;
            }else
            {
                lgchek =false;
            }

        }
        return lgchek;
    }
    */

 
