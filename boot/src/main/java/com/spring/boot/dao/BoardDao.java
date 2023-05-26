package com.spring.boot.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.spring.boot.vo.BoardVo;

@Mapper
public interface BoardDao {

    public List<BoardVo> viewsallselect(BoardVo  searchvo);

    public Integer getListcount();

    public Integer getListmax();

    public BoardVo viewdetail(Integer boardnum);

    public Integer boardinsert(BoardVo searchvo);

    public Integer viewdetaildelete(int boardnum);

}
