<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%-- <link href='css/recruit.css?<%=new java.util.Date() %>' type='text/css' rel='stylesheet'>  --%>

<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" /> 
<script src='https://code.jquery.com/jquery-3.6.1.min.js'></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<script src='js/recruit.js?<%=new java.util.Date()%>'></script>
<script src='js/apply_pic.js?<%=new java.util.Date()%>'></script>
<script src='js/apply.js?<%=new java.util.Date()%>'></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/js/all.min.js"></script>

<style>
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
td{
	text-align: left;
	padding-left: 40px;
}

td a {
	color: #323232;
}

th, td {
	padding: 15px;
	padding-left: 20px;
	background-color: rgba(255, 255, 255, 0.2);
	color: #000000;
}

th {
text-align: center;
}

th {
	background: #12192c;
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
}

#save {
	margin-right: 10px;
}

#preview_pic img{
	width:100%;
}

</style>
</head>
<body>
	<h3 class="center hrlist">합격 / 불합격</h3>
	<form method='post' action='pass.apply' enctype='multipart/form-data'>
		<h4 >${vo.recruit_title}</h4>
		<input type='hidden' name='recruit_num' value='${vo.recruit_num}'>

		<table class='w-px800'>

			<tr>
				<th style="width: 230px;">지원자번호</th>
				<td>${vo.apply_num }</td>

				<td rowspan='3' style="padding:0; margin: 0; width: 150px; border: 1px solid #bbb; text-align: center;"><span
					id='pic_name'></span> <span id='preview_pic'></span> <input
					type="hidden" id='apply_pic_name' value="${vo.apply_pic_name }">
					<%-- 
<span id='pic_name'>${vo.apply_pic_name }</span>

 --%></td>
			</tr>
			<tr>
				<th>이름</th>
				<td>${vo.apply_name }</td>
			<tr>
				<th>휴대폰번호</th>
				<td>${vo.apply_phone }</td>
			</tr>
			<tr>
				<th>이메일</th>
				<td colspan='2'>${vo.apply_email }</td>
			</tr>
			<tr>
				<th>첨부파일</th>
				<td style="display: flex; width: 570px;" colspan='2'>${vo.file_name }
					<div>
						<input style='margin-right: 10px' type="hidden" id='file_name' value="${vo.file_name }">
						<c:if test="${not empty vo.file_name }">
							<a id='download'><i
								class="font-b fa-solid fa-file-arrow-down"></i></a>
						</c:if>
					</div>
				</td>
			</tr>
			<tr>
				<th>합/불합</th>
				<td colspan='2'><label><input type="radio"
						id="apply_check" name="apply_check" value="N"
						<c:if test="${vo.apply_check eq 'N' }">checked</c:if>>대기중</label>
					<label><input type="radio" id="apply_check"
						name="apply_check" value="X"
						<c:if test="${vo.apply_check eq 'X' }">checked</c:if>>불합</label>
					<label><input type="radio" id="apply_check"
						name="apply_check" value="Y"
						<c:if test="${vo.apply_check eq 'Y' }">checked</c:if>>합</label>
					<input type="hidden" name="apply_num" value="${vo.apply_num }">

					<%-- 
		<input type="radio" name="apply_check" value="${vo.apply_check }"
		<c:if test="${vo.apply_check eq 'Y' }">checked</c:if>
	 	
		> 합
 
 --%></td>
			</tr>


		</table>
		<div class='center' style="margin-top: 25px;">
			<a class='new-btn' id="save">저장 </a> <a class='new-btn'
				href='applicantList.apply'>취소</a>

		</div>
	</form>

	<script>
		$('#download').click(
				function() {

					$(this).attr(
							'href',
							'download.apply?apply_num=${vo.apply_num }&url='
									+ $(location).attr('href'));

				});

		$('#save').click(function() {
			$('form').submit(); //빈칸 체크 : if( emptyCheck() ) 
		});

		/*
		 if(isImage("${vo.file_name}")) {
		 $('#file_name').after('<span id="preview"><img src="${vo.file_path}"</span>' );
		
		 }
		 */
		if (isImage("${vo.apply_pic_name}")) {
			$('#pic_name')
					.after(
							'<span id="preview_pic"><img src="${vo.apply_pic_path}"</span>');

		}
	</script>


</body>
</html>