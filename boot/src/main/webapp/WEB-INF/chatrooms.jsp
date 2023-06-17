<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri = "http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<html>
<head>
<meta charset="UTF-8">
<title>웹소켓 채팅방 목록</title>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;400&display=swap" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css2?family=Roboto&display=swap" rel="stylesheet">
	<link rel="stylesheet" type="text/css" href="/css/chat.css">
	<script src="/js/chatrooms.js" type="text/javascript"></script>
	<script language=JavaScript src="${common_context_path_url}"></script>
</head>

<script language=JavaScript>
var roomName = '<c:out value="${roomName.name}"/>';
</script>

<style type="text/css">
</style>

<body>		
	<jsp:include page ="/header"/>	

	<div id='chatt'>
		<h1>WebSocket Chattingroom</h1>
		로그인 후에 방개설이 가능합니다.
		<br/>
        <ul>
        <c:forEach items="${list}" var="room">
         <li><a href="<c:url value='/chat/room'><c:param name='roomId' value='${room.roomId}'/></c:url>">${room.name} 방</a></li>
        </c:forEach>
        </ul>

        <form action="/chat/room" method="post" name="form">
        <input type="text" name="name" id="name" class="form-control">
		<div class="btn btn-secondary">
			<button class="btn btn-secondary">개설하기</button>
		</div>
        </form>
	</div>

	<jsp:include page ="/footer"/>	 
</body>
</html>




