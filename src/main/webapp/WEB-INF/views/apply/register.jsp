<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<!-- <link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />   -->
 <script src='https://code.jquery.com/jquery-3.6.1.min.js'></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<script src='js/recruit.js?<%=new java.util.Date() %>'></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/js/all.min.js"></script>
<script src='js/apply_pic.js?<%=new java.util.Date() %>'></script>
<script src='js/apply.js?<%=new java.util.Date() %>'></script>



<style>
h3{
	margin : 3rem 0;
}
select{
	width:185px;
}

table {
	margin-top : 60px;
	margin-bottom : 20px;
/* 	border-top-left-radius: 20px; */
/*     border-top-right-radius: 20px; */
	border-radius : 15px;
	border-collapse: collapse;
	overflow: hidden;
	box-shadow: 0 0 20px rgba(0, 0, 0, 0.4);
}
td a{
	color : #323232;
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
.new-btn{
  padding: 1em 2.2em;
  font-size: 14px;
  font-weight: 400;
  font-family:'Noto Sans KR', sans-serif;
  border-radius: 4px;
  cursor: pointer;
  -webkit-appearance: none;
     -moz-appearance: none;
          appearance: none;
  border: none;
  color: #ffffff;
  margin-bottom: 10px;
	background : #12192c;
}
</style>
</head>
<body>
	<h3 class="center hrlist">합격자 사원등록</h3>
	<form action="insert_em.apply" method="post" >
	
		<table class="">
		<colgroup>
			<col width="200px">
			<col width="500px">
			
		</colgroup>
			<tr>
				<th>부서명</th>
				<td><select name="department_id" >
				<option value="-1">부서선택</option>
					<c:forEach items="${departments}" var="vo">
						<option value="${vo.department_id}">${vo.department_name}</option>
					</c:forEach>
				</select></td>
			</tr>
			<tr>
				<th>회사코드</th>
				<td><select name="company_cd" style="width:185px">
				<option value="-1">회사선택</option>
					<c:forEach items="${company}" var="vo">
						<option value="${vo.company_cd}">${vo.company_name}</option>
					</c:forEach>
				</select></td>
			</tr>
			<tr>
				<th class="">사원명</th>
				<td>
					<input type="text" name="name" value="${vo.apply_name }" placeholder="성명" style="width:205px; "/>
				</td>
			</tr>
			<tr>
				<th class="">이메일</th>
				<td>
					<input type="text" name="email"  value="${vo.apply_email }" placeholder="이메일" style="width:205px;"/>
				</td>
			</tr>
			<tr>
				<th class="">전화번호</th>
				<td>
					<input type="text" name="phone"  value="${vo.apply_phone }" placeholder="전화번호" style="width:205px;"/>
				</td>
			</tr>
			<tr>
				<th class="">관리자</th>
				<td>
					<label><input type="radio" name="admin" value="y">Y</label>
					<label><input type="radio" name="admin" value="n" checked>N</label>
				</td>
			</tr>
			<tr>
				<th>직급</th>
				<td><select name="position" style="width:185px">
				<option value="">직급선택</option>
					<c:forEach items="${position}" var="vo">
						<option value="${vo.position}">${vo.position_name}</option>
					</c:forEach>
				</select></td>
			</tr>
			<tr>
				<th>고용형태</th>
				<td><select name="employee_pattern" style="width:185px">
				<option value="">고용유형선택</option>
					<c:forEach items="${pattern}" var="vo">
						<option value="${vo.employee_pattern}">${vo.employee_pattern_name}</option>
					</c:forEach>
				</select></td>
			</tr>
		</table>
		<input type='hidden' name='apply_num' value="${vo.apply_num }">
		
	</form>
	
	<div class='center'>
		<a class='new-btn' id='save'>저장</a>
		 <a class='new-btn' href='pass_check.apply'>취소</a>
	</div>
	<script>
	$('#save').click(function(){
		
		if( emptyCheck() ) $('form').submit();
	});
	
	</script>
</body>
</html>