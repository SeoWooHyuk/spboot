package com.spring.boot.vo;

import lombok.Data;

@Data
public class PageVo {
    
    private int pageIndex = 1;				    //현재페이지
	private int pageUnit = 10;				    //페이지갯수 //한 페이지당 게시되는 게시물 수
	private int pageSize = 10;	    			//페이지사이즈 //페이지 리스트에 게시되는 페이지 수
	private int firstIndex = 1;		    		//firstIndex
	private int recordCountPerPage = 5;		//recordCountPerPage 
	private int totCnt = 0;				      	//총갯수
	private int startDate = 0;			    	//시작데이터
	private int endDate = 0;				    //종료데이터
    private int realEnd = 0;				    //페이징 마지막 숫자
		
	private boolean prev, next;	    			//이전,다음버튼

}
