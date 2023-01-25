<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix='c'%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Insert title here</title>
<style>
#l-center{
	position: absolute;
	left: 50%;
	top: 50%;
	transform: translate(-50%, -50%);
	text-align: center;
}
#l-box{
	border: 1px solid #cfd0d1;
	width: 500px;
	height: 300px;
	margin: 0 auto;
}
#l-img{
	width: 70px;
	margin-bottom: 30px;
	cursor: pointer;
}
#naver{
	background: url("imgs/naverlogin.png") no-repeat center;
	background-size: cover;
	border-color: #fff;
}
#kakao{
	background: url("imgs/kakaologin.png") no-repeat center;
	background-size: cover;
	border-color: #fff;
}
#l-center input[type=text], #l-center input[type=password]{
	width: 250px;
	height: 35px;
	padding: 10px;
	box-sizing: border-box;
	margin-bottom: 5px;
}

#l-center input[type=button]{
	width: 250px;
	height: 35px;
	padding: 0;
	box-sizing: border-box;
	margin-bottom: 5px;
}

::placeholder{
	font-size: 14px;
}
#l-center li{
	width: 400px;
}
#login{
	cursor: pointer;
	font-size: 20px;
}
#findPw{
	font-size: 17px;
	font-weight: normal; 
	cursor: pointer;
}

</style>
</head>
<body>
<div id='l-center'>
<a href="<c:url value='/'/>"><img src="imgs/icons/icon-48x48.png" id='l-img'></a>
	<div id='l-box'>
		<ul style='margin: 0; padding: 40px'>
			<li><input type='text' id='employee_id' name='employee_id' placeholder='EMPLOYEE_ID'></li>
			<li><input type='password' id='pw' name='pw' placeholder='password'></li>
			<li><input type='button' onclick='login()' id='login' value='login' class='frontBtn-fill'></li>
			<hr>
			<li><input type='button' id='naver'></li>
			<li><input type='button' id='kakao'></li>
		</ul>
	</div>
	<br>
	<a id='findPw'>find password</a>
</div>
<script>
const employee_id = document.querySelector('#employee_id');
const pw = document.querySelector('#pw');

$('#pw').keyup(function(e){
	if( e.keyCode==13 ) login();
});

function login(){
	if( emptyCheck() )	{
		
		$.ajax({
			url: 'checkLogin.mem',
			data: { employee_id:$('#employee_id').val(), pw:$('#pw').val() },
			success: function( response ){
				if( response )
					location = '<c:url value="/"/>';
				else{
					alert('사원번호나 비밀번호가 일치하지 않습니다!');
					$('#employee_id').focus();
				}
				
			},error: function(req, text){
				alert(text+ ':' + req.status);
			}
		});
	}
}

$('#login').click(function(){
	login();
});

function emptyCheck(){
	var ok = true;
	$('.chk').each(function(){
		if( $(this).val()=='' ){
			var item = $(this).attr('placeholder')
						? $(this).attr('placeholder') : $(this).attr('title');
			alert(item + ' 입력하세요!');
			$(this).focus();
			ok = false;
			return ok;			
		}
	});
	return ok;
}

</script>

</body>
</html>