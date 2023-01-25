<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
<!-- CSS only -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="css/common.css?<%=new java.util.Date()%>" rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
	crossorigin="anonymous"></script>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link rel="stylesheet" href="https://unpkg.com/aos@next/dist/aos.css" />
<link
	href="https://fonts.googleapis.com/css2?family=Do+Hyeon&family=IBM+Plex+Sans+KR&family=Maven+Pro&family=Nanum+Gothic&family=Noto+Sans+KR:wght@500;700&display=swap"
	rel="stylesheet">
<link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
	
<style>

h1, h2, h3, h4, h5, h6 span {
	font-family: 'Noto Sans KR' !important;
}

p {
	font-family: 'IBM Plex Sans KR', sans-serif ! important;
}

.sec-text1 {
	position: absolute;
	top: 28%;
	left: 20%;
	animation: text1 1.5s;
}

.sec-text2 {
	color: #ffffff;
	position: absolute;
	top: 34%;
	left: 20%;
	animation: text2 3s;
}

.ask {
	position: absolute;
	top: 58%;
	left: 20%;
	color: #ffffff;
	animation: ask 3s;
}

.service {
	background: rgb(245, 247 ,250);
	width: 1903px;
	height: 1000px;
}

span.fi {
	display: none;
}

span.fi2 {
	display: none;
}

button.fi {
	display: none;
}

img.sec-image {
	display: none;
}

.sec-image {
	position: absolute;
	top: 30%;
	left: 60%;
	animation: img 3s;
}

.Inquire{
	display : none;
	animation : button 3s;
}
/* index keyframes */

@keyframes button {
 0%{
	left: 0%;
 }100% 

{
	left:22.8%;
	}
}

@keyframes text1 { 
0%{
	left: 0%;
}100%{
	left :20%;
	}
}	

@keyframes text2 {
 0%{
	left: 0%;
}100%

{
left:20%;
	}
}

@keyframes ask {
 0%{
	left: 0%;
}100%{
	left:20%;
	}
}

@keyframes img {
 0%{
	left: 70%;
}
100%{
	left: 60%;
	}
}
</style>
</head>
<body>
	<div style="height: 810px;" data-aos-offset="300px">
		<section class="sec-body">
			<span class="sec-text1 fi" style="font-size: 27px; color: #E0DCDC;">​
				모바일앱, 웹 어플리케이션제작</span><br /> <span class="sec-text2 fi2"
				style="font-size: 44px">기획부터 디자인, 개발까지<br /> 영문 네트워크에서<br />
				앱/웹 개발을 연구합니다
			</span>
			<div class="Inquire">
				<button class="button button-second" data-type="circle" >문의하기</button>
			</div>
			
			<img class="sec-image" src="imgs/icons/logo.png" alt="bodyimage" />
		</section>
	</div>
	
	<div class="center">
		<span style="font-size: 44px; font-family: 'Noto Sans KR' !important;">
		설명만 해주시면<br />현실을 만들수 있습니다
		</span>
	</div>
	
<section class="center sec-font">
	<!-- app01 -->
	<div class="app-03"  data-aos="fade-up" data-aos-anchor-placement="top-center">
		<div style="text-align: start;">
			<div class="applist">
				<img class="applist-logo" src="imgs/app/app04logo.png" alt="app01logo" />
				<h1>투어라이프</h1><br />
			</div>
			<div style="text-align: left; margin-left: 6px;">
				<span>
					투어라이프는 오디오 가이드를<br />
					온라인으로 구매하여 세계 어느<br />
					여행지에서나 오디오 투어 가이드를<br />
					제공하는 서비스입니다			
				</span>
			</div>
		</div>		
		<div class="">
			<img src="imgs/app/app04.webp" alt="app01" />	
		</div>
	</div>
	<div class="app-01"  data-aos="fade-up" data-aos-anchor-placement="top-center">
		<div style="text-align: start;">
			<div class="applist">
				<img class="applist-logo" src="imgs/app/app01logo.webp" alt="app01logo" />
				<h1>비치레슨</h1><br />
			</div>
			<div style="text-align: left; margin-left: 14px;">
				<span>비치레슨은 화상 솔루션을 통해<br />
					원격으로 음악레슨을 제공하는<br />
					온라인 서비스입니다						
				</span>
			</div>
		</div>		
		<div class="">
			<img src="imgs/app/app01.webp" alt="app01" />	
		</div>
	</div>
	
	<div class="app-03" data-aos="fade-up" data-aos-anchor-placement="top-center">
		<div style="text-align: start;">
			<div class="applist">
				<img class="applist-logo" src="imgs/app/app03logo.png" alt="app03logo" />
				<h1>마이스마일</h1><br />
			</div>
			<div style="text-align: left; margin-left: 6px;">
				<span>	
					마이스마일은 심리 상담 서비스에<br />
					대한 피드백과 느낀점을 공유하는<br />
					모바일 어플리케이션입니다		
				</span>
			</div>
		</div>		
		<div class="">
			<img src="imgs/app/app03.webp" alt="app03" />	
		</div>
	</div>
	<!-- app02 -->
	<div class="app-02" data-aos="fade-up" data-aos-anchor-placement="top-center">
		<div style="text-align: start;">
			<div class="applist">
				<img class="applist-logo" src="imgs/app/app02logo.webp" alt="app02logo" />
				<h1>셀링</h1><br />
			</div>
			<div style="text-align: left; margin-left: 12px;">
				<span>	
					셀링은 SNS 인플루언서에게<br />
					개인별 맞춤 스토어를 제공하고,<br />
					공급사와의 매칭 플랫폼을 제공하여<br />
					상품 판매 서비스를 제공하는<br />
					온라인 플랫폼입니다					
				</span>
			</div>
		</div>		
		<div class="">
			<img src="imgs/app/app02.webp" alt="app02" />	
		</div>
	</div>
	<!-- 	app03 -->
	
</section>
	
<!-- 	서비스영역 -->
	<section class="service center">
		<div style="display: flex;">
			<span
				style="font-size: 44px; margin-top: 145px; margin-left: 22rem; margin-bottom: 8rem;">서비스영역</span>
		</div>
		<div style="display: inline-flex;">
			<div class="service-list">
				<img src="imgs/service/11.webp" alt="모바일앱" />
				<p>모바일 앱 개발</p>
				<p>
					Android, IOS 동시<br /> 개발을 진행하여<br /> 고객의 개발 비용을<br /> 절감합니다
				</p>
			</div>
			<div class="service-list">
				<img src="imgs/service/12.webp" alt="웹서비스" />
				<p>웹 서비스 개발</p>
				<p>
					웹 기반 서비스에서<br /> 기업 소개 웹사이트까지<br /> 원하는 어떤 형태의<br /> 웹사이트도 개발할 수<br />
					있습니다
				</p>

			</div>
			<div class="service-list">
				<img src="imgs/service/13.webp" alt="UX/UI" />
				<p>UX/UI 디자인</p>
				<p>
					브랜드 가치를 높일 수<br /> 있는 모던 UI/UX를<br /> 디자인해 드립니다
				</p>
			</div>
			<div class="service-list">
				<img src="imgs/service/14.webp" alt="서비스상세" />
				<p>서비스 상세 기획</p>
				<p>
					아이디어는 있는데<br /> 구체적인 모습이<br /> 그려지지 않으시나요?<br /> 고객이 놓친 부분까지 찾아<br />
					구상 중인 서비스의<br /> 구체적인 형태를<br /> 만들어드립니다
				</p>
			</div>
		</div>
		<div class="service-span">
			<span>다양한 프로젝트 경험을 통해 검증된 프로세스로</span><br />
			<span>고객의 상상을 현실로 만들어드립니다</span>
		</div>
	</section>

<!-- 	프로세스영역 -->
<section class="center">
	<div class="process-title">
		<span>프로세스</span>
	</div>
		<div class="process-arrow" style="display: inline-flex;">
			<div class="process-list">
				<img src="imgs/process/15.webp" alt="" />
				<p>1. 컨설팅</p>
				<p>
					구상 중인 앱, 웹<br />
					서비스 제작 진행을 위해<br />
					무엇이 필요한지 무료로<br />
					안내해 드립니다
				</p>
			</div>
				<div>
					<img src="imgs/process/Arrow.webp" alt="Arrow" />
				</div>
			<div class="process-list">
				<img src="imgs/process/16.webp" alt="" />
				<p>2. 기획</p>
				<p>
					서비스에 구체적인 형태가<br />
					준비되지 않으셨거나,<br />
					부족한 점이 있으면<br />
					기획을 통해 보충합니다
				</p>
			</div>
				<div>
					<img src="imgs/process/Arrow.webp" alt="Arrow" />
				</div>
			<div class="process-list">
				<img src="imgs/process/17.webp" alt="" />
				<p>3. 디자인, 개발</p>
				<p>
					다양한 모바일, 웹 서비스를<br />
					개발해온 디자이너, 개발자가<br />
					귀사의 서비스를<br />
					제작합니다.
				</p>
			</div>
				<div>
					<img src="imgs/process/Arrow.webp" alt="Arrow" />
				</div>
			<div class="process-list">
				<img src="imgs/process/18.webp" alt="" />
				<p>4. 운영, 유지보수</p>
				<p>
					고객사 니즈에 맞는<br />
					서버 운영을 통해<br />
					높은 트래픽에도<br />
					안정적인 서비스를<br />
					운영합니다.
				</p>
			</div>
		</div>
		<p class="process-span">현재 프로젝트가 어떤 단계에 있어도 진행 가능합니다<br />
		언제든지 문의주세요</p>
	</section>
  <script src="https://unpkg.com/aos@next/dist/aos.js"></script>
  <script>
  	  AOS.init();
  	  AOS.init({
    	  disable: false, 
    	  startEvent: 'DOMContentLoaded',
    	  initClassName: 'aos-init', 
    	  animatedClassName: 'aos-animate',
    	  useClassNames: false, 
    	  disableMutationObserver: false, 
    	  debounceDelay: 0,
    	  throttleDelay: 200, 

    	  // Settings that can be overridden on per-element basis, by `data-aos-*` attributes:
    	  offset: 120,
    	  delay: 0,
    	  duration: 800, 
    	  easing: 'ease',
    	  once: false, 
    	  mirror: false, 
    	  anchorPlacement: 'top-bottom',
    	});
  </script>
  
	<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
	<script>
	
		$(document).ready(function() {
			$('span.fi').fadeIn(3000);
		});

		$(document).ready(function() {
			$('span.fi2').fadeIn(2000);
		});

		$(document).ready(function() {
			$('button.fi').fadeIn(2000);
		});

		$(document).ready(function() {
			$('img.sec-image').fadeIn(2000);
		});
		
		$(document).ready(function() {
			$('.Inquire').fadeIn(2000);
		});

	</script>
	<script src="js/header.js"></script>
</body>
</html>