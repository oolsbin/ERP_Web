<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="css/common.css?<%=new java.util.Date()%>" rel="stylesheet">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<style>	
.card{
	box-shadow : 0 3px 25px rgba(0, 0, 0, 0.3);
	border-radius : 10px;
	width : 1000px;
	height: 800px;
	display: inline-flex;
}
.logo{
	width : 100px;
	height: 100px;
	filter: invert(30%);
}
.border-box{
	border : 1px solid #ccc;
}
.info-modify{
	text-align: center;
	
}
.container {
  text-align : center;
  justify-content: center; 
  display: grid;
  grid-template-columns: repeat(3, 130px);
  grid-template-rows: repeat(4, 130px);
  
}
.gird-wrap{
	width : 800px;
	margin-top : 10rem;
}
.item1 {
    grid-column-start: 1;
    grid-column-end: 4;
}
.item1 {
	grid-column: 1 / 4;
}
 
.item2 {
	grid-row: 2 / 4;
}
 
.item3 {
	grid-column : 2 / span 2;
}
 
.item6 {
	grid-column : 1 / span 3;
}
</style>
</head>
<body>
	<h2 class="hrlist">나의정보</h2>
	<div class="gird-wrap">
		<div class="container">
			<div class="item item1">
				<span><strong>${vo.name}</strong> 님 반갑습니다! </span>
			</div>
			<div class="item item2">
				<h5>정보수정</h5>
				
				(마이페이지) <br />
				이메일 <br />
				비밀번호 수정 가능하게 구현
			</div>
			<div class='item item3'>
				<img class="logo" src="imgs/icons/logo.png" alt="logo" />
			</div>
			<div class="item item4">
				<h5>근태관리</h5>
			</div>
			<div class="item item5">
				<h5>공지사항</h5>
			</div>
			<div class="item item6">
				<h5>결재함</h5>
			</div>
		</div>
	</div>
</body>
</html>

