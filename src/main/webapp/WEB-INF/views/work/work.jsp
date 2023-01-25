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
body{
width : 1200px;
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
</style>
</head>
<body>

	<a action="work_end_input" method="post" id="input" />
	
	<!-- end page title -->
	<h2>출/퇴근 관리</h2>
	
	<div style="width :113%">
		<div class="row mb-4" style="margin-top: 34px;">
			<div class="col-lg-12">
				<div class="card">
					<div class="card-body">
						<div class="row">
							<div class="col-lg-4">
								<div class="d-flex">
									<div class="flex-grow-1 align-self-center">
										<div class="text-muted">
											<p class="mb-2" id="times"></p>
											<h5 class="mb-1">${vo.name}</h5>
											<p class="mb-0">${vo.employee_id}/${vo.position_name}</p>
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
		
		<div class="row mb-4">
			<div class="">
				<div class="row">
					<div class="">
						<div class="card">
							<div class="card-body">
								<div class="d-flex align-items-center mb-3">
									<div class="avatar-xs me-3">
										<span
											class="avatar-title rounded-circle bg-primary bg-soft text-primary font-size-18">
											<i class="bx bx-time-five"></i>
										</span>
									</div>
									<h5  class="font-size-16 mb-0">이번달 근무시간</h5>
								</div>
								<h5 class="font-size-15">
									<span class="float-end">31%</span>
								</h5>
								<div class="progress animated-progess progress-md">
									<div class="progress-bar" role="progressbar" style="width: 31%"
										aria-valuenow="31" aria-valuemin="0" aria-valuemax="100"></div>
								</div>
								<div class="">
									<div class="mt-3">
										<a id="start_btn" type="button"
											class="btn btn-light waves-effect ">출근하기</a> <input
											name="start_work" id="start_work">${wVo.start_work}
		
									</div>
									<div class="mt-2">
										<a id="end_btn" type="button"
											class="btn btn-light waves-effect">퇴근하기</a> <input
											name="end_work" id="end_work">${wVo.end_work}
									</div>
								</div>
		
							</div>
						</div>
					</div>
				</div>
		
			</div>
		
		</div>
		<!-- end row -->
		
		<div>
			<h5 style="margin:20px "class="font-size-16 mb-0">나의 근무 이력</h5>
		</div>
		
		<!--  work_result table 에서 가져온다 -->
		<table style="width: 1350px;">
			<thead>
				<tr>
					<th scope="col">일자</th>
					<th scope="col">출근 시간</th>
					<th scope="col">퇴근 시간</th>
		
					<th scope="col">근무 형태</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach begin="0" end="7" items="${workList}" var="woR">
					<tr>
						<td>${woR.work_date}</td>
						<c:if test="${empty woR.start_work }">
						<td>-</td>
					</c:if>
					<c:if test ="${not empty woR.start_work}">				
						<td>${woR.start_work}</td>
					</c:if>
					<c:if test="${empty woR.end_work }">
						<td>-</td>
					</c:if>
					<c:if test ="${not empty woR.end_work}">
						<td>${woR.end_work}	</td>
					</c:if>
		
						<td>${woR.work_status}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		</div>
</body>
<!-- <script type="text/javascript">
	$(document).ready(function() {
		test(end_work, start_work);
	})
	
	function test(String end, String start ) {
		var test1 = "2022-11-15 "+ end;
		var test2 = "2022-11-15 "+ start;

		test1 = new Date(test1);
		test2 = new Date(test2);

		var test3 = (test2 - test1) / (60 * 60 * 1000);

		console.log(test3);
	}
</script> -->
<script>
	const a = document.querySelector('#start_btn');
	const b = document.querySelector('#end_btn');

	b.onclick = function() {
		
		
		$('#end_work').val(
				String(new Date().getHours()).padStart(2,'0')+ ':' + String(new Date().getMinutes()).padStart(2,'0')+ ':'
						+String(new Date().getSeconds()).padStart(2,'0'));
		
		$('#input').submit();
		work_end_input();

	}
	a.onclick = function() {
		$('#start_work').val(
				String(new Date().getHours()).padStart(2,'0')+ ':' + String(new Date().getMinutes()).padStart(2,'0')+ ':'
				+String(new Date().getSeconds()).padStart(2,'0'));
		$('#input').submit();
		
		work_start_input();
			
		 

		/* 		if($('#start_work').val()){			
		 }else {
		 alert('이미 출근되었습니다 ');
		 } */
	}

	function work_end_input() {
		$.ajax({
			url : 'work_end_input',
			data : {
				end_work : $('#end_work').val()
			},
			success : function(response) {
				console.log($('#end_work').val());
				if (response)
					alert('퇴근 되었습니다');
				location.reload(true);
			}
		});
	}

	function work_start_input() {
		$.ajax({
			url : 'work_start_input',
			data : {
				start_work : $('#start_work').val()
			},
			success : function(response) {
				console.log($('#start_work').val());
				if (response) {
					alert('출근 되었습니다');
					location.reload(true);
					/* 	if($('#start_work').val() != null ){
							alert('이미 출근 되었습니다');
							
						}	 */
				}
			},
			error : function(req, text) {
				alert('이미 출근 되었습니다');

			}
		});
	}
	
</script>
</html>
