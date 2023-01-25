
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
#submitAndCancel {
	margin-top: 5px;
	display: flex;
	justify-content: center;
}

#submitAndCancel a{
	margin-left: 5px;
	font-size: 15px;
	cursor: pointer;
}

#memberTable{
	text-align: left;
	width: 660px;
}
#memberTable th {
	text-align: center;
	width: 120px;
	color: white;
	font-weight: lighter;
}
.memberBtn{
	display: inline-block;
	height: 24px;
	padding: 1px 6px;
	border: 1px solid #222e3c;
	border-radius: 3px;
	background-color: #222e3c;
	color: #fff;
}

.valid{}
.invalid{}

input[type=text]{
	width: 185px;
}

</style>
</head>
<body>
<!-- 	<h1 style='text-align: center'>Join</h1> -->
	
	<form id='memberForm' class='centerFrame' method='post' action='insert.mem'>
		<table id='memberTable'>
			<tr><th>Name *</th>
				<td><input type='text' id='name' name='name' required></td>
			</tr>
			<tr><th>ID *</th>
				<td><input type='text' name='id' id='id' class='chk invalid invalidID'>
					<input type='button' id='IDCheck' value='Confirm ID duplication' class='memberBtn hover' >
					<div id='div_i'>Check the ID duplication</div>
				</td>
			</tr>
			<tr><th>Password *</th>
				<td><input type='password' name='pw' id='pw' class='chk invalid'>
					<div id='div_p'>8 digits and contains one or more letters, numbers, or special characters</div>
				</td>
			</tr>
			<tr><th>Password *</th>
				<td><input type='password' name='pw_chk' id='pw_chk' class='chk invalid'>
					<div id='div_p_chk'>Enter your password again</div>
				</td>
			</tr>
			<tr><th>Email *</th>
				<td><input type='text' name='email' id='email' class='chk invalid'>
					<div id='div_e'>Please enter your email</div>
				</td>
			</tr>
			<tr><th>Gender *</th>
				<td><label><input type='radio' name='gender' value='male' checked>male</label>
					<label><input type='radio' name='gender' value='female'>female</label>
				</td>
			</tr>
			<tr><th>Phone Number</th>
				<td><input type='text' name='phone' id='phone'>
					<div>Please enter your phone number</div>
				</td>
			</tr>
			
			<tr><th>Address</th>
				<td>
					<input type='text' name='post' id='post' placeholder='Post'>
					<input type='button' value='Find a postal code' onclick='findPostalCode()' class='memberBtn hover'><br>
					<input type='text' name='address' id='address' style='width: 420px' placeholder='Address'><br>
					<input type='hidden' name='extraAddr' id='extraAddr'>
					<input type='text' name='detailAddr' id='detailAddr' style='width: 200px' placeholder='Detailed address'>
				</td>
			</tr>
		</table>
		<div id='submitAndCancel'>
			<a class='sideBtn-fill' id='join'>Join</a>
			<a class='sideBtn-empty' onclick="location='<c:url value='/' />'">Cancel</a>
		</div>
	</form>
	
	<script src='js/join.js?<%=new java.util.Date()%>'></script>
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
	const chks = document.querySelectorAll('.chk');
	for(let i = 0; i < chks.length; i++){
		chks[i].onkeyup = function(){
			chks.js/join.param(chks[i])
		}//chks[i].onkeyup = function()
	}//for
			
	function findPostalCode(){
		new daum.Postcode({
	        oncomplete: function(data) {
				var addr = '';
				var extraAddr = '';

                if (data.userSelectedType === 'R') { 
                    addr = data.roadAddress;
                } else { 
                    addr = data.jibunAddress;
                }
                if(data.userSelectedType === 'R'){
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    document.getElementById("extraAddr").value = extraAddr;
                
                } else {
                    document.getElementById("extraAddr").value = '';
                }
                document.getElementById('post').value = data.zonecode;
                var detailAddr = document.getElementById('detailAddr').value;
                document.getElementById("address").value = addr+extraAddr+detailAddr;
                document.getElementById("detailAddr").focus();
	        }
	    }).open();
	}//findPostalCode()
	
//Confirm ID duplication
const id = document.querySelector('#id');
document.querySelector('#IDCheck').onclick = function(){
	$.ajax({
        url:'checkId',
        data: { id:id.value },
        success: function(result) {
            if (result) {
            	alert("사용가능한 아이디입니다");
            	id.classList.remove('invalidID')
            	id.classList.add('validID')
            }else {
                alert("이미 사용중인 아이디입니다");
                id.classList.remove('validID')
            	id.classList.add('invalidID')
            }
        }
    });	//ajax
}//checkId.onclick = function(){

//checking before submit()
const pw = document.querySelector('#pw');
const pw_chk = document.querySelector('#pw_chk');
const email = document.querySelector('#email');
const name = document.querySelector('#name');
document.querySelector('#join').onclick = function(){
	console.log(name.required)	
	console.log(! name.required)	

	if( name.value.toString()<1 ){
		alert('이름을 입력하세요')
		return;
	}else if( id.classList.contains('invalid') ){
		alert('아이디를 확인하세요')
		return;
	}else if( id.classList.contains('invalidID') ){
		alert('아이디 중복체크를 해주세요')
		return;
	}else if( pw.classList.contains('invalid') || pw_chk.classList.contains('invalid') ){
		alert('비밀번호를 확인하세요')
		return;
	}else if( email.classList.contains('invalid') ){
		alert('이메일을 확인하세요')
		return;
	}else{
		document.querySelector('#memberForm').submit();
	}
}
	
	    
</script>
</body>
</html>

