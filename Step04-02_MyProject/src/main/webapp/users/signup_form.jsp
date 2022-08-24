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
</head>
<body>
<jsp:include page="/util/navbar.jsp"></jsp:include>
	<div class="container">
		<div>계정 만들기</div>
		<form action="signup.jsp" method="post" id="signupForm">
		<div class="mb-3">
			<label class="control-label" for="id">아이디</label>
			<input class="form-control is-valid is-invalid" type="text" name="id" id="id"/>
			<small class="form-text text-muted">영문 대소문자와 숫자만 가능합니다. 
			아이디는 최소 5글자, 최대 10글자 이하로 가능합니다.</small>
			<!-- invalid-feedback은 is-valid is-invalid 와 연동 -->
			<div class="invalid-feedback">사용할 수 없는 아이디 입니다.</div>
		</div>
		<div class="mb-3">
			<label class="control-label" for="pwd">비밀번호</label>
			<input class="form-control is-valid is-invalid" type="password" name="pwd" id="pwd"/>
			<small class="form-text text-muted">특수 문자를 하나 이상 조합하세요.</small>
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
	
	document.querySelector("#id").addEventListener("input", function(){
		const self=this;
		self.classList.remove("is-valid");
		self.classList.remove("is-invalid");
		
		const inputId=this.value;
		const reg=/[\w]/; //특문 한글자 포함
		if(!reg.test(inputId)){ //정규식 통과여부 확인
			self.classList.add("is-invalid");
			isIdValid=false;
			return;
		}
		
		fetch("${pageContext.request.contextPath }/users/checkid.jsp?inputId="+inputId)
		.then(function(response){
			return resonse.json();
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
	
	</script>
</body>
</html>