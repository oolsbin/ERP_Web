<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src='https://code.jquery.com/jquery-3.6.1.min.js'></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<script src='js/recruit.js?<%=new java.util.Date()%>'></script>
<!-- ★jquery선언문 jquery.com -> blog들가서 긁어옴-->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/js/all.min.js"></script>
<style>
.center {
	text-align: center;
}

footer {
	top: 10%
}

.hrlist {
	margin: 1rem 0;
	color: #000000;
	font-size: 38px;
	font-family: 'Noto Sans KR' !important;
}

table {
	width: 1000px;
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

.btnSet {
	text-align: center;
	margin-top: 30px;
}

table {
	margin: 3rem auto;
}

.btn {
	text-align: center;
}

.btn a {
	margin-right: 3rem;
	text-decoration: none;
}
</style>
</head>
<body>
	<h2 class="center hrlist">채용공고 보기</h2>

	<table class='w-px1000'>

		<tr>
			<th style='width: 150px'>채용유형</th>
			<td>${vo.code_name }</td>
		</tr>
		<tr>
			<th>채용유형</th>
			<td>${com.code_name }</td>
		</tr>
		<tr>
			<th>회사</th>
			<td>${com.company_name }</td>
		</tr>
		<tr>
			<th>채용시작일</th>
			<td>${vo.char_recruit_start }</td>
		</tr>
		<tr>
			<th>채용종료일</th>
			<td>${vo.char_recruit_end }</td>
		</tr>



		<tr>
			<th>연봉</th>
			<td>${vo.salary }</td>
		</tr>
		<tr>
			<th>제목</th>
			<td>${vo.recruit_title }</td>
		</tr>
		<%-- <tr><th>내용</th>
	<td>
	${vo.recruit_content }
</td>
</tr> --%>
		<tr>
			<th>내용</th>
			<td>${vo.recruit_content }<span id='file_name'></span>
			</td>
		</tr>
		<tr>
			<th>첨부파일</th>
			<td>${vo.file_name }
				<div>
					<c:if test="${not empty vo.file_name }">
						<a id='download'><i class="font-b fa-solid fa-file-arrow-down"></i></a>
					</c:if>
				</div>
			</td>
	</table>
	<div class="btn" style='width: 1880px;'>
		<a href='list.rec' class='new-btn'>목록으로 </a>

		<!-- 관리자로 로긴 한 경우만 수정ㅅ/삭제 가능 -->
		<%-- <c:if test='${loginInfo.admin eq "Y" }'> --%>
		<%-- <a class='new-btn' href='modify.rec?recruit_num=${vo.recruit_num }'>정보수정 </a> --%>
		<a class='new-btn' id='remove'>정보삭제</a>


		<%-- </c:if> --%>
	</div>


	<script>
		$('#download').click(
				function() {

					$(this).attr(
							'href',
							'download.rec?recruit_num=${vo.recruit_num }&url='
									+ $(location).attr('href'));

				});

		$('#remove').click(function() {
			if (confirm('정말 삭제?')) {

				location = 'delete.rec?recruit_num=${vo.recruit_num}';
			}
		});
		if (isImage("${vo.file_name}")) {
			$('#file_name')
					.after(
							'<span  id="preview"><img style="width: 800px;" src="${vo.file_path}"/></span>');

		}
	</script>


</body>
</html>







