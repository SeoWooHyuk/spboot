package com.spring.boot.controller;



import java.lang.ProcessBuilder.Redirect;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.boot.service.BoardService;
import com.spring.boot.service.InfoService;
import com.spring.boot.vo.BoardVo;
import com.spring.boot.vo.Information;

import lombok.extern.slf4j.Slf4j;


@Controller
@Slf4j
public class Study_con {

    @Autowired
    InfoService is;

    @Autowired
    BoardService boardService;
 
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
        //456416int intI = is.joininsert(info);
        return "login";
    }

    @PostMapping("/login_check")
    public String login_check(@ModelAttribute Information info)
    {
    
        
        log.info(""+ info.getId()  +"아이디");
        boolean chek =  is.loginslist(info);

        if(chek)
        {
            return "redirect:/view";
        }

        return "login";
    }

    @GetMapping("/view")  //게시글 셀렉창
    public String viewsallselect(@ModelAttribute("searchVO") BoardVo searchVO, Model model)
    {

        List<BoardVo> boardList = boardService.getList(searchVO);
        log.info(""+ boardList.size()  +"사이즈");

		model.addAttribute("boardList",boardList);


        return "view";
    }

    @GetMapping("/viewinsert")  //게시글 셀렉창인설트
    public String viewsinsert()
    {
        return "viewinsert";
    }
}
