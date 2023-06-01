<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri = "http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>스프링부트 게시판</title>
	<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;400&display=swap"
	rel="stylesheet">
    <link
	href="https://fonts.googleapis.com/css2?family=Roboto&display=swap"
	rel="stylesheet">
	<link href="css/sb-admin-2.min.css" rel="stylesheet">
	<link rel="stylesheet" type="text/css" href="css/board_select.css">
	
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

	<script src="js/view.js" type="text/javascript"></script>
	
</head>
<body>

<!-- ajax 게시판 호출 -->
<script type="text/javascript"></script>
<style type="text/css">
	*{font-family: 'Noto Sans KR', sans-serif;}
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
		
		<!-- 총게시물 ${totCnt} / 페이지 (${searchVO.pageIndex} / ${totalPageCnt}) -->

<sec:authorize access="permitAll">
	<jsp:include page ="/header"/>	 
</sec:authorize>

<section class="board">


		<h2 style="text-align: center; font-size: 30px; margin-bottom: 20px; margin-top: 30px;">스프링부트 jsp게시판${pageContext.request.userPrincipal.name} 회원</h2>
		<form class="search" method="get"  id="listForm">

		<span id="toboardcount" style="float: left; position: relative; top: 40px;"></span> <!--게시글 몇게인지 표시하는 것 -->

        <div id ="box" style="flex-basis: 675px; height: 73px; float: right;  ">
            <div  action="board_select" class="search_form"style="float :left;">
                <input class="searchTerm" placeholder="검색하세여"  name = "searchKeyword"  value="${searchVO.searchKeyword}"/><input class="searchButton" onclick="fn_search();"  />
            </div>     
        </div>
		</form>

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


<!-- //UI Object -->            
</section>

<section class="board2">
	<c:if test="${pageContext.request.userPrincipal.name != null}"> 
	<input type="button" id = "submi"  value="+등록하기" onclick="location.href= 'viewinsert'" ;>
	</c:if>
<div class="pageContainer">   
	
</div>

	
</section>

<section class="board2">
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
	<!-- Paging[e] -->
</section>




</body>
</html>