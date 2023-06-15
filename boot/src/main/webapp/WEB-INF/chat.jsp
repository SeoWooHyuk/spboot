<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri = "http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<html>
<head>
<meta charset="UTF-8">
<title>웹소켓</title>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;400&display=swap" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css2?family=Roboto&display=swap" rel="stylesheet">
	<link rel="stylesheet" type="text/css" href="css/chat.css">
	<script src="js/chat.js" type="text/javascript"></script>
	<script language=JavaScript src="${common_context_path_url}"></script>
</head>
<script language=JavaScript>
</script>
<style type="text/css">
</style>


<body>		
	<div id="checkperson"></div>

	<div id='chatt'>
		<h1>WebSocket Chatting</h1>
		<input type='hidden' id='mid' value='${pageContext.request.userPrincipal.name}'>
		<input type='button' value='나가기' id='disconn'> 
		<!-- <input type='button' value='로그인' id='btnLogin'> -->
		<br/>

		<div id='talk' style="overflow-x: hidden;"></div>

		<div id='sendZone'>
			<textarea id='msg' style=" border: 2px solid #8041D9; resize : none; font-size: large; font-weight: 900;"></textarea>
			<input type='button' value='전송' id='btnSend'>
		</div>
	</div>

	<jsp:include page ="/footer"/>	 
</body>
</html>




