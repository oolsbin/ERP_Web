<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix='c'%>

<style>
.header-nav {
	display: inline-flex;
	padding-top: 10px;
	font-size: 16px;
	font-weight: bold;
	align-items: center;
	margin-bottom: 0.5rem;
	margin-left: 60px;
	margin-right: 34em;
}

#nav {
	display: flex;
	justify-content: center;
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

#nav-top>li {
	margin-left: 50px;
}

.header-nav li:nth-child(1) {
	margin-left: 0px;
}
header{
	background: url(imgs/bg/empty.png) repeat-x;
	max-width: 100%;
	padding: 25px 108px;
}

</style>

<header>
	<!-- 		로고 -->
	<div id="nav">
		<a class="logo" href='<c:url value="/" />'> <img class="me-4"
			alt="logo" src="imgs/icons/logo.png"></a>
		<ul class="header-nav">
			<li><a href="<c:url value="/" />">회사소개</a></li>
			<li><a href="<c:url value="/" />">서비스영역</a></li>
			<li><a href="<c:url value="/" />">프로세서</a></li>
			<li><a href="list.rec">채용공고</a></li>
		</ul>
		<div id='nav-sign'>
			<div style="left: 69%;display: flex; position: absolute;">
				<c:if test="${empty loginInfo}">
					<button class="button button-second" data-type="circle"
						onclick='location="login.mem"'>로그인</button>
				</c:if>

				<c:if test="${not empty loginInfo}">
					<span style="color: white; font-weight: bold; align-self: center; margin-right: 10px">${loginInfo.name} 님</span>
					<a style="align-self: center; margin-right:30px;color:white; " onclick="location='list.no'"><i class="fa-solid fa-bars"></i></a>
					<button  style="margin: 0;"class="button button-second" data-type="circle"
						onclick='location="logout.mem"'>로그아웃</button>
				</c:if>
			</div>
		</div>
	</div>
	<script src="js/header.js"></script>
</header>
