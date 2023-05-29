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
	<link rel="stylesheet" type="text/css" href="css/login.css">
</head>

<body>		
	<div id="logo" align="center">
        <p class="text-center">
            <img src="/images/nahwasa-profile.png" class="img-thumbnail" style="width: 200px;" alt="이 글이 보인다면 시큐리티 설정 잘못한거임!">
        </p>
		<h2 style="text-align: center; font-size: 30px; margin-bottom: 20px; margin-top: 30px;">회원가입 창</h2>
	<div id="login_main">					<!-- 아이디, 비밀번호 입력창, 로그인 버튼 영역 -->
		<form name="login" id='join_form' method="POST" >	<!-- 로그인 버튼으로 userID 값, userPW 값을 Login_cont 로 전달 -->
			<table align="center" border="0" id="login_action">
				<tr><td><input type="text" id="id" class="txt_input" name="id" placeholder="아이디"></td></tr>
				<tr><td><input type="password" id="passwd" class="txt_input" name="pw" placeholder="비밀번호" ></td></tr>
				<tr><td><input type="submit" id="login_button"  value="회원가입"></td></tr>
			</table>
		</form>
	</div>
	
	<!-- 아이디, 비밀번호 찾기, 회원가입 링크 영역 -->
	<div id="login_sub2">
		<span id="find_id"><a href=""></a></span>
		<span id="find_pw"><a href="login">회원가입 취소</a></span>
		<span id="join"><a href=""></a></span>			
	</div>
	<script>
        const form = document.getElementById('join_form');

        form.addEventListener('submit', e => {
            e.preventDefault();

            const data = new FormData(form);
            const param = JSON.stringify(Object.fromEntries(data));

            fetch('/joininsert', {
                method: 'POST',
                body: param,
                headers: {
                    'Content-Type': 'application/json'
                }
            })
            .then(response => {
                debugger;
                if (response.status == 200) {
                    window.location.href = '/login';
                    alert("회원가입 성공")
                } else {
                    alert("회원가입 실패")
                }
            })
            .catch(error => console.log(error))
        });
    </script>		
			
	
	
</body>
</html>




