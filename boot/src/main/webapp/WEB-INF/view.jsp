<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<%@taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri = "http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>공지사항</title>
	<link rel="stylesheet" type="text/css" href="css/board_select.css">
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;400&display=swap" rel="stylesheet">
</head>
<body>
		
  
<section class="board">
		<h2 style="text-align: center; font-size: 30px; margin-bottom: 20px; margin-top: 30px;">스프링부트 jsp게시판 ${sessionid}회원</h2>
 
        <div id ="box" style="flex-basis: 675px; height: 73px; float: right;  ">
            <div  action="board_select" class="search_form"style="float :left;">
                <form class="search">
                <input class="searchTerm" placeholder="검색하세여"  name = "searchs" /><input class="searchButton" type="submit" />
                </form>
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
	
		<tbody style ="height:40px">
		<c:forEach var="list" items="${boardList}">
		<tr>
            <td class="frm">
				
            </td>
            <td class="num">
				<c:out value="${list.boardnum}" />
            </td>
            <td class="title">
				<c:out value="${list.title}" />
            </td>
			<td class="title">
				<c:out value="${list.id}" />
            </td>
            <td class="date">
				<c:out value="${list.date}" />
            </td>
		</tr>
		</c:forEach>
		</tbody>
	
		


		</table>
<!-- //UI Object -->            
</section>



<section class="board2">

	
		<input type="button" id = "submi"  value="+로그아웃" onclick="location.href= 'logout'" ;>
  		<input type="button" id = "submi"  value="+등록하기" onclick="location.href= 'viewinsert'" ;>
 

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