<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
th{
	background: none;
}
</style>
<title>회원 조회</title>
</head>
<body>
	<h3>회원정보 수정 관리</h3>

	<table class='tb-list'>
		<colgroup>
			<col width='300px'>
			<col width='150px'>
			<col width='80px'>
			<col width='200px'>
			<col width='80px'>
		</colgroup>
		<tr>
			<th>이메일</th>
			<th>이름</th>
			<th>성별</th>
			<th>전화번호</th>
			<th>관리자 승인여부</th>
		</tr>
		<c:forEach items='${list}' var='vo'>
			<tr>
				<td><a href='info.mem?email=${vo.email}'>${vo.email}</a></td>
				<td>${vo.name}</td>
				<td>${vo.gender}</td>
				<td>${vo.phone}</td>
				<td>${vo.join_check}</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>