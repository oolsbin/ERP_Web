<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix='c'%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
h3{
	text-align: center;
	padding: 3rem 0;
}
table {
	margin-top: 5px;
	margin-bottom : 10px;
	/* 	border-top-left-radius: 20px; */
	/*     border-top-right-radius: 20px; */
	border-radius: 15px;
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
	width : 120px;

}

.dataTable-selector {
    width: 8rem;
    text-align: center;
 }
 
code_name {
  	width: 8rem;
    text-align: center;
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

.bottom {
margin-bottom : 3rem;
}

</style>
</head>
<body>
<h3>코드정보수정</h3>
<form class='bottom' method='get' action='common.update'>
<input type='hidden' name='code_value' value='${vo.code_value}'>
<table class='w-px600'>
<tr><th class='w-px160'>코드유형</th>
	<td>${vo.code_comment }
<!-- 	<td>	<select class="dataTable-selector" name="code_title" onchange='$("#code").val("code_title");'> -->
<%-- 						<c:forEach items='${code_titles}' var='c'> --%>
<%-- 							<option ${vo.code_title eq c.code_title ? 'selected' : ''} --%>
<%-- 								value='${c.code_title}'>${c.code_title}</option> --%>
<%-- 						</c:forEach> --%>
<!-- 						</select> -->
	</td>
</tr>
<tr><th>코드번호</th>
	<td>${vo.code_value }
<!-- 	<td>	<select class="dataTable-selector" name="code_value" onchange='$("#code").val("code_value");'> -->
<%-- 						<c:forEach items='${code_values}' var='v'> --%>
<%-- 							<option ${vo.code_value eq v.code_value ? 'selected' : ''} --%>
<%-- 								value='${v.code_value}'>${v.code_value}</option> --%>
<%-- 						</c:forEach> --%>
<!-- 						</select> -->
	</td>
</tr>
<tr><th>승인여부</th>
	<td>
		<select class="dataTable-selector" name="code_used" onchange='$("#code").val("code_used");' >
						<c:forEach items='${code_used}' var='u'>
							<option ${vo.code_used eq u.code_used ? 'selected' : ''} 
									value='${u.code_used}'>${u.code_used}
							</option>
						</c:forEach>
					</select>
	</td>
</tr>
<tr><th>코드구분</th>
	<td>
		<input type="text" placeholder="${vo.code_name }" id="code_name" name="code_name" style="width:8rem;text-align: center;"/>
				</td>
			</tr>
			<tr>
				<th>코드생성일</th>
				<td><fmt:setLocale value="en_US" scope="session"/>
					<fmt:parseDate value="${vo.code_birth}" var="dateFmt" pattern="E MMM dd HH:mm:ss z yyyy"/>
	            	<fmt:formatDate value="${dateFmt}" pattern="yyyy-MM-dd"/></td>
			</tr>
			<tr>
				<th>코드생성자</th>
				<td>${vo.code_maker_name }
					</td>
			</tr>
		</table>
	</form>
	<div class='center'>
		<a class='new-btn' id='save' onclick='$("form").submit()'>저장</a> <a
			class='new-btn' href='common.detail?code_value=${vo.code_value}'>취소</a>
	</div>
</body>

<script type="text/javascript">
var oldVal = '';
$("#code_name").on("propertychange change keyup paste input", function() {
    var currentVal = $(this).val();
    if(currentVal == oldVal) {
        return;
    }
 
    oldVal = currentVal;
    
// const code_name = document.querySelector('#code_name');
// document.querySelector('#save').onclick = function() {  
	
	$.ajax({
        url:'common.check_code',
        data: { code_value:currentVal },
        success: function(result) {
           console.log(result);
           if(result == '1'){
        	   alert('이미 사용 중인 코드입니다.');
           }
        }
    });//사용중인 코드가 중복이 불가능하게 처리
// }
    
});
</script>

</html>