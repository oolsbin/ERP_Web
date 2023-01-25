<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<title>Insert title here</title>
<style>
h2 {
    width: 1200px;
    margin: 3rem 0;
	font-weight: bold;
	color: #424242;
	font-size: 32px;
	font-family: 'Noto Sans KR' !important;
	padding-bottom: 30px;
	border-bottom: 2px solid #424242;
}
select::-ms-expand {
  display: none;
}
select {
	height : 62px;
 	width: 132px;
 	padding: .7em 1.9em;
  	font-family: inherit;
  	background: url('imgs/arrow.jfif') no-repeat 95% 50%; 
	-webkit-appearance: none;
  	-moz-appearance: none;
 	appearance: none;
	background-color: #f8f9fa;
	border: 0;
	border-radius: 5px;
}

body {
	width: 1200px
}

input {
	display: none;
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
	padding: 14px !important;
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
ul{
	padding-left : 0;
}
ul li {
	padding : 0;
}
</style>

</head>
<body>
	<a action="work_end_input" method="post" id="input" />

	
	<!-- end page title -->

	<h2>휴무관리</h2>
	<div style="width: 113%;">
	<div class="row mb-4"  style="margin-top: 34px;">
		<div class="col-lg-12">
			<div class="card">
				<div class="card-body" >
					<div class="row">
						<div class="col-lg-4">
							<div class="d-flex">
								<div class="flex-grow-1 align-self-center">
									<div class="text-muted">
										<p class="mb-2" id="times"></p>
										<h5 class="mb-1">${vo.name}&nbsp;[${vo.position_name}]</h5>
										<p class="mb-0">사 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;번 /
											${vo.employee_id}</p>
										<p class="mb-0">입사일자 / ${vo.hire_date}</p>
										<p class="mb-0">근속년수 / ${vo.hire_year }년차
									</div>
								</div>
							</div>
						</div>

						<div class="col-lg-4 align-self-center">
							<div class="text-lg-center mt-4 mt-lg-0">
								<div class="row">
									<div class="col-4">
										<div></div>
									</div>
									<div class="col-4">
										<div></div>
									</div>
								</div>
							</div>
						</div>

						<div class="col-lg-4 d-none d-lg-block">
							<div class="clearfix mt-4 mt-lg-0"></div>
						</div>
					</div>
					<!-- end row -->
				</div>
			</div>
		</div>
	</div>
	<!-- end row -->


	<div class="">
	
		<div class="card">
		<h5 style="margin:20px; ">휴가신청</h5>
			<div style="display: inline-flex;">
				<input style="width: 130px;  height : 50px; margin: 10px;" id="holiday_start_btn" type="date"
					min="<%=new SimpleDateFormat("yyyy-MM-dd").format(new Date())%>"
					class="btn btn-light waves-effect" value="휴가 시작일" /> 
					<input
					style="width: 130px; height : 50px; margin: 10px;" id="holiday_end_btn" type="date"
					min=""
					class="btn btn-light waves-effect" value="휴가 종료일" />
				<!-- </input> -->
				<div>
					<ul>
						<li><select style="height : 50px; margin: 10px;" name='holiday_category' id="category">
								<c:forEach items="${codeList}" var="code">
									<option ${code_value eq code.code_value ? 'selected' : ''}
										value="${code.code_value }">${code.code_name }</option>
								</c:forEach>
						</select></li>
					</ul>
				</div>
			</div>
			<div>
				<input  style="width:130px; height : 50px; margin:0 0 1rem 0.725rem;" id="holiday_submit_btn" type="button"
					class="btn btn-light waves-effect" value="휴가신청" />
			</div>
		</div>
	</div>

	<!-- end row -->

	<h5 style="margin: 15px; " class="font-size-16 ">휴가 소진 내역</h5>



	<!--  work_result table 에서 가져온다 -->
	<table class="table">
		<thead style="background: #12192C;">
			<tr>
				<th scope="col">휴가일자</th>
				<th scope="col">출근 시간</th>
				<th scope="col">퇴근 시간</th>
				<th scope="col">연차 종류</th>
			</tr>
		</thead>
		<tbody>
			
			<c:forEach items="${holiday_submit_list}" var="hol">
				<tr>
					<td><fmt:formatDate value="${hol.holiday_date}"
							dateStyle="full" pattern="yyyy년MM월dd일" /></td>
					<c:if test="${not empty hol.start_work }">
						<td>${hol.start_work}</td>
						<td>${hol.end_work}</td>
					</c:if>
					<c:if test="${empty hol.start_work }">
						<td>-</td>
					</c:if>
					<c:if test="${empty hol.end_work }">
						<td>-</td>
					</c:if>
					<td>${hol.work_status}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>


	<h5 class="font-size-16" style="margin: 15px;">휴가 신청 내역</h5>


	<!--  work_result table 에서 가져온다 -->
	<table class="table table-sm">
		<thead style="background: #12192C;">
			<tr>
				<th scope="col">휴가 일자</th>
				<th scope="col">휴가 구분</th>
				<th scope="col">신청 일자</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${hoList}" var="holE">
				<tr>
					<td><fmt:formatDate value="${holE.holiday_date}"
							dateStyle="full" pattern="yyyy년MM월dd일" /></td>
					<td>${holE.work_status}</td>
					<td><fmt:formatDate value="${holE.work_date}" dateStyle="full"
							pattern="yyyy년MM월dd일" /></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>
</body>
<script>
	
	const c = document.querySelector('#holiday_submit_btn');

	
	$('[id=holiday_start_btn]').change(function () {
	   	document.getElementById("holiday_end_btn").setAttribute('min' ,$('[id=holiday_start_btn]').val() )  ;
	});

	
	c.onclick = function() {
		if($('#holiday_start_btn').val()==""| $('#holiday_end_btn').val()==""){
			alert('휴가 신청 날짜를 입력하세요');
			return;
		}
		

		$.ajax({
			url : 'holiday_submit',
			data : {
				start_holiday : $('#holiday_start_btn').val(),
				end_holiday : $('#holiday_end_btn').val(),
				work_code : $('#category').val()

			},
			success : function(response) {
				console.log(response)
				alert('휴가 신청되었습니다');
				location.reload(true);
			},
			error : function(req, text) {
				alert('이미 신청된 휴가일입니다.');
			}
		});
	}
</script>
</html>