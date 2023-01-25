<%@page import="java.text.DecimalFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix='c'%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<style>
h2{
    margin: 3rem 0;
	font-weight: bold;
    color: #424242;
    font-size: 32px;
    font-family: 'Noto Sans KR' !important;
    padding-bottom : 30px; 
    border-bottom: 2px solid #424242;
}

.pagination{
    width: 1484px;
	background : #12192c;
    justify-content: center;
    border-bottom-left-radius: 20px;
    border-bottom-right-radius: 20px;
    box-shadow: 0 0 20px rgba(0, 0, 0, 0.4);
}

.pagination li{
	margin-right : 14px;
}

#pagination a {

	display:inline-block;
	margin-right:10px;
	cursor:pointer;
	
}
.w-px1600 {
	width: 1600px;
}
.center{
	text-align: center;
}
.hrlist{
 	margin : 3rem 0 ;
 	color : #000000;
 	font-size : 35px;
 	font-family: 'Noto Sans KR' !important;
}
table {
	margin-top : 5px;
	border-top-left-radius: 20px;
    border-top-right-radius: 20px;
	border-collapse: collapse;
	overflow: hidden;
	box-shadow: 0 0 20px rgba(0, 0, 0, 0.4);
}
td a{
	color : #323232;
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

.button-second {
  background: #2b32b2;
  box-shadow: 0 3px 25px rgba(48, 37, 223, 0.7);
}
.emp-wrap{
    position: relative;
    left: 5%;
}


table {
	margin-top: 5px;
/* 	border-top-left-radius: 20px; */
/* 	border-top-right-radius: 20px; */

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

select {
margin-left: 43px;
  position: relative;
  left : -2%;
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
ul{
	margin-bottom: 0;
}
</style>
<title>Insert title here</title>
</head>
<body style="width:1200px;">

	<h2>전 직원 출퇴근 조회</h2>
	
		 <form method='post' action='workList'>
			<div id='list-top' style="margin-bottom: 0;">
				<ul class="select-list" style="display:flex;margin-left : 10px">
					<li><input  style="height:48px"type="date" name="work_date" id="work_date" pattern="yy/MM/dd"  max="<%=new SimpleDateFormat("yyyy-MM-dd").format(new Date())%>"
					value="${work_date}"
					/></li>
					<li><select style=" height: 48px; margin-left: 10px;" name='department_id' class='w-px200'
						onchange='$("form").submit()'>
							<option value='-1'>전체 부서</option>
							<c:forEach items='${departments}' var='d'>
								<option ${department_id eq d.department_id ? 'selected' : ''}
									value='${d.department_id}'>${d.department_name}</option>
							</c:forEach>
					</select></li>
				</ul>
			</div>
		</form>

	
	<!--  work_result table 에서 가져온다 -->

	<table style="width: 1400px">
		<thead>
			<tr>
				<th scope="col">근무 일자</th>
				<th scope="col">사번</th>
				<th scope="col">이름</th>
				<th scope="col">부서</th>
				<th scope="col">출근시간</th>
				<th scope="col">퇴근시간</th>
				
			</tr>
		</thead>
		<tbody>
			<c:forEach items='${workList}' var='vo'>
				<tr>
				<c:if test="${empty vo.work_date }">
					<td>-</td>
				</c:if>
				<c:if test ="${not empty vo.work_date}">
					<td>${vo.work_date}	</td>
				</c:if>
					<td>${vo.employee_id}</td>
					<td>${vo.name}</td>
					<td>${vo.department_name}</td>
						
				<c:if test="${empty vo.start_work }">
					<td>-</td>
				</c:if>
				<c:if test ="${not empty vo.start_work}">				
					<td>${vo.start_work}</td>
				</c:if>
				<c:if test="${empty vo.end_work }">
					<td>-</td>
				</c:if>
				<c:if test ="${not empty vo.end_work}">
					<td>${vo.end_work}	</td>
				</c:if>
					
				</tr>
			</c:forEach>
		</tbody>
	</table>
		<ul class="pagination" style="width:1400px">
		    
		 	 </ul>
</body>
<script>
	function pagination(){
	var req_num_row=9;
	var $tr=jQuery('tbody tr');
	var total_num_row=$tr.length;
	var num_pages=0;
	if(total_num_row % req_num_row ==0){
		num_pages=total_num_row / req_num_row;
	}
	if(total_num_row % req_num_row >=1){
		num_pages=total_num_row / req_num_row;
		num_pages++;
		num_pages=Math.floor(num_pages++);
	}

jQuery('.pagination').append("<li><a class=\"prev\">Previous</a></li>");

	for(var i=1; i<=num_pages; i++){
		jQuery('.pagination').append("<li><a>"+i+"</a></li>");
  jQuery('.pagination li:nth-child(2)').addClass("active");
  jQuery('.pagination a').addClass("pagination-link");
	}

jQuery('.pagination').append("<li><a class=\"next\">Next</a></li>");

	$tr.each(function(i){
  jQuery(this).hide();
  if(i+1 <= req_num_row){
			$tr.eq(i).show();
		}
	});

	jQuery('.pagination a').click('.pagination-link', function(e){
		e.preventDefault();
		$tr.hide();
		var page=jQuery(this).text();
		var temp=page-1;
		var start=temp*req_num_row;
  var current_link = temp;
  
  jQuery('.pagination li').removeClass("active");
		jQuery(this).parent().addClass("active");

		for(var i=0; i< req_num_row; i++){
			$tr.eq(start+i).show();
		}
  
  if(temp >= 1){
    jQuery('.pagination li:first-child').removeClass("disabled");
  }
  else {
    jQuery('.pagination li:first-child').addClass("disabled");
  }
        
	});

jQuery('.prev').click(function(e){
    e.preventDefault();
    jQuery('.pagination li:first-child').removeClass("active");
});

jQuery('.next').click(function(e){
    e.preventDefault();
    jQuery('.pagination li:last-child').removeClass("active");
});

}

jQuery('document').ready(function(){
pagination();

jQuery('.pagination li:first-child').addClass("disabled");

});
	
	</script>
</html>











