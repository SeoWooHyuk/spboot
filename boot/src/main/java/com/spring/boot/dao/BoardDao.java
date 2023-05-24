package com.spring.boot.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.spring.boot.vo.BoardVo;

@Mapper
public interface BoardDao {

    public List<BoardVo> getList(BoardVo  searchvo);

}
