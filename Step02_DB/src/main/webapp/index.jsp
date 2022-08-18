<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="test.util.DbcpBean" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/index.jsp</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
</head>


<style>
@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap');
body { font-family: 'Noto Sans KR', sans-serif; }
</style>


<body>
<%--
	thisPage라는 파라미터명으로 index라는 문자열 전달하는 방법. : <jsp:param value="index" name="thisPage"/>
--%>
<jsp:include page="/include/navibar.jsp">
	<jsp:param value="index" name="thisPage"/>
</jsp:include>

<div class="container">
	<h1>인덱스 페이지입니다.</h1>
	<%--
		절대경로로 표시할 때 컨텍스트 경로가 필요하긴 하지만
		컨텍스트 경로는 나중에 실제로 프로젝트가 끝나고 배포되는 시점에 변경되거나 제거될 예정이다.
		따라서 코딩할 때 컨텍스트 경로를 절대경로로 하드코딩해 놓으면 나중에 제거하거나 변경할 때 힘들다.
		해결책은 jsp페이지에서 context 경로가 필요하면 아래의 EL( ${...} ) 을 이용해서 출력하면 된다.
	--%>

	<p>컨텍스트 경로(프로젝트명이라고 이해하자) : <strong>${pageContext.request.contextPath }</strong></p>
	<!-- <p>컨텍스트 경로(프로젝트명이라고 이해하자) : <strong><%=request.getContextPath() %></strong></p> -->
	<ul>
		<li><a href="${pageContext.request.contextPath }/test/form.jsp">폼 테스트</a></li>
	</ul>


	<h4>웹페이지 구현 연습중</h4>
    <!-- 케러셀 하단의 표시바 -->
<div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="true">
     <!-- 케러셀 하단의 표시바 -->
      <div class="carousel-indicators">
         <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
           <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
         <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
        </div>
      <div class="carousel-inner">
      <div class="carousel-item active">
         <img src="${pageContext.request.contextPath }/images/bg3.jpg" class="d-block w-100" alt="...">
      </div>
        <div class="carousel-item">
         <img src="${pageContext.request.contextPath }/images/bg2.jpg" class="d-block w-100" alt="...">
      </div>
       <div class="carousel-item">
         <img src="${pageContext.request.contextPath }/images/bg.jpg" class="d-block w-100" alt="...">
       </div>
     </div>
     <!-- 케러셀 좌우 버튼 -->
     <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
       <span class="carousel-control-prev-icon" aria-hidden="true"></span>
       <span class="visually-hidden">Previous</span>
     </button>
     <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
       <span class="carousel-control-next-icon" aria-hidden="true"></span>
       <span class="visually-hidden">Next</span>
     </button>
   </div>
</div>


<!-- 
	JSP가 어디에 있는지 page 속성의 값으로 지정을 해주면
	이 부분에서 해당 JSP 페이지가 응답을 하게 된다.
	! 주의 ! 그러니까 <head> ... <html>.. 같은건 응답할 문서 안에 있으면 안되는 것이다.
 -->
	
<jsp:include page="/include/footer.jsp"></jsp:include>]

</body>
</html>
