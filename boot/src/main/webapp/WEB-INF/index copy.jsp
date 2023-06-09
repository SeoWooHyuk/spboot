
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<% request.setCharacterEncoding("utf-8"); %>


<%@page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>스프링부트 메인페이지</title>
<link rel="stylesheet" type="text/css" href="css/index.css">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;400&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Roboto&display=swap"
	rel="stylesheet">
</head>
<script type="text/javascript">
	
</script>

<style type="text/css">
#tables
{
	text-align: center;
	border-style: solid;
	border-color: #8A2BE2;
	border-width: 1;
}	

tbody, td, tfoot, th, thead, tr {
    border-color: inherit;
    border-style: solid;
}
</style>

<body>
	<jsp:include page ="/header"/>	 

	<section class="lows">

		<!-- 최상단 롤링배너 영역 -->
		<div
			style="width: 100%; height: 100%; margin-right: auto; margin-left: auto;">
			<div
				style="width: 100%; height: 100%; background-color: rgb(7, 30, 54); float: left;">
				<div
					style="width: 100%; height: 100%; margin: auto; margin: 25px auto;">
					<div
						style="width: 1280px; height: 380px; list-style: none; margin-left: auto; margin-right: auto;">
						<div class="banner_sec1">
							<h1>
								 스프링부트 3.10
							</h1>
							<div method="get" action="/search" id="search2">
								<input type="text" size="20" placeholder="개인프로젝트 사용기술 ↕">
							</div>
							<ul>
								<a href="#self"><li>#gradle</li></a>
								<a href="#self"><li>#mybatis</li></a>
								<a href="#self"><li>#mysql</li></a>
								<a href="#self"><li>#jsp</li></a>
								<a href="#self"><li>#jquary</li></a>
								<a href="#self"><li>#json</li></a>
								<a href="#self"><li>#ajax</li></a>
								<a href="#self"><li>#lombook</li></a>
								<a href="#self"><li>#Security</li></a>
								<a href="#self"><li>#jstl </li></a>
								<a href="#self"><li>#tomcat </li></a>
								<a href="#self"><li>#se-taglibs </li></a>
								<a href="#self"><li>#swegger </li></a>
								
							</ul>
						</div>
						<div class="banner_sec2">
							<a href="#self">
								<div>
									<img src="data:image/png;base64,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">
								</div>
							</a>
						</div>

					</div>
				</div>
			</div>

		</div>
	</section>

	<div style="height: 50px;"></div>
	<section class="janso">

		<div class="janso_box">
			<div style="float: left">
				<span
					style="color: #8A2BE2; font-size: 20pt; position: relative; top: 10px; left: 50px; font-weight: bold;">
					경험 기술서
					</span>
			</div>
			<div style="text-align: right;">
				<button class="custom-btn btn-15"
					onclick="location.href='jangso.learnup.com' "
					style="background-color: #D1B2FF; border-radius: 5px; position: relative; top: 30px; right: 60px; font-size: 15px; font-weight: bold; padding: 5px 10px;">전체보기</button>
			</div>
		</div>

		<div class="link-boxd2">

			<div class="box-controll2">

				<div class="box-0d2" style="margin-left: 15px;">

					<p style="background-color: #8A2BE2; width: 100%; height: 100%;"></p>
					<div class="box-0-1d2" style="width: 1180px;">
						<!--
						<p style=" width: 100%; height: 100%;">
						 <img style="width: 100%; height: 100%;" src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRU8WhcNWFFeFiCbuJ-phfV1apGpeMioAT5Tw&usqp=CAU"> 
						</p>
						-->
						<h5>웹 어플리케이션 설명</h5>
						<table id="tables">
							<colgroup>
							<col width="250"><col width="1180">
							</colgroup>
							<thead>
								<tr><td style="height: 15px;"></td></tr>
								<tr>
									<th>목적:</th>
									<th>포트폴리용 게시판 구현</th>
								</tr>
							</thead>	
							<tbody>
								<tr>
									<td>사용한 기술 스텍:</td>
									<td>java , springboot , jsp jquary jstl , security, mybatis , lombook, tomcat , security_taglib</td>
								</tr>

								<tr><td style="height: 15px;"></td></tr>

								<tr>
									<td></td>
									<th>사용한 기술 스텍 역활:</th>
								</tr>
								<tr>
									<td>java</td>
									<td style="text-align: left;">객체 지향 프로그래밍을 지원하는 프로그래밍 언어로 자바로 서비스 로직을 작성하여 서버에서 해당 비즈니스 로직을 실행 <br>
										자바 언어로 Servlet을 작성하고 스프링의 DispatcherServlet을 이용하면, 웹 어플리케이션에서 서버와 통신하는 기능을 좀 더 효과적으로 활용<br>
										자바의 생태계와 라이브러리 활용
									</td>
								</tr>

								<tr><td style="height: 15px;"></td></tr>

								<tr>
									<td>springboot</td>
									<td style="text-align: left;">스프링 프레임워크 기반으로 만들어진 프레임워크로, 웹 어플리케이션을 쉽게 개발할 수 있도록 도와준다. <br>
										자동 구성 (Auto-Configuration): 스프링부트는 개발자가 별도로 설정해줘야 하는 많은 설정들 자동으로 처리<br>
										내장형 서버 기능을 제공합니다. 이를 통해 개발가 별도의 서버 설치 없이 웹 어플리케이션을 쉽게 실행<br>
										Actuator는 어플리케이션 운영 중 발생하는 다양한 정보들을 모니터링할 수 있게 해주는 기능제공<br>
										스프링부트는 스프링 프레임워크와 함께 빠르게 개발할 수 있도록 돕는 프레임워크이며, 다양한 기능들을 제공해 개발자가 더욱 효율적이고 안정적인 웹 어플리케이션을 개발할 수 있도록 지원
									</td>
								</tr>

								<tr><td style="height: 15px;"></td></tr>

								<tr>
									<td>lombook</td>
									<td style="text-align: left;">자바 개발에서의 번거로운 코드 작성을 단순화하기 위한 라이브러리. <br>
										Getter/Setter 자동 생성 , 생성자 자동 생성, <br>
										Builder Pattern 생성:ombok은 @Builder 어노테이션을 사용하여 코드에서 빌더 패턴을 자동으로 생성<br>
										@ToString, @EqualsAndHashCode와 같은 어노테이션을 사용하여 toString(), equals(), hashCode() 메소드를 자동으로 추가<br>
									</td>
								</tr>

								<tr><td style="height: 15px;"></td></tr>

								<tr>
									<td>tomcat</td>
									<td style="text-align: left;">톰캣은 Apache HTTP Server나 IIS와 같은 웹 서버와 결합하여
										자바 Servlet, JSP과 같은 동적인 웹 페이지를 생성하는 서비스를 제공<br>
										(Servlet)과 관련된 기능을 지원하는 컨테이너이며, 서블릿 컨테이너를 이용해 JSP를 컴파일하고, Servlet을 실행 <br>
										SSL(Secure Sockets Layer) 프로토콜을 지원하여, 보안 기능을 제공
									</td>
								</tr>

								<tr><td style="height: 15px;"></td></tr>

								<tr>
									<td>jsp</td>
									<td style="text-align: left;">JSP(Java Server Pages)는 웹 애플리케이션 서버에서 서버 측에서 동작하는 스크립트 언어입니다.<br>
										SP는 웹 페이지에 Java 코드를 삽입할 수 있으며, HTML, CSS, JavaScript와 같은 요소들과 함께 작성하여 동적인 웹 앱을 개발가능<br>
										Java의 기능들과 함께 이식성, 유지 보수의 용이성, 대용량 데이터 전송가능<br>
									</td>
								</tr>

								
								<tr><td style="height: 15px;"></td></tr>

								<tr>
									<td>jQuery</td>
									<td style="text-align: left;">jQuery를 사용하여 HTML 요소들의 속성 변경, 동적으로 요소 생성 및 제거, 이벤트 핸들링, AJAX 호출 등 다양한 웹 개발 기능을 구현<br>
									</td>
								</tr>

								<tr><td style="height: 15px;"></td></tr>

								<tr>
									<td>jstl</td>
									<td style="text-align: left;">JSP에서 자주 사용되는 로직 처리를 간편하게 하기 위해 만들어진 라이브러리입니다.<br>
										 JSTL은 JSP 페이지에서 자바코드를 대신하여, XML과 다르게 사용되는 태그를 이용해 반복문, 조건문, 변수 처리 등을 쉽게 처리<br>
										 SP에서 반복문 구문 등을 사용할 때 보다 간단하고 가독성이 좋게 작성<br>
									</td>
								</tr>

								<tr><td style="height: 15px;"></td></tr>

								<tr>
									<td>json</td>
									<td style="text-align: left;">JSP에서 자주 사용되는 로직 처리를 간편하게 하기 위해 만들어진 라이브러리입니다.<br>
										 JSTL은 JSP 페이지에서 자바코드를 대신하여, XML과 다르게 사용되는 태그를 이용해 반복문, 조건문, 변수 처리 등을 쉽게 처리<br>
										 SP에서 반복문 구문 등을 사용할 때 보다 간단하고 가독성이 좋게 작성<br>
									</td>
								</tr>
							</tbody>

						
						</table>
						

						<p style="height: 250px;"></p>

					</div>
				</div>
			</div>
		</div>
	</section>
</body>
<script type="text/javascript">


	$(function() {
		for (let i = 1; i <= 4; i++) {

			$("#tab-" + i).mouseover(function() {

				var a = $(this).closest('span').attr('id');
				console.log(a);

				$(this).css("scale", "calc(1.1)")
				$(this).css("transition", "all ease 1s")
				$(this).css("transform", "translate(0px, -3px)")

			});
			$("#tab-" + i).mouseleave(function() {

				$(this).css("scale", "calc(1)", "z-index", "1")
				$(this).css("transform", "translate(0px, 0px)")

			});

		}
		for (let i = 1; i <= 4; i++) {

			$("#talent-" + i).mouseover(function() {

				var a = $(this).closest('span').attr('id');
				console.log(a);

				$(this).css("scale", "calc(1.1)")
				$(this).css("transition", "all ease 1s")
				$(this).css("transform", "translate(0px, -3px)")

			});
			$("#talent-" + i).mouseleave(function() {

				$(this).css("scale", "calc(1)", "z-index", "1")
				$(this).css("transform", "translate(0px, 0px)")

			});

		}

	});
</script>


</html>