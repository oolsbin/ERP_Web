<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c' %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href='css/approval.css?<%=new java.util.Date()%>' rel='stylesheet'>
<link href='js/approval.js?<%=new java.util.Date()%>' rel='stylesheet'>
<style>

</style>
</head>
<body>
<div class='centerFrame'>
<table class="apTable detail" style='width: 90%'>
	<colgroup>
		<col width='100px'>
		<col width='1000px'>
	</colgroup>
	
		<tr>
			<th>제목</th>
			<td>${approvalListDetail.document_title}</td>
		</tr>
		
		
		<tr>
			<th>기안자</th>
			<td>${approvalListDetail.drafter_position} ${approvalListDetail.drafter}</td>
		</tr>
		<tr>
			<th>제출일자</th>
			<td>${approvalListDetail.document_date}</td>	
		</tr>
		
		<tr>
			<th>결재자</th>
			<td>${approvalListDetail.approver_position} ${approvalListDetail.approver}</td>
		</tr>
		<tr>
			<th>결재일자</th>
			<td>${approvalListDetail.finish_date}</td>	
		</tr>
		
		<tr><th class='content'>내용</th>
			<td>${approvalListDetail.document_content}</td>	
		</tr>

		<tr><th>첨부파일</th>
			<td  colspan='3'>
			<c:if test='${not empty approvalListDetail.file_name }'>
			<a class='file file-text'>${approvalListDetail.file_name}</a>
			</c:if>
			</td>	
		</tr>
		
		<tr>
			<th>처리결과</th>
			<td>${approvalListDetail.c_status}</td>
		</tr>
		<tr>
			<th>비고</th>
			<td>${approvalListDetail.document_comment}</td>
		</tr>
		
		
		
	</table>
	</div>
	<div id='btnFix'><a class='new-btn' href='approvalList.ap?employee_id=${employee_id}'>뒤로가기</a></div>
<script>
$('.file').click(function(){
	$(this).attr('href'
			, 'downloadApproval.ap?employee_id=${employee_id}&no=${approvalListDetail.no}&url=' + $(location).attr('href'));
	console.log(this.getAttribute('href'));
});
</script>
</body>
</html>