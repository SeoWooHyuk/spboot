<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<% request.setCharacterEncoding("utf-8"); %>
<%@page import="java.net.URLEncoder" %>

<%@taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri = "http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>

<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>스프링부트 게시판</title>
	<link rel="stylesheet" type="text/css" href="css/board_deatil.css">
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

	<link
		href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;400&display=swap"
		rel="stylesheet">
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
</head>
<script>

	
	var msg = "${msg}";
	
	if(msg != ""){
		alert(msg);	
	}
	
	function deleteConfirm(){
	if(!confirm("삭제 하시겠습니까?")){
	return false;
	}else{
	location.href="${pageContext.request.contextPath}viewdelete?boardnum=${board.boardnum}";
	}
	}

</script>
<body>

	<jsp:include page ="/header"/>	 
	<h1 style="text-align:center; margin-bottom: 5px; margin-top: 30px;" class="con">
		상세 게시글 </h1>
	<section class="article-detail table-common con">
		<table class="cell" border="1">
			<tbody>
				<colgroup>
					<col width="80px">
				</colgroup>
				<tr class="article-title">
					<th>제목:</th>
					<td colspan="3">
						${board.title}
					</td>
				</tr>
				<tr class="article-info">
					<th>작성자:</th>
					<td>
						${board.id}
					</td>
					<th style="width : 80px">날짜:</th>
					<td style="width : 165px;">
						${board.date}
					</td>
				</tr>
				<tr class="article-body">
					<td colspan="4">
						<div id="p_box">
							<p style="white-space: pre-line;" class="p_box">${board.writes}</p>
						</div>
					</td>
				</tr>

				<tr class="article-body">
					<td colspan="5"> 
						첨부파일:${board.files}
					

					<img src="/upload/${board.files}" width="50px" height="50px;"> 
					</td>
				</tr>

			</tbody>
		</table>


	</section>

	<div class="ass">
		<input type="button" id="moc" value="목록" onclick="location.href= 'view'">
		<div class="box1">
			<!--
			<input type="button" id="de" value="삭제" onclick="location.href= 'viewdelete?boardnum=${board.boardnum}'">
			-->
			<c:if test="${pageContext.request.userPrincipal.name == board.id}"> 
				<input type="button" id="de" onclick="deleteConfirm()" value="삭제" >
			</c:if>
			<c:if test="${pageContext.request.userPrincipal.name == board.id}"> 
			<input type="button" id="up" value="수정" onclick="location.href= 'viewupdate?boardnum=${board.boardnum}'">
			</c:if>
		</div>
	</div>

</body>
</html>