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

<!-- ajax 게시판 호출 -->
<script type="text/javascript">
	var keyword = ""; 
	var pageindexjs = "1"; // 검색어 변수
	
	function fn_search(){
    keyword = $('.searchTerm').val(); // 검색어 저장
    $("#pageIndex").val("1");
    viewsallselect.viewsallselectajax(); // 게시판 조회
	}

	function fn_go_page(pageNo) {
	pageindexjs = pageNo.toString();
	$("#pageIndex").val(pageNo);
	viewsallselect.viewsallselectajax(); 
	}

	
	var viewsallselect = {
		// 최초 실행
		init: function(){
			viewsallselect.bind();  // 이벤트 바인딩
			viewsallselect.viewsallselectajax();    // 게시판 조회
		},
		// 이벤트 바인딩
		bind: function(){
			// 이벤트 바인딩 코드 작성
		
        // 엔터키 입력 시
        $('.searchTerm').on('keyup', function(e) {
            if (e.keyCode == 13/* 엔터키 */) {
                fn_search();
				
            }
        });


		},
		// 게시판 조회 ajax 호출
		viewsallselectajax: function(){
			var submitObj = new Object();
			console.log(pageindexjs);
			submitObj.searchKeyword= keyword ;
			submitObj.pageIndex = pageindexjs;
			$.ajax({
				url: '/viewsallselectajax',
				type: 'post',
				contentType: "application/json;charset=UTF-8",
				dataType: 'json',
				data: JSON.stringify(submitObj),
				success: function(res) {
					if (res.boardMap) {
						viewsallselect.bootstrap();
						viewsallselect.drawBoardList(res);
						viewsallselect.drawtoboardcount(res);
					}
				},
				error: function(xhr, status, error) {
					console.error(error);
				}
			});
		},
		// 게시판 조회 데이터 html 로 화면에 그려주기
		drawBoardList: function(data){
			var html = '';
			$.each( data.boardMap.boardList, function(i){
				//console.log(i);
				html += '<tr>';
				html += '    <td></td>';
				html += '    <td>'+i+'</td>';
				html += '    <td>'+data.boardMap.boardList[i].title+'</td>';
				html += '    <td>'+data.boardMap.boardList[i].id+'</td>';
				html += '    <td>'+data.boardMap.boardList[i].date+'</td>';
				html += '</tr>';
			});
			$("#tbody_boardList").html(html);
		},

		drawtoboardcount: function(data){

			//console.log(data.pagination); 
			const totCnt = data.totalPagewrite.totCnt;  //총게시글수 
			const pageindex =  data.boardMap.boardList[0].pageIndex; //현제페이지
			const totalPageCnt = data.totalPagewrite.totalPageCnt;
			var html = '총게시물 ' + totCnt + '/  (페이지' +pageindex + '/' + totalPageCnt+')' ;
		
			$("#toboardcount").html(html);
		},

		bootstrap: function() {
		var thisIndex = pageindexjs;
		var $paginationLinks = $(".pagination li a");
		$paginationLinks.each(function() {
			var $this = $(this);
			var linkIndex = $this.parent().index();
			var linkPageNo = $this.attr("title");
			if (linkPageNo === thisIndex && !$this.parent().hasClass("active")) {
			$paginationLinks.parent().removeClass("active");
			$this.parent().addClass("active");
			}
		}); 
		}

	}
	
	$(function(){
		viewsallselect.init();
	});

/*
	$(document).ready(function() { //부트스트랩내장 강조표시

		var thisIndex ="${searchVO.pageIndex}";
			$(".pagination li a").each(function(){
				var idx = $(this).parent().index();
				var thistitle = $(this).attr("title");
				console.log(typeof thistitle);
				console.log(typeof thisIndex);

				if(thistitle == thisIndex){
					$(".pagination").find("li").eq(idx).addClass("active");
				}
			});
	});
*/
	
	
	
	</script>
		
		<!-- 총게시물 ${totCnt} / 페이지 (${searchVO.pageIndex} / ${totalPageCnt}) -->
<section class="board">
	<span id="toboardcount"></span>
		<h2 style="text-align: center; font-size: 30px; margin-bottom: 20px; margin-top: 30px;">스프링부트 jsp게시판 ${sessionid}회원</h2>
		<form class="search" method="get"  id="listForm">
		<!-- <input type="hidden" id="pageIndex" name="pageIndex" val="" /> -->
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
		<thead style="text-align: center;">
		<tr>
		<th scope="col"></th>
		<th scope="col">No</th>
		<th scope="col">제목</th>
		<th scope="col">글쓴이</th>
		<th scope="col">작성날짜</th> 
		</tr>
		</thead>
		<tbody style ="height:40px; text-align: center;"  id="tbody_boardList"></tbody>
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