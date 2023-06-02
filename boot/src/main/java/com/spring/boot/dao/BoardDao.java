package com.spring.boot.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.spring.boot.vo.BoardVo;

import lombok.extern.slf4j.Slf4j;

@Mapper
public interface BoardDao {

    public List<BoardVo> viewsallselect(BoardVo  searchvo);

    public Integer viewsallselectlistcount(BoardVo  searchvo);

    public Integer getListcount();

    public Integer getListmax();

    public BoardVo viewdetail(Integer boardnum);

    public Integer boardinsert(BoardVo searchvo);

    public Integer viewdetaildelete(int boardnum);

    public Integer viewupdateok(BoardVo  updatevo);

}
