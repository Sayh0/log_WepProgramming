<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<!-- bootstrap -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
<!-- bootstrap -->
<!-- font -->
<style>
@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap');
body { font-family: 'Noto Sans KR', sans-serif; }
</style>
<!-- font -->
<style>
   body {
        height: 100vh;
        width: 100vw;
        background-image: linear-gradient( rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0.3) ), url('https://user-images.githubusercontent.com/96712990/186555113-09907d4d-10b4-4831-adcd-da4e44667935.jpg');
        background-repeat: no-repeat;
        background-size: cover;
        background-position: center;

   	}
</style>
</head>
<body>
<jsp:include page="/WEB-INF/include/navbar.jsp"></jsp:include>
	<div class="container">
		<div>계정 만들기</div>
		<form action="signup.jsp" method="post" id="signupForm">
		<div class="mb-3">
			<label class="control-label" for="id">아이디</label>
			<input class="form-control is-valid is-invalid" type="text" name="id" id="id"/>
			<small class="form-text text-muted">영문 대소문자와 숫자로 6-10자 이내로 만들어주세요. </small>
			<!-- invalid-feedback은 is-valid is-invalid 와 연동 -->
			<div class="invalid-feedback">사용할 수 없는 아이디 입니다.</div>
		</div>
		<div class="mb-3">
			<label class="control-label" for="pwd">비밀번호</label>
			<input class="form-control is-valid is-invalid" type="password" name="pwd" id="pwd"/>
			<small class="form-text text-muted">영문자로 시작하는 6~10자 영문자 또는 숫자로 만들어 주세요.</small>
			<div class="invalid-feedback">비밀 번호를 확인 하세요</div>
		</div>
		<div class="mb-3">
			<label class="control-label" for="pwd2">비밀번호 확인</label>
			<input class="form-control" type="password" name="pwd2" id="pwd2"/>
		</div>
		<div class="mb-3">
			<label class="control-label" for="email">이메일</label>
			<input class="form-control is-valid is-invalid" type="text" name="email" id="email"/>
			<div class="invalid-feedback">이메일 형식에 맞게 입력하세요.</div>
		</div>
		<button class="btn btn-outline-primary" type="submit">가입</button>
		</form>	
	</div>
	<script>
	
	let isIdValid=false;
	let isPwdValid=false;
	let isEmailValid=false;
	//CHECK ID
	document.querySelector("#id").addEventListener("input", function(){
		const self=this;
		self.classList.remove("is-valid");
		self.classList.remove("is-invalid");
		
		const inputId=this.value;
		const reg=/^[A-za-z]+[A-za-z0-9]{5,9}$/; //영문자로 시작하는 6~10자 영문자 또는 숫자
		if(!reg.test(inputId)){ //정규식 통과여부 확인
			self.classList.add("is-invalid");
			isIdValid=false;
			return;
		}
		
		fetch("${pageContext.request.contextPath }/users/checkid.jsp?inputId="+inputId)
		.then(function(response){
			return response.json();
		})
		.then(function(data){
			console.log(data);
			if(data.isExist){ //기존 데이터와 중복여부 확인
				self.classList.add("is-invalid");
				isIdValid=false;
			}else{
				self.classList.add("is-valid");
				isIdValid=true;
			}
		});
	});
	
	//CHECK PWD
	function checkPwd(){
		document.querySelector("#pwd").classList.remove("is-valid");
		document.querySelector("#pwd").classList.remove("is-invalid");
		
		const pwd=document.querySelector("#pwd").value;
		const pwd2=document.querySelector("#pwd2").value;
		let reg=/[0-9]/; //특문 한글자 포함
		if(!reg.test(pwd)){		
			document.querySelector("#pwd").classList.add("is-invalid");
			isPwdValid=false;
			return;
		}
		
		if(pwd != pwd2){
			document.querySelector("#pwd").classList.add("is-invalid");
			isPwdValid=false;
		}else{
			document.querySelector("#pwd").classList.add("is-valid");
			isPwdValid=true;
		}
	}
	
	document.querySelector("#pwd").addEventListener("input", function(){
		checkPwd();
	});
	document.querySelector("#pwd2").addEventListener("input", function(){
		checkPwd();
	});
	
	//CHECK EMAIL
	document.querySelector("#email").addEventListener("input", function(){
		this.classList.remove("is-valid");
		this.classList.remove("is-invalid");
		const inputEmail=this.value;
		const reg=/@/; //여기선 그냥 간단하게 골뱅이 있으면 통과하는 걸로 해놨음.
		if(!reg.test(inputEmail)){
			this.classList.add("is-invalid");
			isEmailValid=false;
		}else{
			this.classList.add("is-valid");
			isEmailValid=true;
		}
	});
	
	//SUBMIT
	document.querySelector("#signupForm").addEventListener("submit", function(event){
		let isFormValid = isIdValid && isPwdValid && isEmailValid;
		if(!isFormValid){
			event.preventDefault();
		}
	});
	</script>
</body>
</html>