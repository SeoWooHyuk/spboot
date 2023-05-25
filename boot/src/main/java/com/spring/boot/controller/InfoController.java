package com.spring.boot.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import com.spring.boot.service.InfoService;
import com.spring.boot.vo.Information;
import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;


@Controller
@Slf4j
public class InfoController {

    @Autowired
    InfoService is;

    @GetMapping("/login")
    public String login()
    {
        return "login";
    }

    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/login";
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
    public String login_check(@ModelAttribute Information info, HttpSession session)
    {
    
        
        //log.info(""+ info.getId()  +"아이디");
        boolean chek =  is.loginslist(info);

        if(chek)
        {
            session.setAttribute("sessionid", info.getId());
            return "redirect:/view";
        }

        return "redirect:/login";
    }

   
}
