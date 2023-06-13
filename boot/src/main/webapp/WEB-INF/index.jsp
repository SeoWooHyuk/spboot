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
<script src="js/index.js" type="text/javascript"></script>
</head>
<script type="text/javascript">
</script>

<style type="text/css">

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
								 스프링부트 3.10 개인 포트폴리오
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
									<li class="slideli"><img src="https://i.namu.wiki/i/vkGpBcmks1_NcJW0HUFa6jlwlM6h11B-8nxRRX4bYC703H4nLo7j4dQdRCC32gz8Q-BqRcAnQgFSXMjB8jPohg.svg" class="jansoimg" "></li>
									<li class="slideli"><img src="data:image/png;base64,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" class="jansoimg" "></li>
									<li class="slideli"><img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAXoAAACFCAMAAABizcPaAAAA81BMVEWHvj9VgDv///////6FvTuDvDf//f+JwD////xVgDxVgDmEvDmDvDW22pFTfjj9///6/PKZyV1PfDKMwEXw+ejD3qC004za6MbH362EukD7//qQwlC93ZRVgTVSfDt7rj3j7tF/uitvnztkkj1fjD2AtD90pjtolzevw6ZiiUqx14Wey2bt8+3R5Lapz3pfiUeuxJ/Az7i70LLE26JciTRKeSmDo3SVr4VrjlSBnXLV4dCiu5TK18Fxj16ft5e0x6N5nWbf59uv2HuTwlry+uH1/u6gynCaxGHQ4L3e78eqzHaRqn7L5qjj8N6vz4Hn+NjU3tOkexB7AAAQsklEQVR4nO1di1vaytMOm/uFJCThlhAkClqJYBWptPV4RC0eTkV///9f881sokKI1huVnm/fp0/NZUPIu5OZd2Y3geMYGBgYGBgYGBgYGBgYGBgYGBgYGBgYGBgYGBgYGBgYGBgYGBgY5iFn8NHf5/8JkOn69ubW1lYbAH92tjt1jtG/agDDne2dozB0VFPTVFUzNVULtfbWJtL/0d/uPww09y212VQLBSBe0wqFQvJHBbQ3Ox/9/f6zAIMH3oH2fKhqs73NLH8FkOWNtvk48Qmahc06I/+dIXe2NLVAfczjAO9vhszy3xVyfUf7hcHf+x1za4Nx/254jq+Z8/naJjP894HMbYKGfNrVLHJvbjGP/x4AZ9MshM8mHqE128zpvB1yvW2G4fNtHuGEmrbNuH8jgHnnuV5+3u41c5Nx/ybIHTBg8zXUaxBsGV4PuX6kgpp/OfVo9iHzOa+HXN96jbdJoGqM+zdgx3yVyad2X2h3GPevg7wNidSrqaeJ7Udfwh8KeUN9C/Fg94UmkzmvQ7uQp23y81pataf/5jeaGkutXgF5M2vzqukMh0Mn/06gu5xMX2nq0Udfxh8Iub6Uwjr7Xz4dHB58cXKMvnl4cPDpeAT9sngUy6xegZ3mggmrqvP1m08An4c5Nt+ku/ZOTXXR5zRDpnJeCLnTXHTqqjOi7BLyPYf6Qpju/LzocjRN3WHUvxBbmTqxpp2Qp6i3kp3+X87iUVrICsgvgtzJOm1nd49YxDo5/T7K8fWm+v307zGvWOR0ca9WUJm3fxHkzayudL4QhVifnaEZhsvFhTAE9fN1j/DkJBudzXb9o6/mj0K9vUT9MVEk/8xRtVxhj+5JPYHeGWeTAa3JSjkvACSyWX7NT8RS9nafKCBrzgGx+KUmYfOpQCvoomHowsO68HjT5I9uAER9vp0g0A+5w9xHi5mN9HSinv1M+FRo+2x6Vgl5x8xSr30i0tPUF5xDSv1Sp4WPeRzB4Ern3UajGweRKHCB67qBmzAguhRpQzdI1/TILXUb5XIxdo17io0g7jaK3ZLrzh0kCqXzRqMYJ0fCB2DLyI3p6eT0YDltbnBxsdFdi5uz3s5WLDXtl1b/CPVqQX3E44j18szmJUIk3+vdBMGtb9v2ZQlZEeIfsGz7raRh18O1ss71p54ioZJSvN6FQXcaFzWPKlvf9iiqQKYgdls2j+3SjV7Z4PRS0pL3vQE9WO/iOSqGcdPCT4313K/5WyFvLHsToF55FvWjpVDwiMYRLlrkAUqVm1IC+0iA3sVlntgBtjRqtEk/mEpzR1xOsKVR8WhTnr/bPnMFwe3xydb71jVD716SZB14vu0D90YRP68anf/AHcpaUL+5pGFeQP1SE/Uo3+pbRLqnhidVo0LgeFJGj6PXSJIoTGBNcC9x8UfAVeepJ96FzokThfhK8gl3m11OqBFe4efbklrUsCW4hPRskt0XU+q9c4/20XpQv7UsH9HhkPH+k9R/JpaUY/UFLS+r0iu8ogDVvk/dhT0xrigvUz0h21Is2FvBtRJtURX0PrCsKLaNtPIK+Qei5wyWLFKtDFoED7f8VpETYwIZhuXXKj3bUhL3NJnYSLzie5c+nFiRPFdIqFdsSVJ4y7LWgvp2DvUHSP2T9XvnO1y9/ddy75h5pWMdvYjCz+I47vY8MhWEOnUIXl0Asm3ojEsw/B54fr1PLRh6Qa+SVvn84iKu0i1eIMZ0oSVEUcnDG8Ur6QYnX9NuGERRNKC3RM01DPRuCmn9K3MxdBcEgmJKPd4F9O/k46mXOznDgto3uLJvOYnsHPU/CVhWTmEzt3wpUO+h3EQg+CK3Eguc+A9BIq9gqQ/G6pXRoUPMFK8l5A+2C/G5iCpSlD1qzBOjQXyeWBWDc7maBDeHjaYr0yDiBVy9HtCGU04soQMDUxddTg+oA/Nk8Y56ZVrs97vu48L2d0HeWMqa1OEIUlXpU1755oHhEV7G6XCp3/Kpx5jJK7VEZYO2BCFDqW+InDhAvibAlg2CR7yFPFq6RGaEVHxHVWrXleia+vhzEeMtZbErckLCtweqXXDTXjCuwZ1DIKGqyKBHKVdR4nAUvw9pgf7xNk/HZJdsfniKX/YnWrR5r/nnl7CRCncy+dZcmiXY3Mk5i35N73S+d8WlFy0EPprmNOK4KvwtBz/g/xtRCH6A5ybXiZbURSBJB+qtB+olDMZiBRf5hHoMDjNMmBLq7UC8xb/WVSQCohsaVbp31A+M30fu05C3mxmrdbQvY7iwMWh2zVF3C8mjPE5hP32qx9zfdTRo9hmkgvR538kkZM12zln0ioVRkfB2LZYT8iPUibxncAEudHX0/QNRP+cVuorJKOZE5UGtdplafZn+Ta2eUg/NgpmfKB2M11Lie3yq8ssNRLFG1yoJ9bxf+nhPkyKrLc2zw2826ohTB5j/+W12gCoGlsZ7h/sOMv99PP6E9WFtDy7FH58cL1Kv5VEvoI7nqdLzqzEtDBg9oMJSIHgCdX4c9YhvTQUDfT5vBwKnX5Rb9rxirETnqGCk6wiCdEtKHRQn9/A28fsRaE8aZquCi4GA+HcH0uBcTqgnrbVIYymy1DtfiST5ivW56ajOCC/lZIhb8UIOwdqdnz4o9FNHC52ve/TyDsJfUw9+4ZZaosLbxKoFKGW6CqqQSVShTgJM2lLATVexe1oGJ95cSnyqzFPqDbmF7NmV4CKx/1aSC0PSxEvelXvVouKyYbiEGngqaJQF6qvrRP2iwwHlYoEQPh2GmjYEAekTG6x6CCreksbgfCCV8iUyVsHlDEdjvD0y1Ju51HPixcAmEmpsMNIpcC8ENlLfMHooA13xBs7rx7KHnPUMMYZbj8ZH25v5tAsqhliBPMmSeO8HHikpN4nbroItwN0EPh+/+czV3SRFW0iz/gTqv9BvOhs5qjr8iYnJrKkVhseEBlUTUylIS0/wec7m39QhHCwW7c0w/0SCEZRBjWMqyUOmDx4HDNySehymRzUB1D0Qd0MTKqUrihh7Fcv/J5bluzBrcEbDeyDUbyTMC1zvIZmVPBCcLr0n/No8Jn8C9cldPhuFqml+I2TvGDy8uY9LqOLNES6NIBAMD5P7OkN9vsNBCGLQoDUYyC4vBM4AUelLl4EHXVkxMKeFLpgga14AtwSKGZAjhiAYU+rYKthdN3cenJ/174vD2ImpW+8FOoRbxU+Ujv4AQVw/6rcXmC+Yu19+niipCzf3j0+/UAWDS2cmDbij0+9nZkF1zvBKxqdfssWEJ2bjCPoVWChQoPRBz/dtCId2bIMbutIx6+JJtYjUVw0hTgoOEJHF+p2uB6u/uSSWXb29rfZugntpLtSgsVe9bfXKE6pdBY/eBZOFovw6Up+ZVhA6QwcHxe0z1DPOME2aNMdx0gbDId2DjfbOhk6Y8fW5cy+FlCg90d4KliyDW8xwyiA5URrqDSB4ho4fciH9nDoeD2uZIlWfSL0Qo6gaRGjo4sPARxlcIE1s9XQERLymB1Qf2gh3lcu1on4jo+shWQrPfGCAjnmr6l2yqyVPdOLYIEp9Zx9TosMhqM2MOs0dpyr2RTo+hc6B53m0ek4HnhULKzRV3BNj3bgFgdv/V9QntDxmlyBnigZWUtYxMCLzfDEy5seuhGBP4S0vmNuqxwqPNc4GHbjSRcMtuutIfWe5ZmzuziCwHTxdwznDguHxcCmbzZ+CVrUva+clVw5qPoo9O0Y7LGPMtIElTPkF18eMB8NMIAgXNlXm1yW3NLAlXrmjHvujWqboljiMsxAWYK91WUs2ngeGzmH5jCeS1YuDoDQp9jxyIawf9ZxcyHIP9n2C5bOlccMF6o9x0sLXMHvP5FcuqWAhtuf5WEYHM6d1+thOJGBSPI9onQtOfI2Gi7UAhfB7ICQlJbX6JBW41/p+64Y6mB52mZIWx6wfvQtRxwACUhP6ybYhD5H40lpSn1M0Ng/hCsfqk/X6T3SoZPlBFDNv8p+A+jDhDOQl5D+UM/D7IPQV3qcjrFGPrhGpSMeUsEafFOWt2gy3Q5gVej4djcJhKuwCH7nXLy5xhW6lI1W3YOIVG/yhlHYT/F9Ch4Mp2lpRv/PYKNXTQyWfHhmlyh0XRw+fim8Uj/0k6ArJWCBpJfXMbrJGI6bgVpO6OphsTS8nYVaXJ6358SgFZaiguxV7bkCLJ1bPwBFeidzdH7AUYGeundVv53icZ1D/2ADhVu619ae2nZqgNwhS1WfgSDUgqVOC06aj47f0HhDcAU3YeK/CiTGOlN8Yk1vfInMAJwO3QsOzFsYHIZK4Akip8sxPO9ur9gUQlzgQr0zXifqO1syZkUCeNyMh20Rz8ofFxciNi4PBoFy5n5wBcEsU6RF6snY3KcQIKoNa+dzFfglwe4yjCJLXw+S0V/1BCzY1sYHDiP5tsrUlUZdzRetzRqlbrg0GRTijSE8Ww6cEq2XzhdjKm4fzTOqXjnz80RI6nckwFgYpFqYxZdZAiBp3M6ZQIyaRoepGkaiLURRjgZ/0YgiwvFUUIgM2GmJSV5ukulNcmEG1+OnrAHlz6R0s6YyEp97NgtQv946mrmzSpQ4JriLZF3ryJhIhamFlp0fDwDTZaMicq2CV6Gq9GH4UcmdpSisd8wb58tTMP0hmlfEy9SubYS9OUPPvpXGizgUeluyLPUp9JCYboz7ITN4P/hDq0eNkqf+JWvDn0uNSdzBNpzAG+1qS/qq2sudK0OqTgpoogiO5mKLKtEuUem8CPkiEGNL3UGe21mYM8FeQt5es/gwnzXz72t7dz0mrmtpue/QZr/Ewm/A2V/fwrHDh0SJ9r/Lv5Kb8j2fxii9No4qCgdWr3Uz+valVfRz4sit/DPVcPZtVafszmv3secd5j7Fpsz06nZF8ze5d5fObYo3QeSIYbAkdfSKXgXhxa9ESvqXgOGEyGLAO0w2eCXm7mYmozim9OEK+51HvWElq/7/dzNjg6oIsh7q/SqsOcG6ep3WDVkkEzU+Vjs9jBiXhdNqy/sd4ekSYmdShOQcKiEcl+8hOsrNp4XAhGf+VeZ6n2VzpQ8uCMPD4+7zVnnZpJVovTW0i3WWtXu0qWuFXeH/I24vxUtVC8/hkb2/PznuMTTNhz97479EwMz618tckGEG3Vm21WtVpr1iS05xYF+JGD7beTqeDfrAWk5teAvko8wih6jjh/mh0tpQzYcc4f41GuyHoH3NeAWkr9fQJRDpE4uIDI3MU0xUcbRHX42GRFwG0/fIrz0xzkdvFPdlbQdPyB0kYfoHlpwhfCGD+0fFwhidRbz85MvIM6tmLQV6JnHLCi6Ca7LHN10Lefu6bjPNsvqDmTTBmeB7e5O5V9nrdt0DeVl9r9+oRY/5NkHfM170ATWPMvxmbr3nVpdpkzL8dr4q16hZ7hf17oHOkvuD19QUtNNn7jN8Jcn1Lzc5QeIL5QjPc/uiv/J+BzG2GzaW3WD6CZshE5XtC7myFmtr85S/0mAXziKWw7wtZ7hyZ+S+AmmNea7KfiFkBZHljR2s28QVcyzMy1Sb9eZj2NvM1K4HMdXaOTPwJwux7GLUw1MDHs18DWx1krr6xc4S/oTFXX1BxmCTc2mQ/vbliyHK9s7lz1EYVaeIvC6hhe2tzo85+8Pd3gP6wcr2zsbG9sbHRqbPfWf7dYD9uzcDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMCwevwfPBp/X1k76A0AAAAASUVORK5CYII=" class="jansoimg" "></li>
									<li class="slideli"><img src="data:image/png;base64,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" class="jansoimg" "></li>
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
				&nabla; /main 페이지 : 역활 : 사용기술 소개  <br>
				(배너) 제이쿼리 사용 오토슬라이드 기능 구현 <br>
				(탭바) 제이쿼리 사용 탭바 기능 구현   <br>
				탭바: 구성내용 기술스텍(전체)  html table 사용 <br>

				<pre> </pre>
				&nabla; /header 페이지 / 역활 : 웹 페이지를 구성하는 데 필요한 정보를 제공 <br>
				사용 기술 -부트스트랩 사용 <br>

				<pre> </pre>
				&nabla; /footer 페이지 / 역활 :사이트의 정보, 저작권, 개인정보처리방침 등과 같은 정보를 제공 <br>

				<pre> </pre>
				&nabla; /view/** (게시판)페이지 / 기본적인 게시판으로서 유저가 직접 사용하는 영역 <br>
				html table  ajax 사용

				<pre> </pre>
				&nabla; /join (회원가입)페이지 / 사이트의 회원등록 <br>
				사용기술 -다음주소 api사용 


				
			
				
			
				


				
			</div>

			<div id="tab-4" class="tab-content"> 
				<h1>모든 작업은 의도와 의미가 중요 </h1>
				문서작업에대하여 기록 !  계획 설계 문서 작업 업무진척 오류 그런것들 기록 <br>
				어떤 햡력툴을 사용해왔고 업무에대한 조율 팀원들 마찰 힘든점 
				그리고 페이지마다 기획의도 작업 <br>

				토론이라는 공간과 개념 기능이 있어야한다. 이런것들이 완성되고 보강해야한다.<br>

				해볼것 실제 결제기능 구현해보기 마일리지 정책 구현 discount 가능까지구현해보기<br>
				
				각데이터들을 가져오는 방법! 업소에대한 정보! 공공 api 활용! 이걸db화하고 이걸직접 로직구현 노출 연습 <br>

				슬라이드 이미지 노출 기준 이런걸잡는다!! 최신항목 등 기본순 고가순 저가순 등 제일중요한건 검색기능!! <br>

				카테고리를 나눈 기준! 사용자 입장 기준  대중소 카테고리로 나눈다! <font style="color: red;"> 기준</font> !!! <br>

				비회원 로그인 예약 구현  해보기!!!! 비로그인 예약시스템 기준점과 로직이달라서 고민해보기 <br>

				<font style="color: red;">무슨기능을넣었을때 사용한이유 설명해보기 </font> <br>

				썸네일 사용 db컬럼 하나더만들어놈 썸네일 메인이미지 썸네일 구분하면 db페이지에서 구분가능 기준점이나 로직이나 방향 생각해본게있냐  <br>

				인스타같은방식은 	<font style="color: red;">무한스크롤방식가다가 자료가없으면 끊김형식 </font> <br>
				

				api업체들이 직접등록했을때 그런이점 db에넣고 매칭해서 이름이중복되는 업체만 보여줘라 구현 해보기  <br>

				그래프작업을할때는 그래프 선의 의미 의도 

				
			</div>

			<div style="height: 50px;"></div>

	
		</section>

		<jsp:include page ="/footer"/>	 

		
</body>
</html>