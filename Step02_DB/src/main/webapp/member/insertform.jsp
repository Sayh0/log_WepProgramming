<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/member/insertform.jsp</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>

<style>
@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap');
body {
	font-family: 'Noto Sans KR', sans-serif;
}
</style>

</head>

<!-- bootstrap naviBar -->
<nav class="navbar bg-light navbar-expand-sm">
  <div class="container">
    <a class="navbar-brand" href="${pageContext.request.contextPath }/">
      <img src="https://getbootstrap.com/docs/5.2/assets/brand/bootstrap-logo.svg" alt="" width="30" height="24" class="d-inline-block align-text-top">
      Acorn
    </a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNav">
       <ul class="navbar-nav">
          <li class="nav-item">
             <a class="nav-link" href="${pageContext.request.contextPath }/member/list.jsp">회원목록</a>
          </li>
          <li class="nav-item">
             <a class="nav-link" href="${pageContext.request.contextPath }/todo/list.jsp">할일목록</a>
          </li>
       </ul>
    </div>
  </div>
</nav>

<body>
<div class="container">
	<h1>회원 추가 폼 입니다.</h1>
	<form action="insert.jsp" method="post">
		<div class="mb-3">
			<label class="form-control" for="name">이름</label>
			<input class="form-control" type="text" name="name" id="name"/>
		</div>
		<div class="mb-3">
			<label class="form-control" for="address">주소</label>
			<input class="form-control" type="text" name="address" id="address"/>
		</div>
		<button class="btn btn-primary btn-sm" type="submit">추가</button>
	</form>
</div>
</body>
</html>