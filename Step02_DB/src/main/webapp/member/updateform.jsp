<%@ page import="test.member.dao.MemberDao"%>
<%@ page import="test.member.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int num=Integer.parseInt(request.getParameter("num"));

	/*
	//변경코드 시작
	String num2=request.getParameter("num");
	int intNum=Integer.parseInt(num2);
	MemberDto dto2=new MemberDto();
	dto2.setNum(intNum);
	//변경코드 끝
	*/
	
	//dto를 dto2로 바꾸니까 왠지 모르겠지만 됨 >> 아래 dto를 모두 dto2로 변경
	//안됐던 이유 : 내 DB 주소 컬럼은 addr가 아니고 address 여서
	//MemberDao getData 메소드 sql 문에 addr 라고 써뒀으니까 getData 자체가 안 돌아갔던것.

	MemberDto dto=MemberDao.getInstance().getData(num);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/member/updateform.jsp</title>

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

	<h1>회원 수정 폼 입니다.</h1>
	<form action="update.jsp" method="post">
		<input type="hidden" name="num" value="<%=dto.getNum()%>"/>
		<div class="mb-3">
			<label for="num">번호</label>
			<!-- 
				번호는 primary key 로 사용되기 때문에 수정되는 항목으로 설정 X.
			 -->
			<input type="text" id="num" value="<%=dto.getNum()%>" disabled/>
		</div>
		<div class="mb-3">
			<label for="name">이름</label>
			<input type="text" name="name" id="name" value="<%=dto.getName()%>"/>
		</div>
		<div class="mb-3">
			<label for="address">주소</label>
			<input type="text" name="address" id="address" value="<%=dto.getAddr()%>"/>
		</div>
		<button class="btn btn-primary btn-sm" type="submit">수정</button>
		<button class="btn btn-primary btn-sm" type="submit">취소</button>
		
		<button type="button" class="navyBtn" onClick="location.href='list.jsp'">뒤로가기</button>	
		
	</form>
</div>
</body>
</html>