<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri = "http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<html>
<head>
<meta charset="UTF-8">
<title>웹소켓</title>
	<!-- <script src="https://cdn.jsdelivr.net/sockjs/1/sockjs.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/webstomp-client@1.2.6/dist/webstomp.min.js"></script> -->

	<script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.4.0/sockjs.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;400&display=swap" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css2?family=Roboto&display=swap" rel="stylesheet">
	<link rel="stylesheet" type="text/css" href="/css/chat.css">
	<script src="/js/chat.js" type="text/javascript"></script>
	<script language=JavaScript src="${common_context_path_url}"></script>
</head>
<script language=JavaScript>
var roomName =  '<c:out value="${chat.name}"/>';
var roomId =  '<c:out value="${chat.roomId}"/>';
</script>
<style type="text/css">
</style>


<body>		
	<div id="checkperson"></div>

	<div id='chatt'>
		<h1>WebSocket Chatting 방제목 : ${chat.name}</h1>
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




