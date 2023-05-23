<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
	<script type="text/javascript"></script>
	
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;400&display=swap" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css2?family=Roboto&display=swap" rel="stylesheet">
</head>
<script type="text/javascript">
</script>

<style type="text/css">

*{font-family: 'Noto Sans KR', sans-serif;}
a{
	color: black;
	text-decoration: none;
}
html {
	margin-left: 0;
	margin-right: 0;
}
body {
	display: block;
	margin: 0;
	width: auto;
}

#login_action {
	width:420px;
	margin-top:50px;
	
}

#login_sub2 {
	width:410px;
	text-align:center;
	margin: 0 auto;
	font-height:bold;
}

#find_id {
	float:left;
	display:inline;
}

#find_pw {
	float:center;
	display:inline;
}

#join {
	float:right;
	display:inline;
}
#login_button{
 	background-color:#8041D9;
 	border:solid 1px #8041D9;
 	border-radius:5px;
 	color:white;
 	width:100%;
 	height:40px;
 	margin-top:30px;
 	font-size:12pt;
 	font-weight:bold;
}
#login_button:hover{
	background-color:#3F0099;
}

.txt_input {
	width:100%;
	height:50px;
	border:solid 1px black;
	border-radius:5px;
}

#checkbox{
	margin-top:10px;
}


#login_sub1{
	width:410px;
	text-align:center;
	margin: 40px auto;
}

.naverlogin{
	width:100%;
	height:40px;
	background-color:#05BE34;
	border:solid 2px #05BE34;
	border-radius:5px;
	background-image: url(image/naverlogo.png);
	background-repeat: no-repeat;
	background-position: left;
	background-size: 40px 40px;
	margin-top:5px;
}
.naverlogin span{
	display:inline-block;
	width:370px;
	height:40px;
	float:right;
	background-color:white;
	color:#05BE34;
	font-weight:bold;
	border-radius:5px;
	line-height:40px;
}
.naverlogin span:hover{
	background-color:#05BE34;
	color:white;
}

.cacaologin{
	width:100%;
	height:40px;
	background-color:#FFE617;
	border:solid 2px #FFE617;
	border-radius:5px;
	background-image: url(image/cacaologo.png);
	background-repeat: no-repeat;
	background-position: left;
	background-size: 40px 40px;
	margin-top:5px;
}
.cacaologin span{
	display:inline-block;
	width:370px;
	height:40px;
	float:right;
	background-color:white;
	color:#FFE617;
	font-weight:bold;
	border-radius:5px;
	line-height:40px;
}
.cacaologin span:hover{
	background-color:#FFE617;
	color:white;
}

.googlelogin{
	width:100%;
	height:40px;
	background-color:#DC4A38;
	border:solid 2px #DC4A38;
	border-radius:5px;
	background-image: url(image/googlelogo.png);
	background-repeat: no-repeat;
	background-position: left;
	background-size: 40px 40px;
	margin-top:5px;
}
.googlelogin span{
	display:inline-block;
	width:370px;
	height:40px;
	float:right;
	background-color:white;
	color:#DC4A38;
	font-weight:bold;
	border-radius:5px;
	line-height:40px;
}
.googlelogin span:hover{
	background-color:#DC4A38;
	color:white;
}

.facebooklogin{
	width:100%;
	height:40px;
	background-color:#3A559F;
	border:solid 2px #3A559F;
	border-radius:5px;
	background-image: url(image/facebooklogo.png);
	background-repeat: no-repeat;
	background-position: left;
	background-size: 40px 40px;
	margin-top:5px;
}
.facebooklogin span{
	display:inline-block;
	width:370px;
	height:40px;
	float:right;
	background-color:white;
	color:#3A559F;
	font-weight:bold;
	border-radius:5px;
	line-height:40px;
}
.facebooklogin span:hover{
	background-color:#3A559F;
	color:white;
}
img{
	cursor:pointer;
}
</style>
<body>		
	<div id="logo" align="center">
		<img src="./image/logo_beta_purple.png" style="width:200px; height:auto; margin-top:100px;"/ onclick="location.href='/learnup'"></div>		<!-- 로고 이미지 영역 -->
	<div id="login_main">					<!-- 아이디, 비밀번호 입력창, 로그인 버튼 영역 -->
		<form name="login" method="get" action="login_check">	<!-- 로그인 버튼으로 userID 값, userPW 값을 Login_cont 로 전달 -->
			<table align="center" border="0" id="login_action">
				<tr><td><input type="text" id="id" class="txt_input" name="id" placeholder="아이디"></td></tr>
				<tr><td><input type="password" id="passwd" class="txt_input" name="pw" placeholder="비밀번호" ></td></tr>
				<tr><td><input type="checkbox" name=checkbox id="check1"  >email 저장</td></tr>
				<tr><td><input type="submit" id="login_button" name="" value="로그인"></td></tr>
			</table>
		</form>
	</div>
	
	<div id="login_sub1">
		<a href="#self"><div class="naverlogin"><span>네이버 로그인</span></div></a>
		<a href="#self"><div class="cacaologin"><span>카카오 로그인</span></div></a>
		<a href="#self"><div class="googlelogin"><span>구글 로그인</span></div></a>
		<a href="#self"><div class="facebooklogin"><span>페이스북 로그인</span></div></a>	
	</div>
	
	<!-- 아이디, 비밀번호 찾기, 회원가입 링크 영역 -->
	<div id="login_sub2">
		<span id="find_id"><a href="">아이디 찾기</a></span>
		<span id="find_pw"><a href="">비밀번호 찾기</a></span>
		<span id="join"><a href="">회원가입</a></span>			
	</div>
			
			
	
	
</body>
</html>




