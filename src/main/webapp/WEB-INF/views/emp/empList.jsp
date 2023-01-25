<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<style>

h2 {
	margin: 2rem 9rem;
	font-weight: bold;
	color: #424242;
	font-size: 32px;
	font-family: 'Noto Sans KR' !important;
	padding-bottom: 30px;
	border-bottom: 2px solid #424242;
}

select {
	width: 180px;
	padding: 0.6em 1.4em;
	font-family: inherit;
	background: url(imgs/arrow.jfif) no-repeat 95% 50%;
	-webkit-appearance: none;
	-moz-appearance: none;
	appearance: none;
	box-shadow: 0 1px 25px rgb(0 0 0/ 20%);
	border: 2px solid #bfbcbc;
	border-radius: 3px;
}

select::-ms-expand {
	display: none;
}

.pagination li a {
	font-weight: bold;
	font-size: 16px;
}

.pagination {
	width: 1484px;
	background: #12192c;
	justify-content: center;
	border-bottom-left-radius: 10px;
	border-bottom-right-radius: 10px;
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

table {
	margin-top: 5px;
	border-top-left-radius: 10px;
	border-top-right-radius: 10px;
	border-collapse: collapse;
	overflow: hidden;
	box-shadow: 0 0 20px rgba(0, 0, 0, 0.4);
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
	margin-left: 60px;
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
    /* position: relative; */
    left: 4%;
}

.button-second {
	background: #2b32b2;
	box-shadow: 0 3px 25px rgba(48, 37, 223, 0.7);
}

.emp-wrap {
	position: relative;
	left: 5%;
	top: 1%;
}
</style>
</head>
<body>
	<h2 class="">사원목록</h2>
	<div class="emp-wrap">
		
		<form action="list.hr" class="list" method="get">
			<div class="w-px1600">
				<div>
					<a class="new-btn" onclick='location="new.hr"'>신규사원등록</a>
					<select name='department_id' onchange='$("form").submit()'>
							<option value='-1'>전체 부서</option>
							<c:forEach items='${departments}' var='c'>
								<option ${department_id eq c.department_id ? 'selected' : ''}
									value='${c.department_id}'>${c.department_name}</option>
							</c:forEach>
					</select>
				</div>
		</form>

		<table class="table-hover">
			<colgroup>
				<col width="140px" />
				<col width="100px" />
				<col width="100px" />
				<col width="100px" />
				<col width="250px" />
				<col width="200px" />
				<col width="100px" />
				<col width="130px" />
				<col width="130px" />
				<col width="190px" />
			</colgroup>
			<thead>
				<tr>
					<th>사번</th>
					<th>부서명</th>
					<th>회사코드</th>
					<th>사원명</th>
					<th>이메일</th>
					<th>전화번호</th>
					<th>관리자</th>
					<th>입사일자</th>
					<!-- 					<th>업무제목</th> -->
					<th>직급</th>
					<th>업무형태</th>
				</tr>
			</thead>
			<c:forEach items="${list}" var="vo">
				<tbody class="">
					<tr class="" onClick="info(${vo.employee_id})">
						<td>${vo.employee_id}</td>
						<td>${vo.department_name}</td>
						<td>${vo.company_name}</td>
						<td>${vo.name}</td>
						<td>${vo.email}</td>
						<td>${vo.phone}</td>
						<td>${vo.admin}</td>
						<td>${vo.hire_date}</td>
						<%-- 						<td>${vo.job_id}</td> --%>
						<td>${vo.position_name}</td>
						<td>${vo.employee_pattern_name}</td>
					</tr>
				</tbody>
			</c:forEach>
		</table>
	</div>
	<div style="text-align: -webkit-center;">
		<ul class="pagination">
		</ul>
	</div>
	
</body>
<script>

	function info(id) {
		location.href='info.hr?id='+ id +'&no=' + $('.pagination li.active a').text();
	}

	function pagination() {
		var req_num_row = 10;
		var $tr = jQuery('tbody tr');
		var total_num_row = $tr.length;
		var num_pages = 0;
		if (total_num_row % req_num_row == 0) {
			num_pages = total_num_row / req_num_row;
		}
		if (total_num_row % req_num_row >= 1) {
			num_pages = total_num_row / req_num_row;
			num_pages++;
			num_pages = Math.floor(num_pages++);
		}

		jQuery('.pagination').append("<li><a class=\"prev\">Previous</a></li>");
		for (var i = 1; i <= num_pages; i++) {
			jQuery('.pagination').append("<li><a data-page = "+ i +">" + i + "</a></li>");
			jQuery('.pagination li:nth-child(2)').addClass("active");
			jQuery('.pagination a').addClass("pagination-link");
		}

		jQuery('.pagination').append("<li><a class=\"next\">Next</a></li>");

		$tr.each(function(i) {
			jQuery(this).hide();
			if (i + 1 <= req_num_row) {
				$tr.eq(i).show();
			}
		});
		//페이지 클릭 이벤트
		jQuery('.pagination a').click('.pagination-link', function(e) {
			e.preventDefault();
			$tr.hide();
			var page = jQuery(this).text();
			var temp = page - 1;
			var start = temp * req_num_row;
			var current_link = temp;

			jQuery('.pagination li').removeClass("active");
			jQuery(this).parent().addClass("active");

			for (var i = 0; i < req_num_row; i++) {
				$tr.eq(start + i).show();
			}

			if (temp >= 1) {
				jQuery('.pagination li:first-child').removeClass("disabled");
			} else {
				jQuery('.pagination li:first-child').addClass("disabled");
			}

		});

		jQuery('.prev').click(function(e) {
			e.preventDefault();
			jQuery('.pagination li:first-child').removeClass("active");
		});

		jQuery('.next').click(function(e) {
			e.preventDefault();
			jQuery('.pagination li:last-child').removeClass("active");
		});

	}

	jQuery('document').ready(function() {
		pagination();
		if(${no != -1 }){
		console.log('asd', $('.pagination li.active a').data('page'));
		 $('[data-page=${no}]').trigger('click');
		}
		jQuery('.pagination li:first-child').addClass("disabled");

	});
	
	$(document).ready(function() {
		$('body').fadeIn(3000);
	});
</script>
</html>