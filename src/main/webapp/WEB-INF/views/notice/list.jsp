<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css"
	type="text/css" />

<script src='https://code.jquery.com/jquery-3.6.1.min.js'></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<script src='js/recruit.js?<%=new java.util.Date()%>'></script>
<!-- ★jquery선언문 jquery.com -> blog들가서 긁어옴-->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/js/all.min.js"></script>
<style>
h3 {
	margin: 2rem 0rem;
	font-weight: bold;
	color: #424242;
	font-size: 32px;
	font-family: 'Noto Sans KR' !important;
	padding-bottom: 30px;
	border-bottom: 2px solid #424242;
}

.search {
	padding: 0.5em 1em;
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
}

body {
	width: 1200px;
}

select {
	height: 32px;
}

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
	border-bottom: 1px solid #efefef;
	padding: 12px;
	background-color: rgba(255, 255, 255, 0.2);
	color: #000000;
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
	left: 879%;
}

select {
	width: 110px;
	padding: 0.1em 1.5em;
	font-family: inherit;
	background: url(imgs/arrow.jfif) no-repeat 95% 50%;
	-webkit-appearance: none;
	-moz-appearance: none;
	appearance: none;
	box-shadow: 0 1px 25px rgb(0 0 0/ 20%);
	border: 2px solid #bfbcbc;
	border-radius: 3px;
}
</style>


</head>
<body>
	<h3>${loginInfo.name }/ 공지사항</h3>

	<form method='post' action='list.no'>
		<div id='list-top' style="width: 1400px;">
			<ul style="display: flex">
				<li style="margin-right: 10px;"><select name='search'
					class='w-px100'>
						<!-- name줘야 전달가넝 -->
						<option value='all' ${search.search eq 'all'? 'selected':'' }>전체</option>
						<option value='notice_title'
							${search.search eq 'notice_title'? 'selected':'' }>제목</option>
						<option value='notice_content'
							${search.search eq 'notice_content'? 'selected':'' }>내용</option>
						<option value='notice_writer'
							${search.search eq 'notice_writer'? 'selected':'' }>작성자</option>
				</select></li>
				<li style="margin-right: 3px;"><input style="height: 32px;"
					placeholder="검색어를 입력하세요 !" type='text' value='${search.keyword }'
					name='keyword' class='w-px300'></li>
				<li style="margin-top: 4px;"><a class='search'
					onclick='$("form").submit()'>검색</a></li>
				<c:if test='${loginInfo.admin eq "Y"}'>
					<li style="margin-top: 3px;"><a class='new-btn' href='new.no'>글쓰기</a></li>
				</c:if>
			</ul>

		</div>



	</form>


	<!--  <ul>관리자인 경우만 글쓰기 가능 -->

	<!-- 	</ul> -->
	<table class='tb-list' style="width: 1400px;">
		<colgroup>
			<col width='100px'>
			<col>
			<col width='140px'>
			<col width='140px'>
			<col width='100px'>
		</colgroup>
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>작성일자</th>
			<th>첨부파일</th>
		</tr>
		<c:forEach items='${search.list}' var='vo'>
			<tr>
				<td>${vo.no}</td>
				<td style="text-align: left"><a
					href="detail.no?notice_num=${vo.notice_num }">${vo.notice_title}</a>
				</td>
				<td>${vo.notice_writer}</td>
				<td>${vo.notice_date}</td>
				<td>${empty vo.file_name ? '':'<i class="font-c fa-solid fa-paperclip"></i>' }

				</td>
			</tr>
		</c:forEach>


	</table>

	<script>
		
	</script>

</body>
</html>