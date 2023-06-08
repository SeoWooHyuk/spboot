<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri = "http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script type="text/javascript"></script>
	
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;400&display=swap" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css2?family=Roboto&display=swap" rel="stylesheet">
	<link rel="stylesheet" type="text/css" href="css/login.css">
	<script src="js/login.js" type="text/javascript"></script>
</head>
<script type="text/javascript">
</script>

<style type="text/css">
</style>
<body>		

	<div id="logo" align="center">
		<p class="text-center">
            <img src="/images/nahwasa-profile.png" class="img-thumbnail" style="width: 200px;" alt="이 글이 보인다면 시큐리티 설정 잘못한거임!">
        </p>
	<div id="login_main">	
		${err} sadsadsad	
		<form name="login" id="login-form" method="POST" action="/login-process">	<!-- 시큐리티로 로그인정보 보냄 -->
			<table align="center" border="0" id="login_action">
				<tr><td><input type="text" id="id" class="txt_input" name="id" placeholder="아이디"></td></tr>
				<tr><td><input type="password" id="pw" class="txt_input" name="pw" placeholder="비밀번호" ></td></tr>
				<c:if test="${err != null}">
					<tr><td><div class="error_next_box" id="passMsg"  style="color:red;">${exception}</div></td></tr>
				</c:if>
				<tr><td><input type="button" id="login_button" name="" value="로그인"></td></tr>
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
		<span id="find_id"><a href="test">아이디 찾기</a></span>
		<span id="find_pw"><a href="">비밀번호 찾기</a></span>
		<span id="join"><a href="join">회원가입</a></span>			
	</div>
			
			
	
	
</body>
</html>




