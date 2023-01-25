<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix='c'%>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css" />
<link type='text/css' rel='stylesheet' 
	href='https://cdnjs.cloudflare.com/ajax/libs/c3/0.7.20/c3.min.css'>
<style>

.header-nav {
	display: inline-flex;
	padding-top: 10px;
	font-size: 16px;
	font-weight: bold;
	align-items: center;
	margin-bottom: 0.5rem;
	margin-left: 60px;
	margin-right : 34em;
}

#nav {
	display: flex;
	justify-content: center;
	margin-top: 30px;
}

#nav img {
	width: 60px;
	height: 60px;
}

#nav-top, #nav-sign, #nav-top>li {
	display: flex;
}

.header-nav>li a {
	color: #ffffff;
	margin-right: 30px;
}

.header-nav>li>a:hover {
	color: #6ca6fa;
}
.login{
	display: flex;
	position:absolute;
	top: 4%;
	left:60%;
    margin-left: 139px;}

#nav-top>li {
	margin-left: 50px;
}

.header-nav li:nth-child(1) {
	margin-left: 0px;
}

body {
	background: url(imgs/bg/2e6ad3.jpg) repeat-x;
	max-width: 100%;
	height: 800px;
}
</style>
<header>
	<!-- 로고 -->
	<div id="nav">
		<a class="logo" href='<c:url value="/" />'> <img class="me-4"
			alt="logo" src="imgs/icons/logo.png"></a>
		<ul class="header-nav">
			<li><a href="javascript:window.scrollBy( 0, 800 );">회사소개</a></li>
			<li><a href="javascript:window.scrollBy( 0, 4430 );">서비스영역</a></li>
			<li><a href="javascript:window.scrollBy( 0, 5430 );">프로세서</a></li>
			<li><a href="list.rec">채용공고</a></li>
		</ul>
		<div id='nav-sign'>
			<div class="login">
				<c:if test="${empty loginInfo}">
					<button class="button button-second" data-type="circle" onclick='location="login.mem"'>로그인</button>
				</c:if>
			</div>
				<div style="display: flex; position:relative; top: 3%;left:-63%;">
				<c:if test="${not empty loginInfo}">
					<span style="font-weight: bold; color :white; align-self: center; margin-right: 20px">${loginInfo.name} 님</span>
					<a  style="align-self: center; margin-right:20px; color:white;" onclick="location='modify.mypage?employee_id='${loginInfo.employee_id }"><i class="fa-solid fa-user-tie"></i></a>
					<a style="align-self: center; margin-right:40px;color:white; " onclick="location='list.no'"><i class="fa-solid fa-bars"></i></a>
					<button style="margin-top: 10px" class="button button-second" data-type="circle" onclick='location="logout.mem"'>로그아웃</button>
				</c:if>
				</div>
			
		</div>
	</div>
<script src="js/header.js"></script>

</header>
