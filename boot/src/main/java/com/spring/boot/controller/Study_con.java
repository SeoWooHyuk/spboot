package com.spring.boot.controller;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;

import com.spring.boot.service.LoginService;
import com.spring.boot.vo.Login;

import lombok.extern.slf4j.Slf4j;


@Controller
@Slf4j
public class Study_con {

    @Autowired
    LoginService ls;
 
    @GetMapping("/login")
    public String login()
    {
        return "login";
    }

    @GetMapping("/login_check")
    public String login_check(@ModelAttribute Login login)
    {
    
        
        log.info(""+ login.getId()  +"아이디");
        boolean chek =  ls.loginslist(login);

        if(chek)
        {
            return "view";
        }

        return "login";
    }
}
