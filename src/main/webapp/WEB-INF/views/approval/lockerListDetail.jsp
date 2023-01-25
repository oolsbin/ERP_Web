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
.googleIcon{
	font-size: 16px;
	vertical-align: baseline;
	margin-left: 5px;
}
.material-symbols-outlined {
  font-variation-settings:
  'FILL' 0,
  'wght' 400,
  'GRAD' 0,
  'opsz' 48
  }

#locker-select{
	margin-left: 50px;
	margin-bottom: 10px;
}
select{
	width: 150px;
}

</style>
</head>
<body>
<div class='centerFrame'>
<form id='postForm' method='post' action='insertPost.ap?employee_id=${loginInfo.employee_id}&url=submitList.ap' enctype='multipart/form-data'>
	<input type='hidden' name='employee_id' value='${loginInfo.employee_id}'>
	<input type='hidden' name='department_id' value='${loginInfo.department_id}'>
	<input type='hidden' name='company_cd' value='${loginInfo.company_cd}'>
	<input type='hidden' name='no' value='${lockerListDetail.no}'>
	<input type='hidden' name='ing_no' value='${lockerListDetail.ing_no}'>
	
	<div id='locker-select'>
		<select id='department_name' name='department_name' style='height: 26px'>
		<option value='부서'>부서</option>
		<c:forEach items='${departments}' var='d'>
		<option ${department_name eq d.department_name ? 'selected' : ''} value='${d.department_name}'>
		${d.department_name}</option>
		</c:forEach>	
		</select>
		
		<select id='approver_id' name='approver_id' style='height: 26px'>
		<option value='-1'>결재자</option>
		<c:forEach items='${departmentEmployee}' var='de'>
		<option value='${de.employee_id}'>${de.c_position} ${de.name}</option>
		</c:forEach> 
		</select>
	</div>
	
	<table class='apTable detail' style='width: 90%'>
	<colgroup>
	<col width='100px'>
	<col width='100%'>
	</colgroup>
		<tr><th>제목</th>
			<td><input type='text' id='document_title' name='document_title' value='${lockerListDetail.document_title }'></td>
		</tr>
		<tr><th class='content'>내용</th>
			<td><textarea id='textarea' name='document_content'>${lockerListDetail.document_content }</textarea></td>
		</tr>
		<tr><th height='47px'>첨부파일</th>
			<td colspan='3' style='vertical-align: middle' class=''>
				<input type="file" id='file' name='file' 
				style='display:${empty lockerListDetail.file_name ? "block" : "none"}'>
				
				<c:if test='${not empty lockerListDetail.file_name }'>
				<a name='file_name' class='file file-text'>${lockerListDetail.file_name}</a>
				</c:if>
				<input type='hidden' name='file_name' >
				<a id='deleteFile' style='display:${empty lockerListDetail.file_name ? "none" : "inline"}'><span class="material-symbols-outlined googleIcon">
				close
				</span></a>
			
			</td>	
		</tr>
	</table>
</form>
</div>
<div id='btnFix43'>
<a class='new-btn' id='postSubmit'>제출</a>
<a class='new-btn' id='postCancel'>삭제</a>
<a class='new-btn' id='postBack'>이전으로</a>
</div>
<script>



//서브밋 할 때
$('#postSubmit').click(function(){
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
	
	
	$('[name=file_name]').val( $('.file').text() );
	
	
	$('#postForm').attr('action', 'deleteInsertSubmit.ap?employee_id=${loginInfo.employee_id}&ing_no=${ing_no}&url=submitList.ap');
	$('#postForm').submit();
})


//삭제 버튼 선택 시 
$('#postCancel').click(function(){
	if(confirm('삭제하시겠습니까?'))
	location = 'deleteLockerList.ap?employee_id=${loginInfo.employee_id}&url=lockerList.ap&ing_no=${lockerListDetail.ing_no}&no=${lockerListDetail.no}'
})

//이전으로 버튼 선택 시
$('#postBack').click(function(){
	if(confirm('변경된 내용을 저장할까요?')){
		
		if($('#document_title').val()==0){
			alert('제목을 입력해주세요');
			return;
		}
		
		$('[name=file_name]').val( $('.file').text() );
		$('#postForm').attr('action', 'deleteInsertLocker.ap?employee_id=${loginInfo.employee_id}&url=lockerList.ap&ing_no=${lockerListDetail.ing_no}&no=${lockerListDetail.no}');
		$('#postForm').submit();
	}else{
		location = "lockerList.ap?employee_id=${loginInfo.employee_id}"
	}
})

//부서선택 시 그에 맞게 정보를 다시 가져옴
//submit을 하면 안 되고 필요한 파라미터를 전송해서 데이터 뽑아서 화면만 갖다 붙인다
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


$('.file').click(function(){
	$(this).attr('href'
			, 'downloadLocker.ap?employee_id=${loginInfo.employee_id}&no=${lockerListDetail.no}&url=' + $(location).attr('href'));
	console.log(this.getAttribute('href'));
});


$('#deleteFile').click(function(){
		$('.file').text('');			
		$(this).css('display', 'none');	
		$('#file').val('');				
		$('#file').css('display', 'block');
});




</script>
</body>
</html>