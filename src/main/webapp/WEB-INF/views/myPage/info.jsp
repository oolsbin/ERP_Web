<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
th {
	background: none;
}
</style>
<title>Insert title here</title>
</head>
<body>

	<h3>사원정보</h3>
	<form method='post' action='modify.mem'>
		<table class='w-px600'>
			<tr>
				<th class='w-px160'>이메일</th>
				<td>${Info.email}</td>
			</tr>
			<tr>
				<th>사원명</th>
				<td><input type='text' name='name' value='${Info.name }'>
				</td>
			</tr>
			<tr>
				<th>아이디</th>
				<td><input type='text' name='id' value='${Info.id }'></td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><input type='text' name='pw' value='${Info.pw }'></td>
			</tr>
			<tr>
				<th>성별</th>
				<td><label><input type='radio' name='gender' value='남'
						${Info.gender eq '남' ? 'checked' : ''}>남</label> <label><input
						type='radio' name='gender' value='여'
						<c:if test='${Info.gender eq "여"}'>checked</c:if>>여</label></td>
			</tr>
			<tr>
				<th>전화번호</th>
				<td><input type='text' name='phone' value='${Info.phone }'></td>
			</tr>
			<tr>
				<th>주소</th>
				<td><input type='text' name='address' value='${Info.address }'></td>
			</tr>
			<tr>
				<th>사원 승인여부</th>
				<td><label><input type='radio' name='join_check'
						value='Y' ${Info.join_check eq 'Y' ? 'checked' : ''}>승인</label> <label><input
						type='radio' name='join_check' value='N'
						<c:if test='${Info.join_check eq "N"}'>checked</c:if>>미승인</label>
				</td>
			</tr>

		</table>
	</form>

	<h3>등록 사원 조회</h3>
	<table class='w-px600'>
		<tr>
			<th class='w-px160'>사번</th>
			<td>${emp.employee_id }</td>
		</tr>
		<tr>
			<th>부서명</th>
			<td>${emp.department_id }</td>
		</tr>
		<tr>
			<th>회사이름</th>
			<td>${emp.company_cd }</td>
		</tr>
		<tr>
			<th>이름</th>
			<td>${emp.name }</td>
		</tr>
		<tr>
			<th>직급</th>
			<td>${emp.position_name }</td>
		</tr>
		<tr>
			<th>업무형태</th>
			<td>${emp.employee_pattern_name }</td>
		</tr>

	</table>

	<div class='btnSet'>
		<a class='btn-fill' onclick='$("form").submit()'>저장</a> <a
			class='btn-empty' href='info.hr?id=${vo.employee_id}'>취소</a>
	</div>

</body>
</html>