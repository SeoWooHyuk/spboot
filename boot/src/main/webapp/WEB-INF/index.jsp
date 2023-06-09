<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>스프링부트 메인페이지</title>
<link rel="stylesheet" type="text/css" href="css/index.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;400&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Roboto&display=swap" rel="stylesheet">
</head>
<script type="text/javascript">

	// 탭바 스크립트
$(document).ready(function(){
	  
	$('ul.tabs li').click(function(){
		var tab_id = $(this).attr('data-tab');

		$('ul.tabs li').removeClass('current');
		$('.tab-content').removeClass('current');

		$(this).addClass('current');
		$("#"+tab_id).addClass('current');
	})
	  
})

$(document).ready(function(){

	$(function(){        
		var slideCount = $('.slider ul li').length;
		var slideWidth = $('.slider ul li').width();
		var slideHeight = $('.slider ul li').height();
		var sliderUlWidth = slideCount * slideWidth;
		
		$('.slider').css({ width: slideWidth, height: slideHeight });
		
		$('.slider ul').css({ width: sliderUlWidth, marginLeft: - slideWidth });
		
		$('.slider ul li:last-child').prependTo('slider ul');

		function moveLeft() {
			var slideWidth1 = $('.slider ul li').width();
			$('.slider ul').stop().animate({
				left: + slideWidth1
			}, 500, function () {
				$('.slider ul li:last-child').prependTo('.slider ul');
				$('.slider ul').css('left', '');
			});
		};

		function moveRight() {
			var slideWidth1 = $('.slider ul li').width();
			$('.slider ul').stop().animate({
				left: - slideWidth1
			}, 500, function () {
				$('.slider ul li:first-child').appendTo('.slider ul');
				$('.slider ul').css('left','');
			});
		};

		//버튼 보이기 안보이기
		$(".control_next").hide();
    	$(".control_prev").hide();
		
		$(".control_next").stop().click(function () {
				moveRight();
		});
		
		$(".control_prev").stop().click(function () {
				moveLeft();
		});


		
		$(".banner_sec2").children().hover(function () { 
      
			$(this).children(".control_next").show(function () {
            var hover_in = "#"+$(this).closest('div').attr('id');
            $(hover_in).children(".control_next").stop().click(function () {
                moveRight(hover_in);
            });
        });

        $(this).children(".control_prev").show(function()
        {
            var hover_in = "#"+$(this).closest('div').attr('id');
            $(hover_in).children(".control_prev").stop().click(function () {
                moveLeft(hover_in);
            });
        });  

            
        }, function() {
          
            $(this).children(".control_next").hide();
            $(this).children(".control_prev").hide();
           
        });
  
    
	function run() {
	return  setInterval(function () {
	moveRight()
	 }, 1000);
  };

	let runs =  run();
	
	$("#slider").stop().mouseover(function()
	{
	clearInterval(runs);   
	});

	$("#slider").mouseleave(function()
	{
		runs =  run();
	}); 

	});

});







</script>

<style type="text/css">
#tables
{
	text-align: center;
}	

tbody, td, tfoot, th, thead, tr {
    border-color: inherit;
    border-style: solid;
}


.slider   {
    position: relative;
    overflow: hidden;
    border-radius: 10px;
    border-width: 0.5px;
    
  }
  
.slider ul {
  position: relative;
  margin: 0;
  padding: 0;
  height: auto;
  list-style: none;
}
  
.slider ul li {
   position: relative;
   display: block;
   float: left;
   margin: 0;
   padding: 0;
   width: 565px;
   height: 400px;
   z-index: 1;
}

.slider
{
  z-index: 2;

} 

.slider ul li image
{
    width: 100%;
    height: 100%;
}


/* 슬리아드버튼 */
a.control_prev, a.control_next {
    position: absolute;
    top: 40%;
    z-index: 999;
    display: block;
    padding: 4% 3%; 
    background: #D5D5D5;
    color: #fff;
    text-decoration: none;
    opacity: 0.7;
    cursor: pointer;
  }
  
  a.control_prev:hover, a.control_next:hover {
    opacity: 0.9;
  }
  
  a.control_prev {
    border-radius: 0 5px 5px 0;
  }
  
  a.control_next {
    right: 0;
    border-radius: 5px 0 0 5px;
  }

  a.control_prev:focus {
    border-radius: 0 2px 2px 0;
    outline: none;
  }

  a.control_next:focus {
    right: 0;
    border-radius: 2px 0 0 2px;
    outline: none;
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
							<!-- <a href="#self">
								<div>
									<img src="data:image/png;base64,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">
								</div>
							</a> -->

							<div id="slider" class="slider" >
								<a class="control_next">></a>
								<a class="control_prev"><</a> 
								<ul>	
							   
									<li class="slideli"><img src="data:image/png;base64,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" class="jansoimg" "></li>
									<li class="slideli"><img src="" class="jansoimg" "></li>
									<li class="slideli"><img src="" class="jansoimg" "></li>
									<li class="slideli"><img src="" class="jansoimg" "></li>
									<li class="slideli"><img src="" class="jansoimg" "></li>
								  </ul> 
							  </div>

						
						</div>

					</div>
				</div>
			</div>

		</div>
	</section>

	<div style="height: 50px;"></div>
		<section class="janso">
			<div style="color: #8A2BE2; font-size: 20pt; font-weight: bold; padding-left: 25px;">
				경험 기술서 (개인 포트폴리오)
			</div>
			<div style="height: 50px;"></div>
				
			<div class="local">
				<ul class="tabs">
					<li class="tab-link current" data-tab="tab-1">기술 스텍(전체)</li>
					<li class="tab-link" data-tab="tab-2">개발 환경 정보</li>
					<li class="tab-link" data-tab="tab-3">Frontend 기술스텍</li>
					<li class="tab-link" data-tab="tab-4">Backend 기술스텍</li>
					<li class="tab-link" data-tab="tab-4">미래에 따른 계획 및 발전 가능성</li>
				</ul>
			</div>

			<div id="tab-1" class="tab-content current"> 
				
				<table id="tables">
					<colgroup>
					<col width="250"><col width="1180">
					</colgroup>	
					<tbody>
						<tr>
							<td><font style="font-weight: 900;">사용한 기술 스텍:</font></td>
							<td ><font style="font-weight: 700;">java , springboot , jsp jquary jstl , security, mybatis , lombook, tomcat , security_taglib</font></td>
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
							<td>json</td>
							<td style="text-align: left;">JSP에서 자주 사용되는 로직 처리를 간편하게 하기 위해 만들어진 라이브러리입니다.<br>
								 JSTL은 JSP 페이지에서 자바코드를 대신하여, XML과 다르게 사용되는 태그를 이용해 반복문, 조건문, 변수 처리 등을 쉽게 처리<br>
								 SP에서 반복문 구문 등을 사용할 때 보다 간단하고 가독성이 좋게 작성<br>
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
							<td>security-taglibs</td>
							<td style="text-align: left;">JSP에서 자주 사용되는 로직 처리를 간편하게 하기 위해 만들어진 라이브러리입니다.<br>
								 JSTL은 JSP 페이지에서 자바코드를 대신하여, XML과 다르게 사용되는 태그를 이용해 반복문, 조건문, 변수 처리 등을 쉽게 처리<br>
								 SP에서 반복문 구문 등을 사용할 때 보다 간단하고 가독성이 좋게 작성<br>
							</td>
						</tr>

						<tr><td style="height: 15px;"></td></tr>
						<tr>
							<td>lombook</td>
							<td style="text-align: left;">"security-taglibs"는 Spring Security를 사용하여<br>
								 Web 페이지에서 로그인, 권한 부여 등의 보안 규칙을 구현할 수 있도록 도와줍니다. 
								 라이브러리에는 Spring으로 작성된 보안 규칙 태그와 함수가 있으며, 다양한 기능을 제공합니다.
							</td>
						</tr>

						<tr><td style="height: 15px;"></td></tr>
						<tr>
							<td>commons-io</td>
							<td style="text-align: left;">Java에서 파일, 디렉토리, 스트림 등과 같은 I/O 기능을 쉽게 다룰 수 있도록 다양한 유틸리티 메소드를 제공하는 라이브러리입니다.<br>
								"commons-io"에는 다양한 유틸리티 메소드가 있는데,표적인 것들은 아래와 같습니다.<br>
								파일 처리: 파일 복사, 파일 삭제, 파일 크기, 확장명과 경로 추출 등 파일 처리 관련 메소드. <br>
							</td>
						</tr>

						<tr><td style="height: 15px;"></td></tr>
						<tr>
							<td>springdoc-openapi</td>
							<td style="text-align: left;">Spring Boot와 스웨거(Swagger)를 결합한 오픈 소스 프로젝트입니다. <br>
								이 라이브러리는 API 문서를 자동으로 생성하여 관리, 문서화, 게시하도록 지원합니다. <br>
								"springdoc-openapi"는 OpenAPI 3.0을 지원며, Spring Boot와 스웨거를 연동함으로써 RESTful API를 문서화하고 관리할 수 있도록 도와줍니다. <br>
								이를 사용하면 Swagger UI를 통해 API 명세서(API Specification)를 쉽게 확인할 수 있습니다.
							</td>
						</tr>

						<tr><td style="height: 15px;"></td></tr>
						<tr>
							<td>Security</td>
							<td style="text-align: left;">Security는 Spring Framework에서 제공하는 보안 모듈로,<br>
								 웹 애플리케이션에서 인증(Authentication)과 인가(Authorization)를 수행
							</td>
						</tr>

						
					</tbody>
				</table>


			</div>

			<div id="tab-2" class="tab-content"> 
				<table id="tables">
					<colgroup>
					<col width="250"><col width="1180">
					</colgroup>	
					<tbody>
						<tr>
							<td><font style="font-weight: 900;">개발 환경정보</font></td>
						</tr>

						<tr><td style="height: 15px;"></td></tr>

						<tr>
							<td>개발 언어</td>
							<td style="text-align: left;">JAVA</td>
						</tr>

						<tr><td style="height: 10px;"></td></tr>
						<tr>
							<td>개발 도구</td>
							<td style="text-align: left;">Vs-code , Git , Gradle</td>
						</tr>

						<tr><td style="height: 10px;"></td></tr>
						<tr>
							<td>운영체제</td>
							<td style="text-align: left;">Windows 10</td>
						</tr>


						<tr><td style="height: 10px;"></td></tr>
						<tr>
							<td>Framework</td>
							<td style="text-align: left;">Spring Boot(3.1.0) , jquary(3.4.1) , Bootstrap </td>
						</tr>

						<tr><td style="height: 10px;"></td></tr>
						<tr>
							<td>JDK</td>
							<td style="text-align: left;">17.0.7</td>
						</tr>

						<tr><td style="height: 10px;"></td></tr>
						<tr>
							<td>Apache Tomcat</td>
							<td style="text-align: left;">10.1.8</td>
						</tr>

						
						<tr><td style="height: 10px;"></td></tr>
						<tr>
							<td>Template Page</td>
							<td style="text-align: left;">JSP</td>
						</tr>

						<tr><td style="height: 10px;"></td></tr>
						<tr>
							<td>DATABASE</td>
							<td style="text-align: left;">MYSQL + MYBATIS</td>
						</tr>

						<tr><td style="height: 10px;"></td></tr>
						<tr>
							<td>Library</td>
							<td style="text-align: left;">Security(6.1) , spring-security-taglibs(6.1) , jstl(2.0.0) , JSON(20230207) ,commons-io(2.12) , springdoc-openapi(2.1.0) , lombok</td>
						</tr>
					
					</tbody>
				</table>



				
			</div>

			<div id="tab-3" class="tab-content"> 
				포폴 사이트 <br>
				메인 페이지: 주기능 탭바 

				
			</div>

			<div id="tab-4" class="tab-content"> 


				
			</div>

			<div style="height: 50px;"></div>

	
		</section>

		<jsp:include page ="/footer"/>	 

		
</body>
</html>