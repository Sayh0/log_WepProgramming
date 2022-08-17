<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/todo/insertform.jsp</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>

<style>
@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap');
body {
	font-family: 'Noto Sans KR', sans-serif;
}
</style>

</head>
<body>

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

<div class="container">
	<h1>할일을 추가하세요!</h1>
	<form action="insert.jsp" method="post" class="form-floating">
	    <div class="form-floating mb-3">
	       <input type="text"  class="form-control"  name="content" id="content" placeholder="할일 입력..."/>
	       <label for="content">할일을 여기에 입력</label>
	    </div>
	    <button class="btn btn-primary btn-sm" type="submit">추가</button>
	</form>

<!-- 
	<div>
		<label for="content">할일</label>
		<input type="text" name="content" id="content"/>
	</div>
	<button type="submit">추가</button>
-->
	
</div>
<jsp:include page="/include/footer.jsp"></jsp:include>]
</body>
</html>