<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<title>Insert title here</title>

<%-- <link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  
<link href='css/recruit.css?<%=new java.util.Date() %>' type='text/css' rel='stylesheet'> --%>

<script src='https://code.jquery.com/jquery-3.6.1.min.js'></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<script src='js/recruit.js?<%=new java.util.Date()%>'></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/js/all.min.js"></script>
<style>


h2 {
    margin-left: 10.5rem;
    margin-top: 3rem;
    width: 1000px;
    font-weight: bold;
    color: #424242;
    font-size: 32px;
    font-family: 'Noto Sans KR' !important;
    padding-bottom: 30px;
    border-bottom: 2px solid #424242;
}

select {

    margin-top: 2rem;
	position: relative;
	left: .5%;
	width: 180px;
	padding: .5em 1.4em;
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

.pagination {
	width: 1490px;
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


table {
	margin-top: 15px;
	border-radius: 15px;
	border-collapse: collapse;
	overflow: hidden;
	box-shadow: 0 0 20px rgba(0, 0, 0, 0.4);
}

td a {
	color: #323232;
}

th, td {
	padding: 11px;
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
	left: 62%;
}

.button-second {
	background: #2b32b2;
	box-shadow: 0 3px 25px rgba(48, 37, 223, 0.7);
}
</style>
</head>
<body>
	<h2>지원자 조회</h2>
	<div style="margin-left: 10rem;">
		<form method='post' action='applicantList.apply' >
			<div id='list-top' class=''>
				<ul>
					<li>
					<select name='recruit_num' class='w-px100'
						onchange='$("form").submit()' style="width:300px;">
							<!-- name줘야 전달가넝 -->
							<option value='all'>전체 유형</option>
							<c:forEach items='${recruit_list}' var='re'>
								<option ${recruit_num eq re.recruit_num ? 'selected' : '' }
									value='${re.recruit_num}'>
									${re.recruit_title}</option>
							</c:forEach>
					</select>
					
		<select name='apply_check' class='w-px100' onchange='$("form").submit()'
			style="width: 100px;">
			<!-- name줘야 전달가넝 -->
			<option value='all'>전체</option>
			<c:forEach items='${pass_list}' var='pl'>
				<option ${apply_check eq pl.apply_check ? 'selected' : '' }
					value='${pl.apply_check}'>
					${pl.checkPass}</option>
			</c:forEach>
		</select>
					
					 <%-- <c:if test='${loginInfo.admin eq "Y"}'> --%> <a
						class='new-btn' style="position: left;" href='pass_check.apply'>합격자
							리스트</a> <%-- </c:if> --%>
		</li>			
				</ul>
			</div>
			
		</form>
		
		
		
		
		<!-- 테이블시작 -->
		<table style="width:1500px;">
			<colgroup>
				<col width='100px'>
				<col width='300px'>
				<col width='100px'>
				<col width='100px'>
				<col width='150px'>
				<col width='70px'>
		
			</colgroup>
			<tr>
		
				<th>유형</th>
				<th>공고</th>
				<th>지원자번호</th>
				<th>이름</th>
		
				<th>전화번호</th>
				<th>check</th>
		
		
			</tr>
			<c:forEach items='${applicants}' var='vo'>
				<tr>
					<td><a
						href="check.apply?apply_num=${vo.apply_num }">${vo.recruit_num}</a></td>
					<td style="text-align: left; padding-left: 20px"><a
						href="check.apply?apply_num=${vo.apply_num }">${vo.recruit_title}</a></td>
		
					<td><a
						href="check.apply?apply_num=${vo.apply_num }">${vo.apply_num }</a></td>
					<td ><a
						href="check.apply?apply_num=${vo.apply_num }"> ${vo.apply_name }
					</a></td>
					<%-- 
		<td>
		 <fmt:formatDate value="${vo.recruit_start}" pattern="yyyy-MM-dd"/>
		~
		 <fmt:formatDate value="${vo.recruit_end}" pattern="yyyy-MM-dd"/>
		
		</td>
		 --%>
					<td>${vo.apply_phone }</td>
					<td>${vo.checkPass }</td>
		
		
					<%-- <c:forEach items='${applicants}' var='vo'> --%>
		
					<%-- </c:forEach>  --%>
		
		
		
		
		
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