<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%-- <link href='css/recruit.css?<%=new java.util.Date() %>' type='text/css' rel='stylesheet'>

<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />   --%>
 <script src='https://code.jquery.com/jquery-3.6.1.min.js'></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<script src='js/recruit.js?<%=new java.util.Date() %>'></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/js/all.min.js"></script>

<script src='js/mypage.js?<%=new java.util.Date() %>'></script>

<style>
h2 {
	margin: 3rem 0;
	width : 800px;
	font-weight: bold;
	color: #424242;
	font-size: 32px;
	font-family: 'Noto Sans KR' !important;
	padding-bottom: 30px;
	border-bottom: 2px solid #424242;
}

body {
margin-top: 200px;
}
form{
    text-align: center;
	margin-top: 45px;
}
table {
	margin-top: 5px;
	/* 	border-top-left-radius: 20px; */
	/*     border-top-right-radius: 20px; */
	padding-bottom: 2rem;
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
	background: #12192c;
	color: #fff;
	width: 250px;
}
td {
 text-align: left;
 padding-left: 40px;
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
	position: relative;
	margin-right: 10px;
}

.margin {
	margin-top: 10px;
}

.valid {
color: green;
font-size: 14px;
font-weight: bold;
}

.invalid {
color: red;
font-size: 14px;
font-weight: bold;
}

table {
width: 800px;
margin: 0 auto;
}
.btn {
text-align: center;
margin-top: 60px;
}

</style>
</head>
<body>
<h2 class="">${loginInfo.name } 님 정보변경 </h2>

<form method='post' action='update.mypage'>
<input type='hidden' name='employee_id' value='${vo.employee_id}'>



<table class='w-px1000'>
<tr><th>이메일</th>
<td> 
<input type='text' class="chk" name='email' value="${vo.email }"
placeholder="이메일">
<div class='valid'>이메일 입력하세요</div>
</td>

<tr>
<th>휴대폰번호</th>
<td>
<input type='text'  class="chk" name='phone' value="${vo.phone }"
placeholder="휴대폰">
<div class='valid'>휴대폰번호를 입력하세요</div>
</td>
</tr>
<tr>
<th>비밀번호</th>
<td>
<input type='password'  class="chk" name='pw' value="${vo.pw }"
placeholder="비밀번호">
<div class='valid'>비밀번호 입력하세요</div>
</td>
</tr>
<tr>
<th>비밀번호 확인 </th>
<td>
<input type='password'  class="chk" name='pw_ck' id="pw_ck"
placeholder="비밀번호">
<div class='valid'>비밀번호 입력하세요</div>
</td>
</tr>



</table>
<div class='margin btn'>
	<a class='new-btn' id='save'>저장</a>
	<a class='new-btn' style="text-decoration: none;"
	href="<c:url value='/'/>">취소</a>
</div>
</form>

<script>
$('#pw_ck').keyup(function(e){
	if(e.keyCode==13) save();
});


$('#save').click(function() {
	save();
	
	
});

function save() {
	if ($('[name=email]').val() == '') {
		alert('name를 입력하세요!');
		$('[name=email]').focus();
		return;
	}
	if ($('[name=phone]').val() == '') {
		alert('phone를 입력하세요!');
		$('[name=phone]').focus();
		return;
	}
	if ($('[name=pw]').val() == '') {
		alert('비밀번호를 입력하세요!');
		$('[name=pw]').focus();
		return;
	}
	if ($('[name=pw_ck]').val() == '') {
		alert('비밀번호를 입력하세요!');
		$('[name=pw_ck]').focus();
		return;
	}

	

	if (tagIsInValid($('[name=pw]')))
		return;
	if (tagIsInValid($('[name=pw_ck]')))
		return;
	if (tagIsInValid($('[name=email]')))
		return;

	if (emptyCheck())
		$('form').submit();
}


function tagIsInValid(tag) {
	var status = member.tag_status(tag);
	if (status.code == 'invalid') {
		alert('정보변경 불가\n' + status.desc);
		tag.focus();
		return true;
		;
	} else
		return false;

}



$('.chk').keyup(
		function(e) {
			//아이디 태그에서 enter인 경우는 중복확인 처리 
			if ($(this).attr('name') == 'phone'
					&& e.keyCode == 13) {
				tagIsInValid(tag); 
			} else {
				$(this).removeClass('chked');
				var status = member.tag_status($(this));
				$(this).siblings('div').text(status.desc).removeClass(
						'valid invalid').addClass(status.code);

			}

		}); 

</script>


</body>
</html>