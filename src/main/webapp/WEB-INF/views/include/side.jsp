<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<link href="css/common.css?<%=new java.util.Date()%>" rel="stylesheet">
<link href="css/side.css?<%=new java.util.Date()%>" rel="stylesheet">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<style>

.ul-nav {
	margin-bottom: 0 !important;
}
.logout{
    column-gap: 0.75rem;
    padding: 0.65rem;
    color: var(--white-color);
    border-radius: 0.5rem;
    margin-bottom: 1rem;
    transition: .3s;
}
.submenu ion-icon{
	margin-top : 3px;
}
</style>

<body id="body-pd">
	<div class="l-navbar" id="navbar">
		<nav class="nav">
			<div>
				<div class="sidebar-logo">
					<div class="nav-img">
						<img src="imgs/icons/icon.png" alt="logo" />
					</div>
					<div style="width : 150px;">
						<a href="/berp" class="nav__logo">YM NetWork</a>
					</div>
				</div>
					
				<ul class="ul-nav">
					<li class="">
						<div class="nav__list">
							<div class="side-menu">
								<a href="list.no" class="nav__link  nav-start"> 					
									<ion-icon name="home-outline" class="nav__icon"></ion-icon>
									 <span class="nav_name">홈으로</span>
								</a>
							</div>
						</div>
					</li>
				</ul>
				<ul class="ul-nav">
					<li class="">
						<div class="nav__list">
							<div class="side-menu menubar">
								<a href="#" class="nav__link"> 
									<ion-icon name="server-outline" class="nav__icon"></ion-icon> 
									 <span class="nav_name">근태관리</span>
								</a>
								<ul class="submenu hide">
									<li><ion-icon name="chevron-forward-outline"></ion-icon><a href="holiday">휴무관리</a></li>
									<li><ion-icon name="chevron-forward-outline"></ion-icon><a href="work">출/퇴근관리</a></li>
									<c:if test="${loginInfo.admin eq 'Y' }">
									<li><ion-icon name="chevron-forward-outline"></ion-icon><a href="workList">전체사원 근태관리</a></li>
									</c:if>
								</ul>
							</div>
						</div>
					</li>
				</ul>
				<ul class="ul-nav">
					<li class="">
						<div class="nav__list">
							<div class="side-menu menubar">
								<a href="#" class="nav__link nav-start"> 
									<ion-icon name="file-tray-full-outline" class="nav__icon"></ion-icon> 
									 <span class="nav_name">전자 결재</span>
								</a>
								<ul class="submenu hide">
									<li><ion-icon name="chevron-forward-outline" class="sub-arrows"></ion-icon><a onclick='location="receiveList.ap?employee_id=${loginInfo.employee_id}"'>수신함</a></li>
									<li><ion-icon name="chevron-forward-outline"></ion-icon><a onclick='location="submitList.ap?employee_id=${loginInfo.employee_id}"'>상신함</a></li>
									<li><ion-icon name="chevron-forward-outline"></ion-icon><a onclick='location="approvalList.ap?employee_id=${loginInfo.employee_id}"'>결재함</a></li>
									<li><ion-icon name="chevron-forward-outline"></ion-icon><a onclick='location="lockerList.ap?employee_id=${loginInfo.employee_id}"'>임시 보관함</a></li>
								</ul>
							</div>
						</div>
					</li>
				</ul>
				<c:if test="${loginInfo.admin eq 'Y' }">
					<ul class="ul-nav">
						<li class="">
							<div class="nav__list">
								<div class="side-menu">
									<a href="list.hr" class="nav__link  nav-start"> 
										<ion-icon name="person-circle-outline" class="nav__icon"></ion-icon> 
										 <span class="nav_name">인사관리</span>
									</a>
									<!-- <ul class="submenu hide">
										<li><a href="list.hr">사원조회</a></li>
										<li><a href="#">submenu02</a></li>
										<li><a href="#">submenu03</a></li>
										<li><a href="#">submenu04</a></li>
										<li><a href="#">submenu05</a></li>
									</ul> -->
								</div>
							</div>
						</li>
					</ul>
				</c:if>
				<ul class="ul-nav">
					<li class="">
						<div class="nav__list">
							<div class="side-menu menubar">
								<a href="#" class="nav__link  nav-start"> 
									<ion-icon name="server-outline" class="nav__icon"></ion-icon> 
									 <span class="nav_name">급여관리</span>
								</a>
								<ul class="submenu hide sub-A">
									<li><ion-icon name="chevron-forward-outline"></ion-icon><a href="mySalary.sa?employee_id=${loginInfo.employee_id }">나의 급여보기</a></li>
									<c:if test ="${loginInfo.admin eq 'Y' }">
									<li><ion-icon name="chevron-forward-outline"></ion-icon><a href="list.sa">사원 급여정보</a></li>
									</c:if>
								</ul>
							</div>
						</div>
					</li>
				</ul>
				<c:if test="${loginInfo.admin eq 'Y' }">
				<ul class="ul-nav">
					<li class="">
						<div class="nav__list">
							<div class="side-menu menubar">
								<a href="#" class="nav__link  nav-start"> 
									<ion-icon name="chatbubbles-outline" class="nav__icon"></ion-icon>
									 <span class="nav_name">채용관리</span>
								</a>
								<ul class="submenu hide">
									<li><ion-icon name="chevron-forward-outline"></ion-icon><a href="applicantList.apply">지원자 확인</a></li>
									<li><ion-icon name="chevron-forward-outline"></ion-icon><a href="pass_check.apply">합격자 확인</a></li>
									
								</ul>
							</div>
						</div>
					</li>
				</ul>
				</c:if>
				<c:if test="${loginInfo.admin eq 'Y' }">
				<ul class="ul-nav">
					<li class="">
						<div class="nav__list">
							<div class="side-menu">
								<a href="common.cd" class="nav__link nav-start"> 
									<ion-icon name="settings-outline" class="nav__icon"></ion-icon> 
									 <span class="nav_name">공통코드관리</span>
								</a>
							</div>
						</div>
					</li>
				</ul>
				</c:if>
			</div>
		</nav>
	</div>
	<!-- IONICONS -->
	<script src="https://unpkg.com/ionicons@5.5.2/dist/ionicons.js"></script>
	<!-- JS -->
	<script src="js/main.js"></script>
	
	<script>
	
	$(document).ready(function() {
	    $(".menubar").click(function() {
	        $(this).children(".submenu").stop().slideDown(500);
	    });
	    $(".menubar").mouseleave(function() {
	        $(this).children(".submenu").stop().slideUp(300);
	    });
	});
	
	
// 	let subToggle=true;
// 	$(".menubar").click(()=>{
// 	  if(subToggle){
// 	    $(".submenu").slideDown(1000);
// 	  }else{
// 	    $(".submenu").slideUp(1000);
// 	  }
// 	  subToggle=!subToggle;
// 	});
	
	
// 	const menu=document.querySelector(".menubar");
// 	const subBar=document.querySelector(".menubar>.nav-start");

// 	let subToggle=true,i=0;

// 	function slide_menu(){
// 	  if(subToggle){
// 	    subBar.style.display="block";
// 	    subBar.classList.remove("up");
// 	    subBar.classList.add("down");
// 	    subToggle=!subToggle;
// 	  }else{
// 	    subBar.classList.remove("down");
// 	    subBar.classList.add("up");
// 	    subToggle=!subToggle;
// 	  }
// 	  console.log(subBar.classList);
// 	}
// 	menu.addEventListener("click",slide_menu);
	
// 	menu.addEventListener("click",slide_menu);
//      $(document).ready(function(){
//         // menu 클래스 바로 하위에 있는 a 태그를 클릭했을때
//         $(".nav-start").click(function(){
//         	  $(this).next("ul").slideDown(600);
//         });
//     });
   
//      const button = document.querySelector('.nav-btn');

//      button.addEventListener('click', () => {
//        const dropdown = document.querySelector('.nav-dropdown');
//        dropdown.style.display = 'block';
//      });

//      button.addEventListener('blur', () => {
//        const dropdown = document.querySelector('.nav-dropdown');
//        dropdown.style.display = '';
//      });
     
//      button.addEventListener('blur', () => {
//     	  const dropdown = document.querySelector('.nav-dropdown');
//      });
  
     
    	  // 0.2초 뒤에 실행
//     	  setTimeout(() => {
//     	    dropdown.style.display = '';
//     	  }, 200);
</script>
</body>
</html>
