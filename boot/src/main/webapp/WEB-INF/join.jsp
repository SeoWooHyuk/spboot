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
            <img src="/images/nahwasa-profile.png" class="img-thumbnail" style="width: 200px;" alt="이 글이 보인다면 시큐리티 설정 잘못한거임!">
        </p>
		<h2 style="text-align: center; font-size: 30px; margin-bottom: 20px; margin-top: 30px;">회원가입 창</h2>
	<div id="login_main">					<!-- 아이디, 비밀번호 입력창, 로그인 버튼 영역 -->
		<form name="login" id='join_form' method="POST" >	<!-- 로그인 버튼으로 userID 값, userPW 값을 Login_cont 로 전달 -->
			<table align="center" border="0" id="login_action">
                <tr><td><b>아이디<font color="#FF0000">*</font></b></td></tr>
				<tr><td><input type="text" id="id" class="txt_input" name="id" placeholder="아이디"   ></td></tr>
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
</body>
</html>




