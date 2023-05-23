package com.spring.boot.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.client.HttpClientErrorException.BadRequest;

import com.spring.boot.dao.LoginDao;
import com.spring.boot.vo.Login;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class LoginService {
    @Autowired
    LoginDao lg;

    public boolean loginslist(Login login2)
    {

        boolean lgchek = false;

        Login login = new Login();
        List<Login> list = new ArrayList<Login>();
        list = lg.loginslist(login2);

        for (int i = 0; i < list.size(); i++) {
            
            if(login2.getId().equals(list.get(i).getId()) && login2.getPw().equals(list.get(i).getPw()))
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
}
