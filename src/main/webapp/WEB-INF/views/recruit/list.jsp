<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css"
	type="text/css" />
<link href='css/common.css?<%=new java.util.Date()%>' type='text/css'
	rel='stylesheet'>
<script src='https://code.jquery.com/jquery-3.6.1.min.js'></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<script src='js/recruit.js?<%=new java.util.Date()%>'></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/js/all.min.js"></script>
<style>
body{
	height: 1000px;
}
table {
	margin-top: 10px;
	border-radius : 20px;
	border-collapse: collapse;
	overflow: hidden;
	margin-bottom : 18rem;
	box-shadow: 0 0 20px rgba(0, 0, 0, 0.4);
}
td a{
	color : #323232;
}
th, td {
	border-bottom: 1px solid #efefef;
  padding: 15px;
  background-color: rgba(255, 255, 255, 0.2);
  color: #000000;
}

th {
  text-align: center;
}
th {
  background-color: #12192c;
  color : #fff;
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

h3{
	margin-top : 5rem;
	margin-bottom : 3rem;
	text-align: center;
	color : #000;
}
.body-content{
    height: auto;
    min-height: 100%;
    padding-bottom: 400px;
}

select {
  position: relative;
  left : 31%;
  width: 180px;
  padding: .7em 1.9em;
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

.writing {
  position : relative;
  right: -95%;
  padding: 1em 2em;
  font-size: 14px;
  font-weight: 400;
  font-family:'Noto Sans KR', sans-serif;
  border-radius: 4px;
/*   cursor: pointer; */
/*   -webkit-appearance: none; */
/*      -moz-appearance: none; */
/*           appearance: none; */
  border: none;
  color: #1b1b1b;
  margin-bottom: 10px;
}

.writing-second {
color : white;
  background: #12192C;
  box-shadow: 0 3px 25px rgba(255, 255, 255, 0.1);
}


</style>
</head>
<body>
<div class="body-content">
	<h3>채용공고</h3>
	<form class='bottom' method='post' action='list.rec'>
		<div id='list-top' class='w-px1200 '>
			<select name='employee_pattern' class=''
					onchange='$("form").submit()'>
				<option value="all">전체유형</option>
					<c:forEach items='${code}' var='c'>
							<option ${code_value eq c.code_value ? 'selected' : '' }
								value='${c.code_value}'>${c.code_name }</option>
						</c:forEach>
				
			</select>
	<%-- <ul>
			<li>
				<select name='career' class='w-px100' onchange='$("form").submit()'> <!-- name줘야 전달가넝 -->
					<option value='all'>전체 유형</option>
					<c:forEach items='${code_career}' var='cc'>
					<option ${code_value eq cc.code_value ? 'selected' : '' } 
					value='${cc.code_value}' > ${cc.code_name }</option>
					</c:forEach>
				</select>
			</li>
		</ul> --%>
			
				<!-- 관리자인 경우만 글쓰기 가능 -->
				<c:if test='${loginInfo.admin eq "Y"}'>
					<a  style = "margin-right :1px"class='writing writing-second' href='new.rec'>글쓰기</a>
				 </c:if> 
					<a class='writing writing-second' href='applyList.apply'>지원하기</a>
		</div>
	</form>

	<!-- 테이블시작 -->
	<table class='w-px1200'>
		<colgroup>
			<col width='100px'>
			<col width='100px'>
			<col width='300px'>
			<col width='300px'>

		</colgroup>
		<tr>
			<th>유형</th>
			<th>유형</th>
			<th>제목</th>
			<th>접수기간</th>
		</tr>
		
		<c:forEach items='${recruitList}' var='vo'>
			<tr>
				<td>${vo.employee_pattern_name}</td>
				<td>${vo.career_name}</td>
				<td style="text-align: left"><a href="detail.rec?recruit_num=${vo.recruit_num }">
						${vo.recruit_title } </a></td>
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
	</div>
	
	<script>
		function page(no) {
			$('[name=curPage]').val(no);
			$('form').submit();
		}
	</script>
</body>
</html>