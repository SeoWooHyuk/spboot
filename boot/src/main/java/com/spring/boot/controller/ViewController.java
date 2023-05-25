package com.spring.boot.controller;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring.boot.service.BoardService;
import com.spring.boot.vo.BoardVo;
import com.spring.boot.vo.Pagination;

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

     
        Pagination pagination = new Pagination();
        pagination.setCurrentPageNo(searchVO.getPageIndex());
        pagination.setRecordCountPerPage(searchVO.getPageUnit());
        pagination.setPageSize(searchVO.getPageSize());
        
        searchVO.setFirstIndex(pagination.getFirstRecordIndex());
        searchVO.setRecordCountPerPage(pagination.getRecordCountPerPage());
        
        List<BoardVo> boardList = boardService.getList(searchVO);
        int totCnt = boardList.size();
        log.info(""+ totCnt  +"리스트 저건별 길이");

        pagination.setTotalRecordCount(totCnt);
        
        searchVO.setEndDate(pagination.getLastPageNoOnPageList());
        searchVO.setStartDate(pagination.getFirstPageNoOnPageList());
        searchVO.setPrev(pagination.getXprev());
        searchVO.setNext(pagination.getXnext());
        
        model.addAttribute("searchVO",searchVO);
        model.addAttribute("boardList",boardList);
        model.addAttribute("totCnt",totCnt);
        model.addAttribute("totalPageCnt",(int)Math.ceil(totCnt / (double)searchVO.getPageUnit()));
        model.addAttribute("pagination",pagination);


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

        //log.info(""+ intI  +"인설트 확인");
        //log.info(""+ boardVo.getId()  +"아이디");
        //log.info(""+ boardVo.getTitle()  +"타이틀");
        //log.info(""+ boardVo.getWrites()  +"게시글");
        return "redirect:/view";
    }


    @GetMapping("/viewdetail")  //게시글 디테일 창
    public String viewdetail(@RequestParam int boardnum, Model model)
    {
       BoardVo board =  boardService.viewdetail(boardnum);

        model.addAttribute("board", board);
        
        return "viewdetail";
    }

    @GetMapping("/viewdelete")  //게시글 딜리트
    public String viewdetaildelete(@RequestParam int boardnum)
    {
        int intI = boardService.viewdetaildelete(boardnum);

        return "redirect:/view";
    }


   
}
