<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
<!DOCTYPE html>
<html>
<meta charset="UTF-8">
<style>
h3{
	margin: 3rem 0 !important;
    padding-bottom: 1rem;
	border-bottom: 2px solid #424242;
	font-weight: 700 !important;
	color: #424242;
	width: 800px;
	font-size: 32px !important;
	
}

table {
	margin-top: 10px;
	border-radius : 20px;
	border-collapse: collapse;
	overflow: hidden;
	margin-bottom : 30px;
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
	border-bottom: 1px solid #efefef;
  	position: relative;
}
tbody td:hover:before {
  
  background-color: rgba(255, 255, 255, 0.2);
  z-index: -1;
}

.new-btn{
  padding: 1em 1.8em;
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
	position: relative;
	left: 4%;
}

select {

  width: 230px;
  padding: .6em 1.2em;
  font-family: inherit;
  background: url('imgs/arrow.jfif') no-repeat 95% 50%; 
  -webkit-appearance: none;
  -moz-appearance: none;
  appearance: none;
  border: 1px solid #999;
  border-radius: 0px;
}
.input{
  width: 230px;
}
</style>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
</head>
<body>
	<h3>사원정보수정</h3>
	<form action="update.hr" method="post">
	<input type="hidden" name="employee_id" value="${vo.employee_id}" />
		<div >
			<table class="w-px1000">
			<colgroup>
				<col width="200px" />
				<col width="600px" />
			</colgroup>
				<tr>
					<th>사번</th>
					<td>${vo.employee_id}</td>
				</tr>
				<tr>
					<th>부서명</th>
				<td><select name="department_id">
					<c:forEach items="${departments}" var="d">
						<option value="${d.department_id}" ${vo.department_id == d.department_id ? 'selected' : ''}>${d.department_name}</option>
					</c:forEach>
				</select></td>
				</tr>
				<tr>
					<th>회사코드</th>
					<td><select name="company_cd">
						<c:forEach items="${company}" var="c">
							<option value="${c.company_cd}" ${vo.company_cd == c.company_cd ? 'selected' : ''}>${c.company_name}</option>
						</c:forEach>
				</select></td>
				</tr>
				<tr>
					<th>사원명</th>
					<td><input class="input" type="text" name="name" value="${vo.name}" /></td>
				</tr>
				<tr>
					<th>이메일</th>
					<td><input class="input" type="text" name="email" value="${vo.email}" /></td>
				</tr>
				<tr>
			</tr>
			<tr>
				<th class="">전화번호</th>
				<td>
					<input class="input" type="text" name="phone" value="${vo.phone}" />
				</td>
			</tr>
			<tr>
				<th class="">관리자</th>
				<td>
					<label style="margin-right: 20px;"><input type="radio" name="gender" value="Y">Y</label>
					<label><input type="radio" name="gender" value="N" checked>N</label>
				</td>
			</tr>
			<tr>
				<th>직급</th>
				<td><select name="position">
				<option value="">${vo.position_name}</option>
					<c:forEach items="${position}" var="p">
						<option value="${p.position}" ${vo.position == p.position ? 'selected' : ''}>${p.position_name}</option>
					</c:forEach>
				</select></td>
			</tr>
			<tr>
				<th>고용형태</th>
				<td><select name="employee_pattern">
					<c:forEach items="${pattern}" var="emp">
					<option value="${emp.employee_pattern}" ${vo.employee_pattern == emp.employee_pattern ? 'selected' : ''}>${emp.employee_pattern_name}</option>
					</c:forEach>
				</select></td>
			</tr>
			</table>
		</div>
	</form>
	<div class='center'>
		<a class='new-btn' onclick='$("form").submit()'>저장</a>
		 <a class='new-btn' href='list.hr'>취소</a>
	</div>
</body>
</html>