package com.spring.boot.websoket;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;
import lombok.extern.log4j.Log4j2;

@RestController
@Log4j2
public class ChatController {
    
    @RequestMapping("/chat")
    public ModelAndView  chatGET(){

        log.info("@ChatController, chat GET()");
        ModelAndView mv = new ModelAndView();
        mv.setViewName("chat");
		return mv;
        
    }

}
