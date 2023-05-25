package com.spring.boot.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.boot.dao.BoardDao;
import com.spring.boot.vo.BoardVo;

@Service
public class BoardService {

    @Autowired
    BoardDao bd;

    public List<BoardVo> getList(BoardVo searchVO)
    {
        List<BoardVo> list = bd.getList(searchVO);
        return list;
    }

    public BoardVo viewdetail(int boardnum)
    {
        BoardVo board = bd.viewdetail(boardnum);

        return board;

    }

    public int boardinsert(BoardVo searchVO)
    {
        int intI = bd.boardinsert(searchVO);
        return intI;
    }

    public int viewdetaildelete(int boardnum)
    {
        int intI = bd.viewdetaildelete(boardnum);
        return intI;
    }





    
}
