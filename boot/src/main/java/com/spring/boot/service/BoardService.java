package com.spring.boot.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.boot.dao.BoardDao;
import com.spring.boot.vo.BoardVo;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class BoardService {

    @Autowired
    BoardDao bd;

    //ajax 보드게시판 불러오기 비동기 처리
    public Map<String, Object> viewsallselectajax(BoardVo searchVO) {

        List<BoardVo> boardList=bd.viewsallselect(searchVO);
       // log.info(""+ boardList.size()  +"viewsallselectajax 서비스 ");
        Map<String, Object> boardMap = new HashMap<>();
        boardMap.put("boardList", boardList);
        return boardMap;
    }

    public List<BoardVo> viewsallselect(BoardVo searchVO)
    {
        List<BoardVo> list = bd.viewsallselect(searchVO);
       // log.info(""+ list.size()  +"viewsallselect 서비스 ");
        return list;
    }

    public Integer viewsallselectlistcount(BoardVo searchVO)
    {
        return bd.viewsallselectlistcount(searchVO);
    }

    public Integer getListcount()
    {
      return bd.getListcount();
    }

    public Integer getListmax()
    {

       return bd.getListmax();
    }


    public BoardVo viewdetail(int boardnum)
    {
        BoardVo board = bd.viewdetail(boardnum);

        return board;

    }

    public Integer boardinsert(BoardVo searchVO)
    {
        Integer intI = bd.boardinsert(searchVO);
        return intI;
    }

    public Integer viewdetaildelete(int boardnum)
    {
        int intI = bd.viewdetaildelete(boardnum);
        return intI;
    }

    public Integer viewupdateok(BoardVo updatevo)
    {
        Integer intI = bd.viewupdateok(updatevo);
        return intI;
    }
    





    
}
