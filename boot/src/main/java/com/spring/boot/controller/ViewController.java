package com.spring.boot.controller;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import com.spring.boot.service.BoardService;
import com.spring.boot.vo.BoardVo;
import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;


@Controller
@Slf4j
public class ViewController {

    @Autowired
    BoardService boardService;
 
    @GetMapping("/view")  //게시글 셀렉창
    public String viewsallselect(@ModelAttribute("searchVO") BoardVo searchVO, Model model)
    {

        List<BoardVo> boardList = boardService.getList(searchVO);
        log.info(""+ boardList.size()  +"사이즈");

		model.addAttribute("boardList",boardList);


        return "view";
    }

    @GetMapping("/viewinsert")  //게시글 셀렉창인설트
    public String viewsinsert(HttpSession session)
    {
        return "viewinsert";
    }

    @PostMapping("/viewinsert_ok")  //게시글 셀렉창인설트
    public String viewsinsertok(@ModelAttribute BoardVo boardVo)
    {

        int intI = boardService.boardinsert(boardVo);

        log.info(""+ intI  +"인설트 확인");
        log.info(""+ boardVo.getId()  +"아이디");
        log.info(""+ boardVo.getTitle()  +"타이틀");
        log.info(""+ boardVo.getWrites()  +"게시글");
        return "redirect:/view";
    }
}
