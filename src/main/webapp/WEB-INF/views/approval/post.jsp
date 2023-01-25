<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href='css/approval.css?<%=new java.util.Date()%>' rel='stylesheet'>
<link href='js/approval.js?<%=new java.util.Date()%>' rel='stylesheet'>
<style>
#postForm{
	margin: 10px 0;
}

select {
	margin-left: -1px;
    position: relative;
    left: 1%;
    width: 180px;
    padding: 0.5em 1.4em;
	font-family: inherit;
	background: url('imgs/arrow.jfif') no-repeat 95% 50%;
	-webkit-appearance: none;
	-moz-appearance: none;
	appearance: none;
	border: 1px solid #999;
	border-radius: 0px;
}

select::-ms-expand {
	display: none;
}
[type=text] {
    width: 100%;
    height: 31.2px !important;
}
</style>
</head>
<body>
<div class='centerFrame'>
<form id='postForm' method='post' action='insertPost.ap?employee_id=${loginInfo.employee_id}&url=submitList.ap' enctype='multipart/form-data'>
	<input type='hidden' name='employee_id' value='${loginInfo.employee_id}'>
	<input type='hidden' name='department_id' value='${loginInfo.department_id}'>
	<input type='hidden' name='company_cd' value='${loginInfo.company_cd}'>
	<input type='hidden' name='ing_no' value='${ing_no}'>

	<select id='department_name' name='department_name'>
	<option value='부서'>부서</option>
	<c:forEach items='${departments}' var='d'>
	<option ${department_name eq d.department_name ? 'selected' : ''} value='${d.department_name}'>
	${d.department_name}</option>
	</c:forEach>	
	</select>
	
	<select id='approver_id' name='approver_id'>
	<option value='-1'>결재자</option>
	<c:forEach items='${departmentEmployee}' var='de'>
	<option value='${de.employee_id}'>${de.c_position} ${de.name}</option>
	</c:forEach>
	</select>
	
	
	<table class='apTable detail' style='margin-top: 10px'>
	<colgroup>
		<col width='100px'>
		<col>
	</colgroup>
	
		<tr><th>제목</th>
			<td><input type='text' id='document_title' name='document_title' value='${document_title}'></td>
		</tr>
		<tr><th class='content'>내용</th>
			<td><textarea id='textarea' name='document_content' style="height: 400px;">${document_content}</textarea></td>
		</tr>
		<tr><th>첨부파일</th>
			<td style='text-align: left'>
				<input type="file" id='file' name='file'>${vo.file_name }
			</td>
		</tr>
	</table>
</form>
</div>

<div id='btnFix45'>
<a class='new-btn' id='postSubmit'>Submit</a>
<a class='new-btn' id='postCancel'>Cancel</a>
</div>
<script>
document.querySelector('#postSubmit').onclick = function(){
	if( document.querySelector('#document_title').value.toString()<1 ){
		alert('제목을 입력하세요')
		return;
	}else if( document.querySelector('#department_name').value=='부서' ){
		alert('결재자를 선택하세요')
		return;
	}else if( document.querySelector('#approver_id').value=='-1'){
		alert('결재자를 선택하세요')
		return;
	}
	document.querySelector('#postForm').submit();	
}

//취소 버튼 선택 시 
$('#postCancel').click(function(){
	if($('#document_title').val()==0){
		alert('제목을 입력해주세요');
		return;
	}
		
	
	if(confirm('임시보관함에 저장할까요?')){
		$('#postForm').attr('action', 'insertLocker.ap?employee_id=${loginInfo.employee_id}');
		$('#postForm').submit();
	}else{
		location = 'submitList.ap?employee_id=${loginInfo.employee_id}'
	}
})

//부서선택 시 그에 맞게 정보를 다시 가져옴
$('#department_name').change(function(){
	$.ajax({
		url: 'post_department',
		data: { department_name: $(this).val(), employee_id: ${loginInfo.employee_id} },
		success: function(response){
			$('#approver_id').html(response);
		}
	});
	
// 	$('#postForm').attr('action', 'post.ap');
// 	$('#postForm').submit();
});



</script>
</body>
</html>