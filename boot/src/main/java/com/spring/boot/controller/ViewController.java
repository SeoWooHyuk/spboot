package com.spring.boot.controller;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.spring.boot.service.BoardService;
import com.spring.boot.vo.BoardVo;
import com.spring.boot.vo.Pagination;

import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;


@Controller
@Slf4j
public class ViewController {

    @Autowired
    BoardService boardService;
 
    //@GetMapping("/view")  //게시글 셀렉창
    @RequestMapping(value = "/view", method = {RequestMethod.GET, RequestMethod.POST})
    public ModelAndView  viewsallselect(@ModelAttribute("searchVO") BoardVo searchVO, Model model , HttpSession session)
    {

     
        Pagination pagination = new Pagination();
        pagination.setCurrentPageNo(searchVO.getPageIndex()); //현재 페이지 번호
        pagination.setRecordCountPerPage(searchVO.getPageUnit()); //한 페이지당 게시되는 게시물 수
        pagination.setPageSize(searchVO.getPageSize()); //페이지 리스트에 게시되는 페이지 수
        
        searchVO.setFirstIndex(pagination.getFirstRecordIndex()); //페이징 sql의 조건절에 사용되는 시작 rownum
        searchVO.setRecordCountPerPage(pagination.getRecordCountPerPage()); //한 페이지당 게시되는 게시물 수
        
        List<BoardVo> boardList = boardService.viewsallselect(searchVO);
        int totCnt = boardService.getListcount();
        pagination.setTotalRecordCount(totCnt);
        
        searchVO.setEndDate(pagination.getLastPageNoOnPageList()); 	    //종료데이터
        searchVO.setStartDate(pagination.getFirstPageNoOnPageList());     	//시작데이터
        searchVO.setPrev(pagination.getXprev()); 		//이전,다음버튼
        searchVO.setNext(pagination.getXnext());
        
        model.addAttribute("searchVO",searchVO);
        model.addAttribute("boardList",boardList);
        model.addAttribute("totCnt",totCnt);
        model.addAttribute("totalPageCnt",(int)Math.ceil(totCnt / (double)searchVO.getPageUnit()));
        model.addAttribute("pagination",pagination);

        ModelAndView mv = new ModelAndView();
	
    
        if(session.getAttribute("sessionid") ==  null) //로그인정보가없으면 로그인창으로 돌아가라
        {
            mv.setViewName("redirect:/login");
		    return mv;
        }

        mv.setViewName("view2");
        return mv;
    }


    
    //테스트 ajax사용법

    // 게시판 목록 조회
	@RequestMapping(value = "/viewsallselectajax", method = {RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	public ModelAndView viewsallselectajax(BoardVo searchVO) {
		ModelAndView mv = new ModelAndView();
		Map<String, Object> boardMap = new HashMap<String, Object>();
		boardMap = boardService.viewsallselectajax(searchVO);

         log.info(""+ boardMap +"인설트 확인");
		mv.addObject("boardMap", boardMap);
		mv.setViewName("jsonView");
		return mv;
	}


  

    @GetMapping("/viewinsert")  //게시글 셀렉창인설트
    public String viewsinsert(HttpSession session)
    {
       
        return "viewinsert";
    }

    @PostMapping("/viewinsert_ok")  //게시글 셀렉창인설트
    public String viewsinsertok(@ModelAttribute BoardVo searchVO)
    {

        Integer maxnum = 0;
        
        if(boardService.getListmax() != null)
        {
            maxnum =boardService.getListmax() + 1;
        }
        else
        {
            maxnum = 1;
        }
        log.info(""+ maxnum  +"넘확인");

        BoardVo bo = searchVO;

        bo.setBoardnum(maxnum);

        int intI = boardService.boardinsert(searchVO);

        //log.info(""+ intI  +"인설트 확인");
        //log.info(""+ boardVo.getId()  +"아이디");
        //log.info(""+ boardVo.getTitle()  +"타이틀");
        //log.info(""+ boardVo.getWrites()  +"게시글");
        return "redirect:/view";
    }


    @GetMapping("/viewdetail")  //게시글 디테일 창
    public String viewdetail(@RequestParam Integer boardnum, Model model)
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
