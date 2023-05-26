<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<%@taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri = "http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>공지사항</title>
	<link rel="stylesheet" type="text/css" href="css/board_select.css">
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;400&display=swap" rel="stylesheet">
	<link href="css/sb-admin-2.min.css" rel="stylesheet">
</head>
<body>
<script>
	function fn_go_page(pageNo) {
	$("#pageIndex").val(pageNo);
	$("#listForm").submit();
	return false;
}

function fn_search(){
	$("#pageIndex").val("1");
	$("#listForm").submit();
	return false;
}

var viewsallselect = {
 	// 최초 실행
	init: function(){
		viewsallselect.viewsallselectajax();	// 게시판 조회
	},
    // 이벤트 바인딩
	bind: function(){
		
	},
    // 게시판 조회 ajax 호출
	viewsallselectajax: function(){
		$.ajax({
			url: '/viewsallselectajax',
			type: 'post',
			dataType: 'json',
			data: {},
			success: function(res) {
				//viewsallselect.drawBoardList(res.boardMap);
				alert(res.boardMap);
		
			}
		});
	},
    // 게시판 조회 데이터 html 로 화면에 그려주기
	drawBoardList: function(data){

		var html = '';
		$.each(data.viewsallselect, function(i, v){
            html += '<tr>';
            html += '	<td>'+v.boardnum+'</td>';
            html += '   <td>'+v.id+'</td>';
            html += '   <td>'+v.title+'</td>';
            html += '   <td>'+v.writes+'</td>';
            html += '   <td>'+v.date+'</td>';
            html += '</tr>';
		});
		$("#tbody_boardList").html(html);
	}
}

$(function(){

	viewsallselect.init();
});
</script>
		
  
<section class="board">
	<span>총게시물 ${totCnt} / 페이지 (${searchVO.pageIndex} / ${totalPageCnt})</span>
		<h2 style="text-align: center; font-size: 30px; margin-bottom: 20px; margin-top: 30px;">스프링부트 jsp게시판 ${sessionid}회원</h2>
		<form class="search" method="get"  id="listForm">
		<input type="hidden" id="pageIndex" name="pageIndex" val="" />
        <div id ="box" style="flex-basis: 675px; height: 73px; float: right;  ">
            <div  action="board_select" class="search_form"style="float :left;">
                <input class="searchTerm" placeholder="검색하세여"  name = "searchKeyword"  value="${searchVO.searchKeyword}"/><input class="searchButton" onclick="fn_search();"  />
            </div>     
        </div>
	
		<table cellspacing="0" border="1" summary="게시판의 글제목 리스트" class="tbl_type" id="myTable">
		<caption>게시판 리스트</caption>
		<colgroup>
		<col width="10"><col width="15">
		<col width="115"><col width="55"><col width="40">
		</colgroup>
		<thead>
		<tr>
		<th scope="col"></th>
		<th scope="col">No</th>
		<th scope="col">제목</th>
		<th scope="col">글쓴이</th>
		<th scope="col">작성날짜</th> 
		</tr>
		</thead>	
		<script>
		$(document).ready(function() { //부트스트랩내장 강조표시
	
			var thisIndex = "${searchVO.pageIndex}"
			$(".pagination li a").each(function(){
				var idx = $(this).parent().index();
				var thistitle = $(this).attr("title");
				if(thistitle == thisIndex){
					$(".pagination").find("li").eq(idx).addClass("active");
				}
			});
			
			});
		</script>
		<tbody style ="height:40px">
		

			<tbody id="tbody_boardList">



		</tbody>
		</table>

<!-- Paging[s] -->
<div class="col-sm-12 col-md-7" style="text-align:right">
	<div class="dataTables_paginate paging_simple_numbers" id="dataTable_paginate">
	  <ul class="pagination">
	  
	  <c:if test="${searchVO.prev}">
	  <li class="paginate_button page-item previous" id="dataTable_previous">
			  <a href="javascript:void(0);" onclick="fn_go_page(${searchVO.startDate - 1}); return false;" aria-controls="dataTable" data-dt-idx="0" tabindex="0" class="page-link">Previous</a>
	  </li>
	  </c:if>
	  
	  <c:forEach var="num" begin="${searchVO.startDate}" end="${searchVO.endDate}">
	  <li class="paginate_button page-item">
			  <a href="javascript:void(0);" onclick="fn_go_page(${num}); return false;" aria-controls="dataTable" data-dt-idx="0" tabindex="0" class="page-link" title="${num}">${num}</a>
	  </li>
	  </c:forEach>
	  
	  <c:if test="${searchVO.next}">
	  <li class="paginate_button page-item next" id="dataTable_next">
			  <a href="javascript:void(0);" onclick="fn_go_page(${searchVO.endDate + 1}); return false;" aria-controls="dataTable" data-dt-idx="0" tabindex="0" class="page-link">Next</a>
	  </li>
	  </c:if>
	  </ul>
	</div>
	</div>
</form>
	<!-- Paging[e] -->

<!-- //UI Object -->            
</section>
<section class="board2">
		<input type="button" id = "submi"  value="+로그아웃" onclick="location.href= 'logout'" ;>
		<c:if test="${sessionid != null}">
  		<input type="button" id = "submi"  value="+등록하기" onclick="location.href= 'viewinsert'" ;>
		</c:if>
<style>
    #submi
    {
   
       height: 35px;
       width: 100px;
    }
    #submi:hover
	{
	    border-style: solid;
	    border-color: blueviolet;
	}
</style>
   <div class="pageContainer">   
	
	</div>
</section>




</body>
</html>