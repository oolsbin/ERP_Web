/**
 * 
 */
 
 
 var member={
	//각 태그별 키보드 입력값의 상태확인
	
	tag_status: function(tag) {
		//태그 상태 판단할 함수 is not deprecated <변수선언호가인 
		var name = tag.attr('name'); //태그가 가지고 있는 name에 따라 ex)pw,pw_ck
		if(name=='pw') 			return this.pw_status(tag.val());
		else if(name=='pw_ck')	return this.pw_ck_status(tag.val());
		else if(name=='phone')		return this.phone_status(tag.val());
		else if(name=='email')	return this.email_status(tag.val());
		
	},
	
	space: /\s/g,
	//dlapf이멜 관련 상태 확인 함수
	email_status: function(email) {
		var reg = /[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]$/i;
		if(email=='')	return this.common.empty;
		else if(reg.test(email)) return this.email.valid;
		else			return this.email.invalid;
	},
	
	//상태확인
	email : {
		valid: {code: 'valid', desc:'사용 가능한 이메일'},
		invalid: {code:'invalid', desc:'사용할 수 없는 이메일'}
		
	},
	
	
	//아이디관련 상태 확인 함수
	phone_status: function(phone) {
		var reg = /[^0-9][-]/g;
		
		if(phone=='') 						return this.common.empty;
		else if(phone.match(this.space)) 	return this.common.space;
		else if(reg.test(phone))			return this.id.invalid;
		//else if(apply_phone.length<5) 			return this.common.min;
		//else if(apply_phone.length>10) 			return this.common.max;
		
		else 							return this.id.valid;
				
	},
	//아이디 상태 값
	id: {
		unUsable: {code: 'valid', desc:'사용가능한 휴대폰번호'}
		,usable: {code: 'valid', desc:'사용가능한 휴대폰번호'}
		,valid: {code: 'valid', desc:'사용가능한 휴대폰번호'}
		
		
	},
	
	
	//비밀번호 관련상태
	pw_status: function(pw ){
		//var reg = /[^a-zA-Z0-9]/g, upper=/[A-Z]/g, lower=/[a-z]/g, no=/[0-9]/g;
		if(pw=='') 					  return this.common.invalid;
		else if(pw.match(this.space)) return this.common.space;
		//else if(reg.test(apply_pw))		return this.pw.invalid
		//else if(apply_pw.length<5)		return this.common.min;
		//else if(apply_pw.length>10)		return this.common.max;
		//else if(!upper.test(apply_pw)||!lower.test(apply_pw)||!no.test(pw))
		//return this.pw.lack;		
		else						  return this.pw.valid;
		
	},
	
	//비밀번호 확인 관련상태
	pw_ck_status: function(pw_ck) {
		if(pw_ck=='')						 return this.common.empty;
		else if(pw_ck!=$('[name=pw]').val()) return this.pw.notEqual;
		else									return this.pw.equal;
	},
	
	//비밀번호 상태값
	pw: {
		invalid: {code:'invalid' ,desc: '영문 대/소문자, 숫자만 입력가능'}
		,lack: {code:'invalid', desc:'영문 대/소문자, 숫자 모두 포함해'}
		,valid: {code: 'valid', desc:'사용가능한 비밀번호'}
		,equal: {code: 'valid', desc:'비밀번호 일치'}
		,notEqual: {code: 'invalid', desc:'비밀번호가 일치하지 않습니다'}
	},
	
	
	//공통사용 상태값
	common: {
		empty: {code:'invalid', desc:'입력하세요'}
		,space: {code:'invalid', desc: '공백없이 입력하세요'}
		,max: {code:'invalid', desc: '최대 10자 이하'}
		,min: {code:'invalid', desc: '최소 5자 이상'}
		
		
	}
	
	
}

 
 
 