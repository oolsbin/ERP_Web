<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%-- <%@ page isELIgnored="false" %> --%>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href='css/styles.css?<%=new java.util.Date() %>' type='text/css' rel='stylesheet'>
<link href='css/common.css?<%=new java.util.Date() %>' type='text/css' rel='stylesheet'>
<style>

body{
	width : 1200px;
	margin-left : 9rem;
	margin-top : 2rem;
}

table {
	margin : 1rem 0!important;
	border-radius : 10px;
	border-collapse: collapse;
	overflow: hidden;
	box-shadow: 0 0 20px rgba(0, 0, 0, 0.4);
	padding: 20px 0;
	margin-bottom: 8rem;
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

h3{	
	width: 800px;
    margin-top: 3rem;
	font-weight: bold;
    color: #424242;
    font-size: 32px;
    font-family: 'Noto Sans KR' !important;
    padding-bottom : 30px; 
    border-bottom: 2px solid #424242;
}

select, option{
  width: 230px;
  padding: .5em 1.2em;
  font-family: inherit;
  background: url('imgs/arrow.jfif') no-repeat 95% 50%; 
  -webkit-appearance: none;
  -moz-appearance: none;
  appearance: none;
  border: 1px solid #999;
  border-radius: 0px;
}
</style>
</head>
<body>
	<!-- <h2 class="center hrlist">코드관리</h2> -->
	<form action="common.cd">

<!-- 		<div class="card mb-4"> -->
	<h3 class="">코드관리</h3>
   <div class=""style="margin-top:2rem;">
       <div class="">
       	<div class="">
       		<div class="">
       			<input type='hidden' name='code' id='code'>
       			<label>
       				<select class="dataTable-selector" name="code_comment" onchange='$("#code").val("code_comment"); $("form").submit()'>
       				<option class="title" value="all">코드유형</option>
						<c:forEach items='${code_commentt}' var='v'>
							<option ${code_comment eq v.code_comment ? 'selected' : ''} 
									value='${v.code_comment}'>${v.code_comment}
							</option>
						</c:forEach>
					</select>
					
<!-- 					<select class="dataTable-selector" name="code_value" onchange='$("#code").val("code_value"); $("form").submit()'> -->
<!--        				<option value="all">문서코드</option> -->
<%-- 						<c:forEach items='${code_values}' var='c'> --%>
<%-- 							<option ${code_value eq c.code_value ? 'selected' : ''}  --%>
<%-- 									value='${c.code_value}'>${c.code_value} --%>
<!-- 							</option> -->
<%-- 						</c:forEach> --%>
<!-- 					</select> -->
					

					<select class="dataTable-selector" name="code_used" onchange='$("#code").val("code_used"); $("form").submit()'>
       				<option class='title' value="all">승인여부</option>

						<c:forEach items='${code_usedd}' var='c'>  <!-- 드롭다운이름 처리 -->
							<option ${code_used eq c.code_used ? 'selected' : ''} 
									value='${c.code_used}' >${c.code_used}
							</option>
						</c:forEach>
					</select>
					
<!-- 					<select class="dataTable-selector" name="code_name" onchange='$("#code").val("code_name"); $("form").submit()'> -->
<!--        				<option value="all">근무구분코드</option> -->
<%-- 						<c:forEach items='${code_name}' var='c'> --%>
<%-- 							<option ${code_name eq c.code_name ? 'selected' : ''}  --%>
<%-- 									value='${c.code_name}'>${c.code_name} --%>
<!-- 							</option> -->
<%-- 						</c:forEach> --%>
<!-- 					</select> -->
    			</label>
			</div>
		</div>
	
		</div>
<div class="">
<table id="datatablesSimple" class="dataTable-table">
	<thead>
	    <tr>
	     <th data-sortable="" style="width: 10%;">
	    	<span class="dataTable-sorter">코드유형</span>
	    </th>
        <th data-sortable="" style="width: 10%;">
        	<span class="dataTable-sorter">코드번호</span>
       	</th>
     	<th data-sortable="" style="width: 10%;">
     		<span class="dataTable-sorter">승인여부</span>
   		</th>
   		<th data-sortable="" style="width: 10%;">
     		<span class="dataTable-sorter">코드구분</span>
   		</th>
   		<th data-sortable="" style="width: 10%;">
   			<span class="dataTable-sorter">코드생성일</span>
		</th>
		<th data-sortable="" style="width: 13%;">
			<span class="dataTable-sorter">코드생성자</span>
		</th>
		</tr>
	</thead>   
      	<c:forEach items="${list}" var="vo">
            
            <tr><td><a href='common.detail?code_value=${vo.code_value}'>${vo.code_comment}</a></td>
            	<td>${vo.code_value}</td>
            	<td>${vo.code_used}</td>
            	<td>${vo.code_name}</td>
            	<td>
					<fmt:setLocale value="en_US" scope="session"/>
					<fmt:parseDate value="${vo.code_birth}" var="dateFmt" pattern="E MMM dd HH:mm:ss z yyyy"/>
            		<fmt:formatDate value="${dateFmt}" pattern="yyyy-MM-dd"/>
            	</td>
            	<td>${vo.code_maker_name}</td>
           	</tr>
           	</c:forEach>
        </table>
        </div><div class="dataTable-bottom"><div class="dataTable-info"></div></div>
        </div>

</form>
 
</body>
</html>