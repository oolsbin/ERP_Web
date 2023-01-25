<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
h3{
	width : 800px;
	margin : 3rem 0;
	font-weight: bold;
    color: #424242;
    font-size: 32px;
    font-family: 'Noto Sans KR' !important;
    padding-bottom : 30px; 
    border-bottom: 2px solid #424242;
}

.new-btn{
  padding: 1em 1.8em;
  font-size: 15px;
  font-weight: 400;
  font-family:'Noto Sans KR', sans-serif;
  border-radius: 4px;
  cursor: pointer;
  -webkit-appearance: none;
     -moz-appearance: none;
          appearance: none;
  border: none;
  color: #ffffff;
  margin-bottom: 10px;
	background : #12192c;
	position: relative;
	left: 4%;
}

table {
	margin-top: 10px;
	border-radius : 20px;
	border-collapse: collapse;
	overflow: hidden;
	margin-bottom : 30px;
	box-shadow: 0 0 20px rgba(0, 0, 0, 0.4);
}

td a{
	color : #323232;
}
th, td {
  padding: 15px;
  background-color: rgba(255, 255, 255, 0.2);
  color: #000000;
}

th {
  text-align: center;
}
th {
  background-color: #12192c;
  color : #fff;
}
tbody tr:hover, td:hover {
  background-color: rgba(255, 255, 255, 0.5);
}
tbody td {
	border-bottom: 1px solid #efefef;
  	position: relative;
}
tbody td:hover:before {
  
  background-color: rgba(255, 255, 255, 0.2);
  z-index: -1;
}

</style>
</head>
<body>
	<h3 class="fi">사원정보</h3>
	<div>
		<table class="w-px1000">
		<colgroup>
			<col width="200px"/>
			<col width="400px"/>
		</colgroup>
			<tr>
				<th class="">사번</th>
				<td>${vo.employee_id}</td>
			</tr>
			<tr>
				<th class="">부서명</th>
				<td>${vo.department_name}</td>
			</tr>
			<tr>
				<th class="">회사코드</th>
				<td>${vo.company_name}</td>
			</tr>
			<tr>
				<th class="">사원명</th>
				<td>${vo.name}</td>
			</tr>
			<tr>
				<th class="">이메일</th>
				<td>${vo.email}</td>
			</tr>
			<tr>
				<th class="">전화번호</th>
				<td>${vo.phone}</td>
			</tr>
			<tr>
				<th class="">관리자</th>
				<td>${vo.admin}</td>
			</tr>
			<tr>
				<th class="">입사일자</th>
				<td>${vo.hire_date}</td>
			</tr>
			<tr>
				<th class="">직급</th>
				<td>${vo.position_name}</td>
			</tr>
			<tr>
				<th class="">업무형태</th>
				<td>${vo.employee_pattern_name}</td>
			</tr>
		</table>
	</div>
	<div class='center'>
	<a class='new-btn' href='modify.hr?id=${vo.employee_id}'>정보수정</a>
	<a class='new-btn' onclick="if( confirm('사번을[${vo.employee_id}] 삭제하시겠습니까?') ) href='delete.hr?id=${vo.employee_id}' " >정보삭제</a>
	<a class='new-btn' href='list.hr'>사원목록</a>
</div>
<script>
	$(document).ready(function() {
		$('.fi').fadeIn(3000);
	});

</script>
</body>
</html>