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
	<h2>수신함</h2>

	<div style="margin-left: 12rem;">
		<table style="width: 86%;">
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
				<th>기안자</th>
			</tr>
			<c:forEach items='${receiveList}' var='a'>
				<tr>
					<td>${a.no}</td>
					<td><a
						onclick='location="receiveListDetail.ap?no=${a.no}&employee_id=${employee_id}"'>${a.document_title}</a></td>
					<td>${a.document_date}</td>
					<td>${a.c_position}${a.drafter}</td>
				</tr>
			</c:forEach>
		</table>
	</div>
</body>
</html>