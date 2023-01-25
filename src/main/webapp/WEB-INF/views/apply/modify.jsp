<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%-- <link href='css/recruit.css?<%=new java.util.Date() %>' type='text/css' rel='stylesheet'>

<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />   --%>
 <script src='https://code.jquery.com/jquery-3.6.1.min.js'></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<script src='js/recruit.js?<%=new java.util.Date() %>'></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/js/all.min.js"></script>
<script src='js/apply_pic.js?<%=new java.util.Date() %>'></script>
<script src='js/apply.js?<%=new java.util.Date() %>'></script>

<style>
form{
	margin-top: 45px;
}
table {
	margin-top: 5px;
	/* 	border-top-left-radius: 20px; */
	/*     border-top-right-radius: 20px; */
	padding-bottom: 2rem;
	border-radius: 15px;
	border-collapse: collapse;
	overflow: hidden;
	box-shadow: 0 0 20px rgba(0, 0, 0, 0.4);
}

td a {
	color: #323232;
}

th, td {
	padding: 15px;
	background-color: rgba(255, 255, 255, 0.2);
	color: #000000;
}
footer{
	top:50%
}

th {
	text-align: center;

}

th {
	background: #12192c;
	color: #fff;
}
td {
 text-align: left;
 padding-left: 40px;
}

tbody tr:hover, td:hover {
	background-color: rgba(255, 255, 255, 0.5);
}

tbody td {
	position: relative;
}

tbody td:hover:before {
	background-color: rgba(255, 255, 255, 0.2);
	z-index: -1;
}

.new-btn {
	padding: 1em 1.8em;
	font-size: 14px;
	font-weight: 400;
	font-family: 'Noto Sans KR', sans-serif;
	border-radius: 4px;
	cursor: pointer;
	-webkit-appearance: none;
	-moz-appearance: none;
	appearance: none;
	border: none;
	color: #ffffff;
	margin-bottom: 10px;
	background: #12192c;
	position: relative;
	left: 4%;
	margin-right: 10px;
}
.margin {
margin-top: 40px;
}

#preview_pic img{
	width:100%;
}

#delete-file-pic, #attach-file, #delete-file, #attach-file-pic {
display: none;}

</style>
</head>
<body>
<h2 class="center hrlist">나의 지원서 수정</h2>

<form method='post' action='update.apply'  enctype='multipart/form-data'>
<!-- 
<form method='post' action='fillout.apply'  enctype='multipart/form-data'>
 -->
<h3>${recruit.recruit_title}</h3>
<input type='hidden' name='apply_num' value="${vo.apply_num }">
<input type='hidden' name='file_name' value="${vo.file_name }">
<input type='hidden' name='pic_file_name' value="${vo.apply_pic_name }">

<table class='w-px1000'>
<tr><th>이름</th>
<td> 
<input type='text' class="chk" name='apply_name' value="${vo.apply_name }">
</td>


<td rowspan='3' style="padding:0; margin: 0; width: 150px; border: 1px solid #bbb; text-align: center;">
	<div class='align'>
		<label> 
						<input type='file' name='pic_name' id='attach-file-pic'>
	<a class='attach-file-pic'><i class="font-b fa-solid fa-file-circle-plus"></i>증명사진 첨부</a>
						
						</label> 
		</div>
			
			<br>
			
		<span id='pic_name' ></span>
		
		
		<div>
		
		<span id='preview_pic'></span>
		</div>
	
		<!-- //첨부파일이 있는 경우 삭제 이미지가 보이게 처리 -->
		<a id='delete-file-pic' style='display:${empty vo.apply_pic_name ? "none" : "inline"}'><i class="font-r fa-solid fa-trash-can"></i></a>
		

</td>
<tr>
<th>휴대폰번호</th>
<td>
<input type='text'  class="chk" name='apply_phone' value="${vo.apply_phone }">
</td>
</tr>
<tr>
<th>이메일</th>
<td>
<input type='text'  class="chk" name='apply_email' value="${vo.apply_email }">
</td>
</tr>


<tr><th>첨부파일</th>
	<td colspan= '2' class='text-left'>
		<div class='align'>
		<label>
			<input type='file' name='file' id='attach-file'>
			<a><i class="font-b fa-solid fa-file-circle-plus"></i></a>
		</label>
		<span id='file_name'>${vo.file_name}</span>
		
		<!-- //첨부파일이 있는 경우 삭제 이미지가 보이게 처리 -->
		<a id='delete-file' style='display:${empty vo.file_name ? "none" : "inline"}'><i class="font-r fa-solid fa-trash-can"></i></a>
		
		</div>
	</td>
</tr>

</table>
<div class='margin' style='text-align: center;'>
	<a class='new-btn' id='save'>저장</a>
	<a class='new-btn' onclick="history.go(-1)">취소</a>
</div>
</form>

<script>

$('#save').click(function(){
	$('[name=file_name]').val( $('#file_name').text() );
	if( emptyCheck() ) $('form').submit();
});



if(isImage("${vo.apply_pic_name}")) {
	$('#pic_name').after('<span id="preview_pic"><img src="${vo.apply_pic_path}"</span>' );
	
}





</script>


</body>
</html>