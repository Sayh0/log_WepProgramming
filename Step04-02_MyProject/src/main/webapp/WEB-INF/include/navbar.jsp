<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    

	<nav class="navbar navbar-expand-sm navbar-dark shadow-5-strong flex-sm-nowrap flex-wrap">
		<div class="container-fluid">
		    <a class="navbar-brand" href="${pageContext.request.contextPath}/">
		      	<img src="https://user-images.githubusercontent.com/96712990/186359419-77bd7730-60ab-4dc5-8030-09c110ff26a9.png" width="100" height="42" class="d-inline-block align-text-top">
		      	
		    </a>
		    <div class="flex-grow-1">
    			<!-- this is spacer -->
    		</div>
		    <button class="navbar-toggler flex-grow-sm-1 flex-grow-0 me-2" type="button" data-bs-toggle="collapse" 
		    	data-bs-target="#navbarNav">
   				<span class="navbar-toggler-icon"></span>
    		</button>
    		<div class="navbar-collapse collapse flex-grow-1 justify-content-center" id="navbarNav">
      			<ul class="navbar-nav me-auto">
      				<li class="nav-item">
	          			<a class="nav-link ${param.thisPage eq 'gallery' ? 'active' : '' }" href="${pageContext.request.contextPath}/gallery/list.jsp">
	          				<img src="https://user-images.githubusercontent.com/96712990/186588878-e38cb4f3-ee44-4f09-bcc2-09c9e916ea9b.png" alt="gallery" width="105" height="30" class="d-inline-block align-text-top">
	          			</a>
	        		</li>	        		
      				<li class="nav-item">
	          			<a class="nav-link ${param.thisPage eq 'board' ? 'active' : '' }" href="${pageContext.request.contextPath}/board/list.jsp">
	          				<img src="https://user-images.githubusercontent.com/96712990/186586051-8c19c558-f572-4ec1-a0eb-e983f8f05db4.png" alt="board" width="100" height="30" class="d-inline-block align-text-top">
	          			</a>
	        		</li>
	        		<li class="nav-item">
	          			<a class="nav-link ${param.thisPage eq 'cafe' ? 'active' : '' }" href="${pageContext.request.contextPath}/chatterbox/chatterbox.jsp" onclick="window.open(this.href, '_blank', 'width=800, height=600'); return false;">
	          				<img src="https://user-images.githubusercontent.com/96712990/186586030-2444ddc9-8d8e-4ed5-98e8-e13338ad4764.png" alt="chatbox" width="100" height="30" class="d-inline-block align-text-top">
	          			</a>
	        		</li>
      			</ul>

      			<c:choose>
      				<c:when test="${empty id }">
      				<!-- icon
      				<a href="${pageContext.request.contextPath}/users/signup_form.jsp">
      					<img src="https://user-images.githubusercontent.com/96712990/187081826-a33e8cde-9a6c-459a-a818-769695f0e3a2.png" alt="join" width="40" height="23"class="d-inline-block align-text-top">
      				</a>
      				<span></span>
      				<a href="${pageContext.request.contextPath}/users/loginform.jsp">
      					<img src="https://user-images.githubusercontent.com/96712990/187081617-f0614228-95bf-40ec-b8e5-b878b2bb6d3e.png" alt="login" width="55" height="22"class="d-inline-block align-text-top">
      				</a>
      				-->
	      				<a class="btn btn-outline-primary btn-sm me-2" href="${pageContext.request.contextPath}/users/signup_form.jsp">회원가입</a>
	      				<a class="btn btn-outline-success btn-sm me-2" href="${pageContext.request.contextPath}/users/loginform.jsp">로그인</a>

      				</c:when>
      				<c:otherwise>
	      				<span class="navbar-text me-2" style="color:black">
	      					<strong><a href="${pageContext.request.contextPath}/users/private/info.jsp" style="color:black" onclick="window.open(this.href, '_blank', 'width=800, height=600'); return false;" >${id }</a></strong> 님, 안녕하세요!
	      				</span>
	      				<a class="btn btn-outline-danger btn-sm me-2" href="${pageContext.request.contextPath}/users/logout.jsp">로그아웃</a>
      				</c:otherwise>
      			</c:choose>
    		</div>
		</div>
	</nav>