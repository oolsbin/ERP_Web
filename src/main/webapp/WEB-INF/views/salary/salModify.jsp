<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
	table {
	margin-top : 5px;
/* 	border-top-left-radius: 20px; */
/*     border-top-right-radius: 20px; */
	padding-bottom : 2rem;
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
  background : #12192c;
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
</style>
</head>
<body>
	<h2 class="center hrlist">${emp.name}님의 급여 조회</h2>
	
	<form action="insertCommission.sa" method="post">
	<input type='hidden' name='employee_id' value="${emp.employee_id }">
		<div class="">
			<table class="">
				<colgroup>
					<col width="200px">
					<col width="500px">
				</colgroup>
				<tr>
					<th>사번</th>
					<td>${emp.employee_id}</td>
				</tr>
				<tr>
					<th>부서명</th>
				<td>${emp.department_name}</td>
				</tr>
				<tr>
					<th>회사코드</th>
					<td>${emp.company_name}</td>
				</tr>
				<tr>
					<th>사원명</th>
					<td>${emp.name}</td>
				</tr>
			<tr>
				<th>직급</th>
				<td>${emp.position_name}</td>
			</tr>
			<tr>
				<th>기본급</th>
				<td><input name='salary' style="width : 150px; padding-left: 10px" type="text" placeholder='$${emp.salary }' /></td>
		
			</tr>
			<tr>
				<th>커미션 퍼센트</th>
				
				<td style="display: flex; justify-content:center;">
		 <fmt:parseNumber var = "commission_pct" integerOnly = "true" 
         type = "number" value = "${emp.commission_pct*100}" />
					<select name='commission' class='w-px100'  > <!-- name줘야 전달가넝 -->
							<option value='-1'>선택</option>
							<option ${commission_pct == 0.00 *100 ? 'selected' : '' } value='0.0'>0.00</option>
							<option ${commission_pct == 0.05 *100 ? 'selected' : '' } value='0.05'>0.05</option>
							<option ${commission_pct == 0.1 * 100 ? 'selected' : '' } value='0.10'>0.10</option>
							<option ${commission_pct == 0.15 *100 ? 'selected' : '' } value='0.15'>0.15</option>
							<option ${commission_pct == 0.2 * 100 ? 'selected' : '' } value='0.20'>0.20</option>
							<option ${commission_pct == 0.25 *100 ? 'selected' : '' } value='0.25'>0.25</option>
							<option ${commission_pct == 0.3 * 100 ? 'selected' : '' } value='0.30'>0.30</option>
					</select>
					
					</td>
			</tr>
			
			
			
			</table>
		</div>
	</form>
	<div class='center' style="margin-top: 25px">
	<a class='new-btn' onclick='$("form").submit()'>정보수정</a>
	<a class='new-btn' href='list.sa'>취소</a>
	</div>
</body>
</html>