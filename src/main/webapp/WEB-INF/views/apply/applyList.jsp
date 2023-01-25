<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">

 <script src='https://code.jquery.com/jquery-3.6.1.min.js'></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<script src='js/recruit.js?<%=new java.util.Date() %>'></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/js/all.min.js"></script>
<style>
.pagination {
	width: 1101px;
	background: #12192c;
	justify-content: center;
	border-bottom-left-radius: 20px;
	border-bottom-right-radius: 20px;
	box-shadow: 0 0 20px rgba(0, 0, 0, 0.4);
}

.pagination li {
	margin-right: 14px;
}

#pagination a {
	display: inline-block;
	margin-right: 10px;
	cursor: pointer;
}

.w-px1600 {
	width: 1600px;
}

.center {
	text-align: center;
}

.hrlist {
	margin: 1rem 0;
	color: #000000;
	font-size: 38px;
	font-family: 'Noto Sans KR' !important;
}

table {
	margin-top: 5px;
	
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
	text-align: center;
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
	
}
.btnSet{
text-align:center;
	margin-top: 30px;
}
.button-second {
	background: #2b32b2;
	box-shadow: 0 3px 25px rgba(48, 37, 223, 0.7);
}

select {
	position: relative;
 	left: 45%;
	width: 180px;
	padding: .7em 1.9em;
	font-family: inherit;
	background: url('imgs/arrow.jfif') no-repeat 95% 50%;
	-webkit-appearance: none;
	-moz-appearance: none;
	appearance: none;
	box-shadow: 0 1px 25px rgba(0, 0, 0, 0.2);
	border: 2px solid #fff[];
	border-radius: 3px;
}

select::-ms-expand {
	display: none;
}

td button {
	padding: .5em 1.3em;
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
	background: #63666c;
}
footer{
	top:50%
}

td button:nth-child(1) {
	margin-right: 10px;
}
</style>
</head>
<body>
<h2 class="center hrlist">채용공고 리스트</h2>
<form method='post' action='applyList.apply'>
<div id='list-top' class='w-px1000'>
	<ul>
		<li>
		
			<select name='employee_pattern' class='w-px140' onchange='$("form").submit()'> <!-- name줘야 전달가넝 -->
				<option value='all'>전체 유형</option>
				<c:forEach items='${code}' var='c'>
				<option ${code_value eq c.code_value ? 'selected' : '' } 
				
				value='${c.code_value}' > ${c.code_name }</option>
				</c:forEach>
				
			</select>
		
		</li>
		
	
	</ul>
	
</div>
</form>

<input type='hidden' name='recruit_num' value='${recruit_num}'>
<!-- 테이블시작 -->
<table class='w-px1000 tb-list'>
<colgroup>
	<col width='100px'>
	<col width='100px'>
	<col width="400px">
	<col width='300px'>
	
</colgroup>
<tr><th>유형</th>
	<th>유형</th>
	<th>제목</th>
	<th>접수기간</th>
	
</tr>
<c:forEach items='${recruitList}' var='vo'>
<tr><td>${vo.employee_pattern_name}</td>
	<td>${vo.career_name}</td>
	
	<td style="text-align:left"><a href="fillout.apply?recruit_num=${vo.recruit_num }">
	${vo.recruit_title }
	</a>
	</td>
	<%-- 
	<td>
	 <fmt:formatDate value="${vo.recruit_start}" pattern="yyyy-MM-dd"/>
	~
	 <fmt:formatDate value="${vo.recruit_end}" pattern="yyyy-MM-dd"/>
	
	</td>
	 --%>
 	<td>${vo.char_recruit_start}~${vo.char_recruit_end }</td>
	
	
</tr>
</c:forEach>
</table>

<div class='btnSet'>
	<a class='new-btn' href='application.apply'>나의지원서보기</a>
</div>
<script>

</script>

</body>
</html>