package com.spring.boot.service;


import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.spring.boot.dao.BoardDao;
import com.spring.boot.vo.BoardVo;
import com.spring.boot.vo.Pagination;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class BoardService {

    @Autowired
    BoardDao bd;

    //ajax 보드게시판 불러오기 비동기 처리
    public Map<String, Object> viewsallselectajax(BoardVo searchVO) {

         int totCnt = bd.getListcount(); //토탈 셀렉 수
        int totCnt2 = bd.viewsallselectlistcount(searchVO); //토탈 검색 셀렉 수
        int totalPageCnt = (int)Math.ceil(totCnt / (double)searchVO.getPageUnit());

        Pagination pagination = new Pagination();
        pagination.setCurrentPageNo(searchVO.getPageIndex()); //현재 페이지 번호
        pagination.setRecordCountPerPage(searchVO.getPageUnit()); //한 페이지당 게시되는 게시물 수
        pagination.setPageSize(searchVO.getPageSize()); //페이지 리스트에 게시되는 페이지 수
        pagination.setTotalRecordCount(totCnt2); 
        searchVO.setFirstIndex(pagination.getFirstRecordIndex()); //페이징 sql의 조건절에 사용되는 시작 rownum
        searchVO.setRecordCountPerPage(pagination.getRecordCountPerPage()); //한 페이지당 게시되는 게시물 수

        List<BoardVo> boardList=bd.viewsallselect(searchVO);
        Map<String, Object> boardMap = new HashMap<>();
        boardMap.put("boardList", boardList);
        boardMap.put("totalPageCnt", totalPageCnt);
        boardMap.put("totCnt", totCnt);
        boardMap.put("pagination", pagination);
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
