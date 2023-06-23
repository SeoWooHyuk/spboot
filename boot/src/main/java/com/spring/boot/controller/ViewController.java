package com.spring.boot.controller;

import java.util.HashMap;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import com.spring.boot.config.Myfileupload;
import com.spring.boot.service.BoardService;
import com.spring.boot.vo.BoardVo;
import com.spring.boot.vo.Pagination;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;


@Controller
@Slf4j
@Tag(name = "ViewController", description = "게시판 전체 컨트롤러")
public class ViewController {
    
    @Autowired
    BoardService boardService;

    @Autowired
    Myfileupload myfileupload;

    @Operation(summary = "게시판 화면", description = "기시판 화면 출력합니다.")
    @RequestMapping(value = "/view", method = {RequestMethod.GET, RequestMethod.POST})
    public ModelAndView  viewsallselect()
    {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("view");
        return mv;
    }

    // 게시판 목록 조회  ajax비동기 통신전달
	@RequestMapping(value = "/viewsallselectajax", method = {RequestMethod.GET, RequestMethod.POST})

	public ModelAndView viewsallselectajax(@RequestBody BoardVo searchVO )  {
        ModelAndView mv = new ModelAndView();
		Map<String, Object> boardMap =  boardService.viewsallselectajax(searchVO); //테이블셀렉
        System.out.println(boardMap);
		mv.addObject("boardMap", boardMap);  //테이블 게시글 셀렉에 이용
		mv.setViewName("jsonView"); //클라이언트로
		return mv;
	}
 
    @GetMapping("/viewinsert")  //게시글 인설트 페이지
    public String viewsinsert(HttpSession session)
    {
        return "viewinsert";
    }

    @PostMapping("/viewinsert_ok")  //게시글 인설트  + 파일첨부 확인
    public String viewsinsertok(@ModelAttribute BoardVo searchVO, @RequestParam("file") MultipartFile file) throws Exception
    {
        Integer maxnum = 0; 
        String img = myfileupload.uploadFile(file);

        if(boardService.getListmax() != null){   //오토인크리먼트 역활 처리
            maxnum =boardService.getListmax() + 1;
        }
        else { maxnum = 1; }

        searchVO.setBoardnum(maxnum);
        searchVO.setFiles(img);

       // log.info(""+ searchVO.getFiles() +"파일");
        //log.info(""+ searchVO.getWrites() +"게시글  확인");

        int intI = boardService.boardinsert(searchVO); 
        return "redirect:viewdetail?boardnum="+searchVO.getBoardnum();
    }


    @GetMapping("/viewdetail")  //게시글 디테일 창
    public String viewdetail(@RequestParam Integer boardnum, Model model)
    {
        BoardVo board =  boardService.viewdetail(boardnum);
        log.info(""+ board.getFiles() +"파일이름확인");
        model.addAttribute("board", board);
        return "viewdetail";
    }


    @GetMapping("/viewupdate")  //게시글 update 창
    public String viewupdate(@RequestParam Integer boardnum, Model model)
    {
        BoardVo board =  boardService.viewdetail(boardnum);
        model.addAttribute("board", board);
        return "viewupdate";
    }

    @PostMapping("/viewupdatealter")  //게시글 update alter 창
    public String viewupdateok(@ModelAttribute BoardVo updatevo)
    {
        int intI =  boardService.viewupdateok(updatevo);
        return "redirect:viewdetail?boardnum="+updatevo.getBoardnum();
    }


    @GetMapping("/viewdelete")  //게시글 삭제
    public String viewdetaildelete(@RequestParam int boardnum)
    {
        int intI = boardService.viewdetaildelete(boardnum);
        return "redirect:/view";
    }




   
}
