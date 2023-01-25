<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="css/side.css?<%=new java.util.Date()%>" rel="stylesheet">
<style>
body {
	/*     background: url("imgs/bg/side-bg.jpg") no-repeat; */
	/* 	background: #0061f2 no-repeat ; */
}

.headerwrap {
	position: fixed;
	width: 1920px;
	height: 75px;
	top: 0%;
	left: 0%;
	background: #ffffff;
	display: inline-flex;
	align-items: baseline;
	box-shadow: 0px 0px 20px 0 rgba(0, 0, 0, 0.2);
}

.noti {
	position: relative;
	top: 27%;
	left: 79%;
}

.meg {
	position: relative;
	top: 27.5%;
	left: 80.4%;
}

.modify a {
	color: #000;
}

.profile-icon{
	color: #000;
	position: relative;
	top: 21%;
	left: 90%;
}

.logout-icon a {
	color: #000;
}

.icon {
	font-size: 1.425rem;
}
.burger{
    position: fixed;
    left: 13.3%;
    top: 1%;
}
</style>
</head>
<body>
	<div class="">
		<div class="headerwrap">
<!-- 		<div class="burger"> -->
<!-- 			<ion-icon name="reorder-three-outline" class="nav__toggle" -->
<!-- 				id="nav-toggle"></ion-icon> -->
<!-- 		</div> -->
		<div>
			<a id="navbar" class="menu-trigger nav__brand" href="#">
			  <span></span>
			  <span></span>
			  <span></span>
			</a>
		</div>
<!-- 			<div class="mypage" style="margin-top: 20px;">반갑습니다 -->
<%-- 				${loginInfo.name}${loginInfo.position_name} 님</div> --%>
<!-- 			<div class="modify"> -->
<%-- 				<a onclick="location='modify.mypage?employee_id='+${loginInfo.employee_id }" --%>
<!-- 					class="">개인정보수정</a> -->
<!-- 			</div> -->
		<div class="noti">
			<a href="list.no"><img style="width: 25px;" src="imgs/icons/noti.png" alt="noti" /></a>
		</div>
		<div class="meg">
			<a href="receiveList.ap?employee_id=${loginInfo.employee_id }"><img style="width: 25px;" src="imgs/icons/meg.png" alt="meg" /></a>
		</div>
<!-- 			<ul class="profile-icon nav-start nav-btn nav-dropdown"> -->
<!-- 				<li> -->
<!-- 					<a href="#" class=""><img style="width: 40px;" src="imgs/icons/profile-icon.png" alt="profile-icon" /></a> -->
<!-- 					<ul class="hide submenu"> -->
<%-- 						<li><a onclick="location='modify.mypage?employee_id='+${loginInfo.employee_id }">개인정보수정</a></li> --%>
<!-- 						<li><a href="/">로그아웃</a></li> -->
<!-- 					</ul> -->
<!-- 				</li> -->
<!-- 			</ul> -->
		<div class="m-dropdown">
		  <div class="e-button open">
		 <div class="">
		  	 <p style="text-align: center; margin-top: 13px;"> ${loginInfo.name}${loginInfo.position_name}님</p>
		  </div>
		    <div class="e-burger">
		      <span></span>
		      <span></span>
		      <span></span>
		      <span></span>
		    </div>
		  </div>
		  <ul class="e-list hide" >
		    <li><a onclick="location='modify.mypage?employee_id='+${loginInfo.employee_id }">개인정보수정</a></li>
		    <li><a onclick='location="logout.mem"'>로그아웃</a></li>
		  </ul>
		</div>
		</div>
		
	</div>
	<script src="js/main.js"></script>
	
<script>

	const menuTrigger = document.querySelector('.menu-trigger');
	
	menuTrigger.addEventListener('click', (event) => {
	  event.currentTarget.classList.toggle('active-1');
	});
	
	
	$(".e-list").slideUp(function() {
		  $(".e-button").removeClass("open");
		});

		$(".e-button").on("click", function() {
		  if ($(this).hasClass("open")) {
		    $(".e-list").slideUp(function() {
		      $(".e-button").removeClass("open");
		    });
		  } else {
		    $(this).addClass("open");
		    setTimeout(function() {
		      $(".e-list").stop().slideDown();
		    }, 200);
		  }
		});
</script>
</body>
</html>