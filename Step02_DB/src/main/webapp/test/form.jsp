<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/test/form.jsp</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
<!-- animate css 로딩 -->
  <link
    rel="stylesheet"
    href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"
  />
<style>
	@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap');
	body { font-family: 'Noto Sans KR', sans-serif; }
	form legend {
		font-size: 1rem;
	}
	.animate__flipInX {
		animation-duration:0.8s;
	}
	.animate__pulse {
	animation-duration:0.2s;
	animation-iteration-count:2;
	}
</style>

</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-md-6 offset md-3 animate__animated animate__flipInX">
				<h1> 테스트 폼입니다. </h1>
				<form action="signup.jsp" method="post" class="shadow p-3">
					<div class="form-floating mb-3">
						<input type="text" class="form-control" id="floatingInput" placeholder="name@example.com" name="email"></input>
						<label for="floatingInput">Email</label>
					</div>
					<div>
						<label for="floatingTextarea2">Comments</label>
						<textarea class="form-control" placeholder="메세지를 남기세요" id="floatingTextarea2" style="height: 100px" name="comment"></textarea>
					</div>
					<div>
						<label for="job">직업</label>
						<select class="form-select" aria-label="Default select example" name="job" id="job">
							<option selected>선택</option>
							<option value="programmer">programmer</option>
							<option value="teacher">teacher</option>
							<option value="doctor">doctor</option>
							<option value="etc">etc</option>
						</select>
					</div>
					<div class="form-check">
						<fieldset>
							<legend>관심사 체크</legend>
							<p>
								<label class="form-check-label" for="flexCheckDefault">
									<input class="form-check-input" type="checkbox" name="concern" value="reading"/>
									독서
								</label>
							</p>
							<p>
								<label class="form-check-label" for="flexCheckDefault">
									<input class="form-check-input" type="checkbox" name="concern" value="game"/>
									게임
								</label>				
							</p>
							<p>
							<label class="form-check-label" for="flexCheckDefault">
								<input class="form-check-input" type="checkbox" name="concern" value="cooking"/>
								요리
							</label>					
							</p>
						</fieldset>
					</div>
					<div class="mb-2">
						<fieldset>
							<legend>성별 체크</legend>
							<p>
							<label class="form-check-label" for="flexRadioDefault2">
								<input class="form-check-input" type="radio" name="gender" id="flexRadioDefault2" value="man"/>
								남자
							</label>
							</p>
							<p>
							<label class="form-check-label" for="flexRadioDefault">
								<input class="form-check-input" type="radio" name="gender" id="flexRadioDefault" value="woman"/>
								여자
							</label>
							</p>
						</fieldset>
					</div>
		      		<button id="submitBtn" type="submit" class="btn btn-primary">전송</button>
		      	</form>
			</div>
		</div>
	</div>
<script>
	//특정 요소에 이벤트가 발생했을 때 실행할 함수 등록
	document.querySelector("#submitBtn").addEventListener("mouseover", function(){
		//원하는 애니메이션 클래스를 추가해서 애니메이션을 동작시킨다.
		this.classList.add("animate__animated");
		this.classList.add("animate__pulse");
	});
	//특정 요소에 애니메이션이 끝나는 이벤트가 발생했을 때 실행할 함수 등록
	document.querySelector("#submitBtn").addEventListener("animationend", function(){
		//추가했던 클래스를 제거해야지만 다음번에 또 동작 가능
		this.classList.remove("animate__animated");
		this.classList.remove("animate__pulse");
	});
</script>		
</body>
</html>