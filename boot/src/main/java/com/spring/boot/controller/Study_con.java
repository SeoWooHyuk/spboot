package com.spring.boot.controller;



import java.lang.ProcessBuilder.Redirect;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.boot.service.InfoService;
import com.spring.boot.vo.Information;

import lombok.extern.slf4j.Slf4j;


@Controller
@Slf4j
@RequestMapping("/")
public class Study_con {

    @Autowired
    InfoService is;
 
    @GetMapping("/login")
    public String login()
    {
        return "login";
    }
    
    
    @GetMapping("/join")
    public String join()
    {
        return "join";
    }

    @PostMapping("/joininsert")
    public String joininsert(@ModelAttribute Information info)
    {
        int intI = is.joininsert(info);
        return "login";
    }

    @PostMapping("/login_check")
    public String login_check(@ModelAttribute Information info)
    {
    
        
        log.info(""+ info.getId()  +"아이디");
        boolean chek =  is.loginslist(info);

        if(chek)
        {
            return "view";
        }

        return "login";
    }

    @GetMapping("/view")  //게시글 셀렉창
    public String viewsallselect()
    {
        return "view";
    }

    @GetMapping("/viewinsert")  //게시글 셀렉창
    public String viewsinsert()
    {
        return "viewinsert";
    }
}
