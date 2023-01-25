<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
table td {text-align: left;}

</style>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  

 <script src='https://code.jquery.com/jquery-3.6.1.min.js'></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<script src='js/recruit.js?<%=new java.util.Date() %>'></script>
<!-- ★jquery선언문 jquery.com -> blog들가서 긁어옴-->
<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/js/all.min.js"></script>
<style>
/* img { */
/* 	width : 50px; */
/* 	height: 50px; */
/* } */
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

</style>

</head>
<body>

<h3 style="margin-bottom:35px; margin-top:55px;">공지사항 상세보기</h3>

<table class='w-px1200'>
<colgroup>
	<col width='140px'>
	<col>
	<col width='140px'>
	<col width='140px'>
	<col width='100px'>
	<col width='100px'>

</colgroup>

<tr><th>제목</th>
<td colspan='5'>${vo.notice_title }</td>
</tr>

<tr>
<th>작성자</th>
<td>${vo.notice_writer }</td>
<th>작성일자</th>
<td>${vo.notice_date }</td>
<th>조회수</th>
<td>${vo.notice_readcnt }</td>
</tr>

<tr><th>내용</th>
<td style="height :300px;" colspan='5'>${fn:replace(vo.notice_content,crlf,'<br>' )}</td>

</tr>

<tr><th>첨부파일</th>
<td style="height :100px;" colspan='5'>
<div style="height: 30px; display:flex; ">

<span style="height: 30px; display:flex;"  id='file_name'>${vo.file_name }</span>
<c:if test="${not empty vo.file_name }">
<a id='download'><i class="font-b fa-solid fa-file-arrow-down"></i></a>
</c:if>
</div>
</td>
</tr>

</table>
<div class='btnSet' style="display:flex; justify-content: center">
<a    style="margin: 10px;"  href='list.no' class='btn-fill'>목록으로</a>

<!-- 관리자로 로긴 한 경우만 수정ㅅ/삭제 가능 -->
<c:if test='${loginInfo.admin eq "Y" }'>
<a style="margin: 10px;" class='btn-fill' href='modify.no?notice_num=${vo.notice_num }'>정보수정 </a>
<a  style="margin: 10px;" class='btn-fill' id='remove'>정보삭제</a>
</c:if>

</div>

<script>
$('#download').click(function(){
	
	$(this).attr('href'
			, 'download.no?notice_num=${vo.notice_num }&url='+$(location).attr('href'));
	
});

if(isImage("${vo.file_name}")) {
	$('#file_name').after('<span id="preview"><img src="${vo.file_path}"</span>' );
	
}

$('#remove').click(function() {
	if(confirm('정말 삭제?')) {
		
		location='delete.no?notice_num=${vo.notice_num}';
	}
});


</script>


</body>
</html>