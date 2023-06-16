<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri = "http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;400&display=swap" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css2?family=Roboto&display=swap" rel="stylesheet">
	<link rel="stylesheet" type="text/css" href="css/login.css">
    <script src="js/join.js" type="text/javascript"></script>
</head>
<script type="text/javascript">


</script>

<style type="text/css">
.postcode{
  width: 300px;
  height: 50px; 
  margin-top: 15px;
  border: solid 1px #BDBDBD;
  color: #747474;
  border-radius: 5px;
}
.searchbtn{
  width: 98px;
  height: 50px; 
  background-color: #D1B2FF; 
  border: none;
  border-radius: 5px;
  margin-left: 20px;
  cursor: pointer;
}

.searchbtn:hover{
  background-color: #A566FF; 
}

.address{
  width: 420px;
  height: 50px; 
  margin-top: 5px;
  border: solid 1px #BDBDBD;
  color: #747474;
  border-radius: 5px;
}
.detailaddress{
  width: 420px;
  height: 50px; 
  margin-top: 5px;
  border: solid 1px #BDBDBD;
  color: #747474;
  border-radius: 5px;
}

</style>
<body>		
    <jsp:include page ="/header"/>	 
	<div id="logo" align="center">
        <p class="text-center">
            <img src="data:image/jpeg;base64,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" class="img-thumbnail" style="width: 200px;" alt="이 글이 보인다면 시큐리티 설정 잘못한거임!">
        </p>
		<h2 style="text-align: center; font-size: 30px; margin-bottom: 20px; margin-top: 30px;">회원가입 창</h2>
	<div id="login_main">					<!-- 아이디, 비밀번호 입력창, 로그인 버튼 영역 -->
		<form name="login" id='join_form' method="POST" >	<!-- 로그인 버튼으로 userID 값, userPW 값을 Login_cont 로 전달 -->
			<table align="center" border="0" id="login_action">
                <tr><td><b>아이디<font color="#FF0000">*</font></b></td></tr>
				<tr><td><input type="text" id="id" class="txt_input" name="id" placeholder="아이디(이메일)"   ></td></tr>
                <tr><td><div class="error_next_box" id="passidMsg" style="color:red;"></div></td></tr>

                <tr><td><b>패스워드<font color="#FF0000">*</font></b></td></tr>
                <tr><td> <input type="password" name="pw" size="49" minlength="8" maxlength="15" placeholder="비밀번호를 입력해주세요.(8자 이상 16자 미만)" class="txt_input"></td></tr>
				<tr><td><div class="error_next_box" id="passMsg" style="color:red;"></div></td></tr>

                
                <tr><td><b>패스워드 확인<font color="#FF0000">*</font></b></td></tr>
                <tr><td> <input type="password" size="49" minlength="8" maxlength="15" placeholder="비밀번호를 한번 더 입력해주세요." class="txt_input" name="pw2" ></td></tr>
                <tr><td><div class="error_next_box" id="pass2Msg" style="color:red;"></div></div></td></tr>
               
				<tr><td><b>지역<font color="#FF0000">*</font></b></td></tr>
				<tr>
					<td>
						<input type="text" id="sample6_postcode" maxlength="0" placeholder="우편번호" name="area1" size="30" class="postcode"><span><input type="button" onclick="sample6_execDaumPostcode()" value="주소 찾기" class="searchbtn"></span>
						<div><input type="text" maxlength="0" id="sample6_address" placeholder="주소" name="area2" size="49" class="address"></div>
						<div><input type="text" id="sample6_detailAddress" placeholder="상세주소를 입력해주세요." name="address2" size="49" class="detailaddress"></div>
						<input type="hidden" id="sample6_extraAddress" placeholder="참고항목" >
					</td>
				</tr>
				<tr><td><div class="error_next_box" id="areaMsg" style="color:red;"></div></div></td></tr>

				<tr>
				<td>
					<b><input type="checkbox" class="access" name="access" id="accessAll" value="모두 동의합니다." > 모두 동의합니다.</b>
				</td>
				</tr>
				<tr>
				<td>
					<input type="checkbox" class="access"  name="access" value="만 14세	이상입니다."> 만 14세 이상입니다.<font color="	#FF0000">(필수)</font>
				</td>
				</tr>
				<tr>
				<td>
					<input type="checkbox" class="access" name="access" value="서비스 이용약관에 동의합니다."> 서비스 이용약관에 동의합니다.<font color="#FF0000">(필수)</font> 
				</td>
				</tr>
				<tr>
				<td>
					<input type="checkbox" class="access" name="access" value="개인정보 수집/이용에 동의합니다."> 개인정보 수집/이용에 동의합니다.<font color="#FF0000">(필수)</font> 
				</td>
				</tr>
				<tr>
				<td>
					<input type="checkbox" class="access" name="access" value="개인정보 제3자 제공에 동의합니다."> 개인정보 제3자 제공에 동의합니다.<font color="#FF0000">(필수)</font> 
				</td>
				</tr>
				<tr>
				<td>
					<input type="checkbox" class="access" name="access1" value="Y"> 이벤트 할인 혜택 알림 수신에 동의합니다. 
				</td>
				<tr>
				</tr>
				<td>
					<input type="checkbox"  class="access" name="access2" value="Y"> 장기 미접속 시 계정 활성 상태를 유지합니다.
				</td>
				<tr>
				</tr>
				<div class="error_next_box" id="accessMsg"></div>
				</tr>

                <tr><td><input type="submit" id="login_button"  value="회원가입"></td></tr>
			</table>
		</form>
	</div>
	
	<!-- 아이디, 비밀번호 찾기, 회원가입 링크 영역 -->
	<div id="login_sub2" style="margin-bottom: 150px;;">
		<span id="find_id"><a href=""></a></span>
		<span id="find_pw"><a href="login">회원가입 취소</a></span>
		<span id="join"><a href=""></a></span>			
	</div>
	
	<jsp:include page ="/footer"/>	 
</body>
</html>




