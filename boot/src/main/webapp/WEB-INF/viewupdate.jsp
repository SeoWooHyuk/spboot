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
	<link rel="stylesheet" type="text/css" href="css/board_deatil.css">
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script src="js/notice.js"></script>
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;400&display=swap" rel="stylesheet">
</head>
<body>

	<jsp:include page ="/header"/>	

	<h1 style="text-align:center; margin-bottom: 50px; margin-top: 30px;" class="con">게시판 수정</h1>
	<section class="article-detail table-common con"> 
        <table class="cell" border="1">
            <colgroup>
                <col width="100px">
            </colgroup>
            <tbody>
        <div id="check_box">
		<div class="mini_box1""><strong>게시글 공개/비공개</strong></div>
        <div class="mini_box">
	         <input type="radio" name="check_yn" id="email_yn1" alt="이메일 공개" value="true" checked=""><label for="email_yn1">공개</label>
	         <input type="radio" name="check_yn" id="email_yn2" alt="이메일 비공개" value="false"><label for="email_yn2">비공개</label>       
    	</div>    
    </div>  
                
    <form action="/viewupdatealter" method="post">
             <!-- //의미없는 파일 -->
    <input type="hidden" name=boardnum size="8" value="${board.boardnum}" >
     			<th>제목 <span style="color: red;">*</span> </th>
                <tr class="article-title">
                
                    <td colspan="3"><input type="text" name=title size=50 style="width: 100%; height: 32px; border: 2px solid #8041D9;" value="${board.title}"></td>
                </tr>
                <th>게시글 <span style="color: red;">*</span> </th>
                <tr class="article-body">
                    <td colspan="4"><textarea  name="writes" style="width: 100%; height: 500px; border: 2px solid #8041D9; font-size: 1.0em; resize : none;">${board.writes}</textarea> </td>
	             </tr>
	       </tbody>
	       </table>
	</section>

	   <div class="ass">
        <input type="button" id="moc" style="" value="목록" onclick="location.href= '/viewdetail?boardnum=${board.boardnum}'" >
        <input type="submit" id="submi" value="글수정완료" style="";> 
    </div>
 
	</form>
	<jsp:include page ="/footer"/>	 
</body>
</html>