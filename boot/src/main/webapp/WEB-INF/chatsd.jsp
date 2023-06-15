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
	<link rel="stylesheet" type="text/css" href="css/login.css">
	<script language=JavaScript src="${common_context_path_url}"></script>
</head>
<script language=JavaScript>
 $(document).ready(function(){
	
const username = '<c:out value="${pageContext.request.userPrincipal.name}"/>';

$("#disconn").on("click", (e) => {
	disconnect();
})

$("#button-send").on("click", (e) => {
	send();
});

const websocket = new WebSocket("ws://localhost:8080/ws/chat");

websocket.onmessage = onMessage;
websocket.onopen = onOpen;
websocket.onclose = onClose;

function send(){

	let msg = document.getElementById("msg");

	console.log(username + ":" + msg.value);
	websocket.send(username + ":" + msg.value);
	msg.value = '';
}

//채팅창에서 나갔을 때
function onClose(evt) {
	var str = username + ": 님이 방을 나가셨습니다.";
	websocket.send(str);
}

//채팅창에 들어왔을 때
function onOpen(evt) {
	console.log("WebSocket connection is opened.");
	var str = username + ": 님이 입장하셨습니다.";
	websocket.send(str);
}

function onMessage(msg) {
	var data = msg.data;
	var sessionId = null;
	//데이터를 보낸 사람
	var message = null;
	var arr = data.split(":");

	for(var i=0; i<arr.length; i++){
		console.log('arr[' + i + ']: ' + arr[i]);
	}

	var cur_session = username;

	//현재 세션에 로그인 한 사람
	console.log("cur_session : " + cur_session);
	sessionId = arr[0];
	message = arr[1];

	console.log("sessionID : " + sessionId);
	console.log("cur_session : " + cur_session);

	//로그인 한 클라이언트와 타 클라이언트를 분류하기 위함
	if(sessionId == cur_session){
		var str = "<div class='col-6'>";
		str += "<div class='alert alert-secondary'>";
		str += "<b>" + sessionId + " : " + message + "</b>";
		str += "</div></div>";
		$("#msgArea").append(str);
	}
	else{
		var str = "<div class='col-6'>";
		str += "<div class='alert alert-warning'>";
		str += "<b>" + sessionId + " : " + message + "</b>";
		str += "</div></div>";
		$("#msgArea").append(str);
	}
}
})



</script>

<style type="text/css">
</style>
<body>		
	<jsp:include page ="/header"/>	
	${pageContext.request.userPrincipal.name}
	<button class="btn btn-outline-secondary" type="button" id="#disconn">연결끊기</button>
        <div class="container">
            <div class="col-6">
                <label><b>채팅방</b></label>
            </div>
            <div>
                <div id="msgArea" class="col"></div>
                <div class="col-6">
                    <div class="input-group mb-3">
                        <input type="text" id="msg" class="form-control" aria-label="Recipient's username" aria-describedby="button-addon2">
                        <div class="input-group-append">
                            <button class="btn btn-outline-secondary" type="button" id="button-send">전송</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>

	<jsp:include page ="/footer"/>	 
</body>
</html>




