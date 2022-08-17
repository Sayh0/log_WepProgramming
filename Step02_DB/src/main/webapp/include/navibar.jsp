<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
	아무것도 필요없다. 부트스트랩 로딩도 필요없다. 중간에 들어갈 녀석이니까 있으면 중복임.
	/include/navibar.jsp
--%>
<%
	//이 navibar.jsp 페이지가 어디에 include 되었는지 읽어와 보기
	String thisPage=request.getParameter("thisPage"); // index | member | todo
%>

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
             <a class="nav-link" href="${pageContext.request.contextPath }/member/list.jsp">회원 목록으로</a>
          </li>
          <li class="nav-item">
             <a class="nav-link" href="${pageContext.request.contextPath }/todo/list.jsp">할일 목록으로</a>
          </li>
       </ul>
    </div>
  </div>
</nav>