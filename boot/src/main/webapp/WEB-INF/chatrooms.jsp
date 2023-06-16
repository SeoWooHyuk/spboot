<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri = "http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<html>
<head>
<meta charset="UTF-8">
<title>웹소켓 채팅방 목록</title>
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;400&display=swap" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css2?family=Roboto&display=swap" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js" integrity="sha384-cuYeSxntonz0PPNlHhBs68uyIAVpIIOZZ5JqeqvYYIcEL727kskC66kF92t6Xl2V" crossorigin="anonymous"></script>
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
		<h1>WebSocket Chattingroom</h1>
		<br/>
        <ul>
        <c:forEach items="${list}" var="room">
         <li><a href="<c:url value='/chat/room'><c:param name='roomId' value='${room.roomId}'/></c:url>">${room.name}</a></li>
        </c:forEach>
        </ul>

        <form action="/chat/room" method="post">
        <input type="text" name="name" class="form-control">
		<div class="btn btn-secondary">
			<input type='submit' value='개설하기' id='btnSend'>
		</div>
        </form>
	</div>

	<jsp:include page ="/footer"/>	 
</body>
</html>




