<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href='css/approval.css?<%=new java.util.Date()%>' rel='stylesheet'>
<link href='js/approval.js?<%=new java.util.Date()%>' rel='stylesheet'>
<style>
h2 {
	width: 1200px;
    margin: 3rem 20.2rem;
	font-weight: bold;
	color: #424242;
	font-size: 32px;
	font-family: 'Noto Sans KR' !important;
	padding-bottom: 30px;
	border-bottom: 2px solid #424242;
}
</style>
</head>
<body>
	<h2>상신함</h2>
	
<div style="margin-left: 13rem;">	
		<table style="width: 87%;">
	
			<colgroup>
				<col width='50px'>
				<col width='300px'>
				<col width='150px'>
				<col width='100px'>
			</colgroup>
	
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>제출일</th>
				<th>결재자</th>
			</tr>
			<c:forEach items='${submitList}' var='s'>
				<tr>
					<td>${s.no}</td>
					<td><a
						onclick='location="submitListDetail.ap?no=${s.no}&employee_id=${employee_id}"'>${s.document_title}</a></td>
					<td>${s.document_date}</td>
					<td>${s.c_position}${s.approver}</td>
				</tr>
			</c:forEach>
		</table>
</div>
	<div id='btnFix'>
		<a class='new-btn'
			onclick='location="post.ap?employee_id=${employee_id}"'>작성</a>
	</div>
</body>
</html>