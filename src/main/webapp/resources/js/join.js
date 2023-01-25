/**
 * 
 */
  
 var join = {
	param: function(c){
		if(c.getAttribute('id')=='id')				{	this.id(c)	}
		else if(c.getAttribute('id')=='email')		{	this.email(c)	}
		else if(c.getAttribute('id')=='pw')			{	this.pw(c)	}
		else if(c.getAttribute('id')=='pw_chk')		{	this.pw_chk(c)	}
	},//param
	
	email: function(c){
		var reg = /^([\w\.\_\-])*[a-zA-Z0-9]+([\w\.\_\-])*([a-zA-Z0-9])+([\w\.\_\-])+@([a-zA-Z0-9]+\.)+[a-zA-Z0-9]{2,8}$/i;
		
		if((c.value)==''){
			c.classList.remove('valid') 
			c.classList.add('invalid')	
			div_e.innerText='이메일을 입력하세요'
			div_e.style.color='red'
		}
		else if((c.value)==' '){ 
			c.classList.remove('valid') 
			c.classList.add('invalid')
		 	div_e.innerText='공백없이 입력하세요'
		 	div_e.style.color='red'
		}
		else if(reg.test(c.value)){
			c.classList.remove('invalid') 
			c.classList.add('valid') 
			div_e.innerText='사용가능한 이메일입니다' 
			div_e.style.color='green'
		}
		else{ 
			c.classList.remove('valid') 
			c.classList.add('invalid')
			div_e.innerText='부적절한 이메일입니다' 
			div_e.style.color='red'
		}
	},//email
	
	pw: function(c){
		
		
		//8자 이상, 하나 이상의 숫자, 문자, 특수문자
		var reg = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$/;
		if((c.value)==''){
			c.classList.remove('valid') 
			c.classList.add('invalid')
			div_p.innerText='비밀번호를 입력하세요'
			div_p.style.color='red'
		}else if(c.value.toString().length<8){
			c.classList.remove('valid') 
			c.classList.add('invalid')
			div_p.innerText='최소 8글자 이상 입력하세요'
			div_p.style.color='red'
		}else if(reg.test(c.value)){
			c.classList.remove('invalid') 
			c.classList.add('valid')
			div_p.innerText='사용가능한 비밀번호입니다'
			div_p.style.color='green'
		
		}else{
			c.classList.remove('valid') 
			c.classList.add('invalid')
			div_p.innerText='8 digits and contains one or more letters, numbers, or special characters'
			div_p.style.color='red'
		}
	},//pw
	
	pw_chk: function(c){
		if(c.value==document.querySelector('#pw').value){
			c.classList.remove('invalid') 
			c.classList.add('valid')
			div_p_chk.innerText='사용가능한 비밀번호입니다'
			div_p_chk.style.color='green'
		}else{
			c.classList.remove('valid') 
			c.classList.add('invalid')
			div_p_chk.innerText='비밀번호를 다시 확인하세요'
			div_p_chk.style.color='red'
		}
	},//pw_chk
	
	id: function(c){
		c.classList.remove('validID')
		c.classList.add('invalidID')
		
		if((c.value)==''){
			c.classList.remove('valid') 
			c.classList.add('invalid')
			div_i.innerText='아이디를 입력하세요'	
			div_i.style.color='red'			
		}else if(c.value.toString().length<2){
			c.classList.remove('valid') 
			c.classList.add('invalid')
			div_i.innerText='최소 두 글자 이상 입력하세요'	
			div_i.style.color='red'			
		}else if(c.value.toString().length>10){
			c.classList.remove('valid') 
			c.classList.add('invalid')
			div_i.innerText='열 글자 이하로 입력하세요'
			div_i.style.color='red'	
		}else{
			c.classList.remove('invalid') 
			c.classList.add('valid')
			div_i.innerText='사용가능한 아이디입니다'
			div_i.style.color='green'	
		}
	},//id
	
	
 }//join
 
 
 