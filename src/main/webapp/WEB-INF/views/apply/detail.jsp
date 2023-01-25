<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%-- <link href='css/recruit.css?<%=new java.util.Date() %>' type='text/css' rel='stylesheet'> 

<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" /> --%> 
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
/* 	border-collapse: collapse; */
	overflow: hidden;
	box-shadow: 0 0 20px rgba(0, 0, 0, 0.4);
}
h3{
	text-align: center;
	margin-bottom: 50px;
}
td a {
	color: #323232;
}

th, td {
	padding: 15px;
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
footer{
	top:50%
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
	width:100%!important;
	z-index: 9999;
}

</style>

</head>
<body>
	<h2 class="center hrlist">지원서 확인</h2>

	<form method='post' action='insert.apply' enctype='multipart/form-data'>
		<h3>${vo.recruit_title}</h3>
		<input type='hidden' name='recruit_num' value='${vo.recruit_num}'>
		<table class='w-px1000'>
			<colgroup>
				<col width="200px">
				<col width="500px">
			</colgroup>
			<tr>
				<th>지원자번호</th>
				<td>${vo.apply_num }</td>
				<td rowspan='3' style="padding:0; margin: 0; width: 150px; border: 1px solid #bbb; text-align: center;"><span id='pic_name'></span>
				
					<span id='preview_pic'></span> <input type="hidden"
					id='apply_pic_name' value="${vo.apply_pic_name }"> <%-- 
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
				<td colspan='2'>
					<div>${vo.file_name }

						<span id='file_name'></span>


						<%-- <input type="hidden" id='file_name' value="${vo.file_name }"> --%>

						<c:if test="${not empty vo.file_name }">
							<a id='download'><i
								class="font-b fa-solid fa-file-arrow-down"></i></a>
						</c:if>
					</div>
				</td>
			</tr>

		</table>
		<div class='margin' style="text-align: center;">
			<a class='new-btn' href='modify.apply?apply_num=${vo.apply_num }'>지원서 수정 </a>
			<a class='new-btn' id='remove'>지원서 삭제</a>
			<a class='new-btn' href='applyList.apply'>목록으로</a>
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

		$('#remove').click(function() {
			if (confirm('정말 삭제하시겠습니까?')) {

				location = 'delete.apply?apply_num=${vo.apply_num}';
			}
		});

		
		if(isImage("${vo.apply_pic_name}")) {
			$('#pic_name').after('<span id="preview_pic"><img src="${vo.apply_pic_path}"</span>' );
			
		}
	</script>


</body>
</html>