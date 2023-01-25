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
	width: 1000px;
	margin: 3rem 20.7rem;
	font-weight: bold;
	color: #424242;
	font-size: 32px;
	font-family: 'Noto Sans KR' !important;
	padding-bottom: 30px;
	border-bottom: 2px solid #424242;
}

select {
    position: relative;
    left: 9%;
    width: 180px;
    padding: 0.5em 1.9em;
    font-family: inherit;
    background: url(imgs/arrow.jfif) no-repeat 95% 50%;
    -webkit-appearance: none;
    -moz-appearance: none;
    appearance: none;
    border: 1px solid #999;
    border-radius: 0px;
}

select::-ms-expand {
	display: none;
}
</style>
</head>
<body>
	<h2>결재함</h2>
	<form id='resultForm' action='approvalList.ap' style="margin-left: 4rem;">
		<input type='hidden' name='employee_id' value='${employee_id }'>
		<div id='resultDiv' style="margin-left: 7rem;">
			<select id='resultSelect' name='code_value'>
				<option value='-1'>전체</option>
				<c:forEach items='${documentCheckAll}' var='dca'>
					<option ${dca.code_value eq code_value ? 'selected' : ''}
						value='${dca.code_value }'>${dca.code_name}</option>
				</c:forEach>
			</select>
			
			<table style='margin-top: 10px; width: 83%;'>
				<colgroup>
					<col width='80px'>
					<col width='250px'>
					<col width='150px'>
					<col width='150px'>
					<col width='100px'>
					<col width='150px'>
					<col width='130px'>
					<col width='200px'>
				</colgroup>

				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>기안자</th>
					<th>제출일</th>
					<th>상태</th>
					<th>결재자</th>
					<th>결재일</th>
					<th>비고</th>
				</tr>
				<c:forEach items='${approvalList}' var='a'>
					<tr>
						<td>${a.no}</td>
						<td><a
							onclick='location="approvalListDetail.ap?no=${a.no}&employee_id=${employee_id}"'>${a.document_title}</a></td>
						<td>${a.drafter_position}${a.drafter}</td>
						<td>${a.document_date}</td>
						<td>${a.c_status}</td>
						<td>${a.approver_position}${a.approver}</td>
						<td>${a.finish_date}</td>
						<td>${a.document_comment}</td>
					</tr>
				</c:forEach>
			</table>
		</div>
	</form>
	<script>
		$('#resultSelect').change(function() {
			$('#resultForm').submit();
		});
	</script>
</body>
</html>