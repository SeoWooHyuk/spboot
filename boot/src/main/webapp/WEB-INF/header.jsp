<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri = "http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
	<script type="text/javascript"></script>
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;400&display=swap" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css2?family=Roboto&display=swap" rel="stylesheet">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js" integrity="sha384-cuYeSxntonz0PPNlHhBs68uyIAVpIIOZZ5JqeqvYYIcEL727kskC66kF92t6Xl2V" crossorigin="anonymous"></script>
</head>
<body>		
	
	<div class="b-example-divider"></div>

	<div class="container">
	  <header class="d-flex flex-wrap align-items-center justify-content-center justify-content-md-between py-3 mb-4 border-bottom">
		<a href="/" class="d-flex align-items-center col-md-3 mb-2 mb-md-0 text-dark text-decoration-none">
		  <svg class="bi me-2" width="40" height="32" role="img" aria-label="Bootstrap"><use xlink:href="#bootstrap"/></svg>
		</a>
  
		<ul class="nav col-12 col-md-auto mb-2 justify-content-center mb-md-0">
		  <li><a href="/" class="nav-link px-2 link-secondary">Home</a></li>
		  <li><a href="/view" class="nav-link px-2 link-dark">게시판</a></li>
		  <li><a href="#" class="nav-link px-2 link-dark">공사중</a></li>
		  <li><a href="#" class="nav-link px-2 link-dark">공사중</a></li>
		  <li><a href="#" class="nav-link px-2 link-dark">공사중</a></li>
		</ul>
  
		<div class="col-md-3 text-end">
		<c:if test="${pageContext.request.userPrincipal.name != null}"> 
			<button type="button" class="btn btn-outline-primary me-2" onclick="location.href= 'logout'">logout</button>
		</c:if>
		<c:if test="${pageContext.request.userPrincipal.name == null}"> 
			<button type="button" class="btn btn-outline-primary me-2" onclick="location.href= 'login'">Login</button>
			<button type="button" class="btn btn-primary" onclick="location.href= 'join'">Sign-up</button>
		</c:if>
	

		</div>

	  </header>
	</div>
	
</body>
</html>




