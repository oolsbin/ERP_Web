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
	<div>
		<h2>보관함</h2>
		<form id='form_deleteLocker'
			action='deleteLocker.ap?employee_id=${employee_id}&url=lockerList.ap' style="margin-left: 12rem;">
			<input type='hidden' name='employee_id' value='${employee_id }'>
			<input type='hidden' name='url' value='lockerList.ap'>

			<table style="width: 86%;">

				<colgroup>
					<col width='30px'>
					<col width='80px'>
					<col width='300px'>
					<col width='150px'>
				</colgroup>
				<tr>
					<th></th>
					<th>번호</th>
					<th>제목</th>
					<th>날짜</th>
				</tr>
				<c:forEach items='${lockerList}' var='l'>
					<tr>
						<td><input type="checkbox" class='deleteCheck'
							name='deleteCheck' value='${l.ing_no}'></td>
						<td>${l.no}</td>
						<td><a
							onclick='location="lockerListDetail.ap?no=${l.no}&employee_id=${employee_id}&ing_no=${l.ing_no}"'>${l.document_title}</a></td>
						<td>${l.document_date}</td>
					</tr>
				</c:forEach>
			</table>
		</form>


		<div id='btnFix'>
			<a class='new-btn' id='deleteLockerList'>삭제</a>
		</div>
	</div>
<script>
$('#deleteLockerList').click(function(){
	
	if($('[type=checkbox]').is(':checked')==false){
		alert('항목을 선택해 주세요')
		return;
	}
	
	if(confirm('삭제하시겠습니까?'))
	$('#form_deleteLocker').submit();
});
</script>
</body>
</html>