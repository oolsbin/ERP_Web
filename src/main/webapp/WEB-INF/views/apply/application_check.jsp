<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  
<link href='css/recruit.css?<%=new java.util.Date() %>' type='text/css' rel='stylesheet'>
 <script src='https://code.jquery.com/jquery-3.6.1.min.js'></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<script src='js/recruit.js?<%=new java.util.Date() %>'></script>

<!-- ★jquery선언문 jquery.com -> blog들가서 긁어옴-->
<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/js/all.min.js"></script>
<style>
.center {
	position: absolute;
	left: 50%; top: 50%;
	transform: translate(-50%, -50%);
}

div li {
margin-bottom: 1rem;

}
div a {
margin-bottom: 1rem;

}

input {
width: 300px;
height: 39px;
margin:0px;
padding:0px;
}


li a {

}


.btn {
margin-top: 1rem;
 padding: 10px 0;
background : #12192c;
	
		color: #ffffff;
		font-size: 14px;
  font-weight: 400;
  font-family:'Noto Sans KR', sans-serif;
 
	
}
</style>

</head>
<body>
<form method='post' action='detail.apply'>
<div class="center">
<h3>지원서 확인하기</h3>
<ul>
<li>
<input type="text" id="apply_phone" class="chk" name="apply_phone" placeholder="  휴대폰번호">
</li>
<li>
<input type="password" id="apply_pw" class="chk"  name="apply_pw" placeholder="  비밀번호">
</li>
<li class='btn'><a type='button' class= "new-btn" id='check'>확인</a></li>
 <li class='btn'><a type='button' style="color:white" class= "new-btn"  href='applyList.apply'>취소</a></li>

 </ul>
<!-- 

<div class="btn">
<a type='button' class='new-btn' id='check'>확인</a>
<a type='button' class='new-btn' href='applyList.apply'>취소</a>
</div>


 -->
<!-- 
 <li><input type='button' class= "new-btn" value='확인' id='login'></li>
 <li><input type='button' class= "new-btn"  value='취소' onclick='location="applyList.apply"'></li>
 
 -->
</div>
</form>


<script>


$('#apply_pw').keyup(function(e){
	if(e.keyCode==13) check();
});
function check() {
	
	if(emptyCheck()) {//empty check가 true일때 실행 < webapp-> resources->js-> common.js
			
			$.ajax({
				url: 'application_detail',	//controller
				data: { apply_phone:$('#apply_phone').val(), apply_pw:$('#apply_pw').val()},
				
				success: function(response){
					console.log(response);
					
					if(response.exist) {
						
						location = 'detail.apply?apply_num='+response.apply_num;
					}
					
					else{
						alert('일치하지 않습니다');
						$('#apply_phone').focus();
					} 
				},error: function(req, text){
					alert(text+':'+req.status);
				}
				
			});	
		}	
	}
	$('#check').click(function(){
		check();
	});
</script>

</body>
</html>