<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions"  prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  

 <script src='https://code.jquery.com/jquery-3.6.1.min.js'></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<script src='js/recruit.js?<%=new java.util.Date() %>'></script>
<!-- ★jquery선언문 jquery.com -> blog들가서 긁어옴-->
<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/js/all.min.js"></script>
<style>
img {
	width : 50px;
	height: 50px;
}
a{
	color : white;
}
a.btn-fill{
    height: 32px;
        background: #125;
   
    border-radius: 6px;
    padding: 5px;
  }
  
body{
width : 1200px;
}
select{

height : 32px;}

table {
	width : 1200px;
	margin-top: 5px;
	/* 	border-top-left-radius: 20px; */
	/* 	border-top-right-radius: 20px; */
	border-radius: 15px;
	border-collapse: collapse;
	overflow: hidden;
	box-shadow: 0 0 20px rgba(0, 0, 0, 0.4);
	margin-bottom: 10rem;
}

td a {
	color: #323232;
}

th, td {
	padding: 15px;
	background-color: rgba(255, 255, 255, 0.2);

    /* overflow: hidden; */
    text-overflow: ellipsis;
    white-space: break-spaces;
    font-weight: normal;
}

th {
	text-align: center;
}

th {
	background-color: #12192c;
	color: #fff;
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

#delete-file-pic, #attach-file, #delete-file, #attach-file-pic {
display: none;}

</style>
</head>
<body>
<h3 style="margin-bottom:35px; margin-top:55px;">공지글수정</h3>
<form method='post' action='update.no' enctype='multipart/form-data'>
<table>
<tr><th class='w-px140' >제목</th>
	<td style="text-align:left; "><input type='text' style="width:-webkit-fill-available;"value='${fn: escapeXml(vo.notice_title)}' name='notice_title' class='full chk' title='제목'></td>
</tr>
<tr><th>내용</th>
	<td style="height :300px;"><textarea name='notice_content' class='full chk' title='내용'>${vo.notice_content}</textarea></td>
</tr>
<tr><th>첨부파일</th>
	<td class='text-left' >
		<div style="height: 30px; display:flex; ">
		<label style="height: 30px; display:flex;">
			<input type='file' name='file' id='attach-file'>
			<a><i class="font-b fa-solid fa-file-circle-plus"></i></a>
		</label>
		<span id='file_name'>${vo.file_name}</span>
		<span id='preview'></span>
		<!-- //첨부파일이 있는 경우 삭제 이미지가 보이게 처리 -->
		<a id='delete-file' style='display:${empty vo.file_name ? "none" : "inline"}'><i class="font-r fa-solid fa-trash-can"></i></a>
		</div>
	</td>
</tr>
</table>
<input type='hidden' name='notice_num' value='${vo.notice_num}'>
<input type='hidden' name='file_name' value='${vo.file_name}'>



</form>
<div class='btnSet' style="display:flex; justify-content: center">
	<a  style="margin: 10px;"class='btn-fill' id='save'>저장</a>
	<a  style="margin: 10px;"class='btn-fill' href='list.no'>취소</a>
</div>
<script>



$('#save').click(function(){
	$('[name=file_name]').val( $('#file_name').text() );
	if( emptyCheck() ) $('form').submit();
});
</script>
</body>
</html>







