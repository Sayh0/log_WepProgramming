<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    

	<nav class="navbar navbar-expand-lg navbar-dark shadow-5-strong">
		<div class="container-fluid">
		    <a class="navbar-brand" href="${pageContext.request.contextPath}/">
		      	<img src="https://user-images.githubusercontent.com/96712990/186359419-77bd7730-60ab-4dc5-8030-09c110ff26a9.png" width="100" height="40" class="d-inline-block align-text-top">
		      	
		    </a>
		    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" 
		    	data-bs-target="#navbarNav">
   				<span class="navbar-toggler-icon"></span>
    		</button>
    		<div class="collapse navbar-collapse" id="navbarNav">
      			<ul class="navbar-nav me-auto">
      				<li class="nav-item">
	          			<a class="nav-link ${param.thisPage eq 'cafe' ? 'active' : '' }" href="${pageContext.request.contextPath}/cafe/list.jsp">소개</a>
	        		</li>
      				<li class="nav-item">
	          			<a class="nav-link ${param.thisPage eq 'file' ? 'active' : '' }" href="${pageContext.request.contextPath}/file/list.jsp">게시판</a>
	        		</li>
	        		<li class="nav-item">
	          			<a class="nav-link ${param.thisPage eq 'cafe' ? 'active' : '' }" href="${pageContext.request.contextPath}/cafe/list.jsp">놀이터</a>
	        		</li>
      			</ul>
      			<c:choose>
      				<c:when test="${empty id }">
	      				<a class="btn btn-outline-primary btn-sm me-2" href="${pageContext.request.contextPath}/users/signup_form.jsp">회원가입</a>
	      				<a class="btn btn-outline-success btn-sm me-2" href="${pageContext.request.contextPath}/users/loginform.jsp">로그인</a>
      				</c:when>
      				<c:otherwise>
	      				<span class="navbar-text me-2">
	      					<a href="${pageContext.request.contextPath}/users/private/info.jsp">${id }</a> 님, 안녕하세요!
	      				</span>
	      				<a class="btn btn-outline-danger btn-sm me-2" href="${pageContext.request.contextPath}/users/logout.jsp">로그아웃</a>
      				</c:otherwise>
      			</c:choose>
    		</div>
		</div>
	</nav>