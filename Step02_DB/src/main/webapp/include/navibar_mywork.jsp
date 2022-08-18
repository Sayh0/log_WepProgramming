<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
	/include/navbar.jsp
 --%>
<%
	String thisPage=request.getParameter("thisPage"); // "index" | "member" | "todo"
	int switchNum = 0;
	if(thisPage.equals("index")){
		switchNum=0;
	} else if(thisPage.equals("member")){
		switchNum=1;
	} else if(thisPage.equals("todo")){
		switchNum=2;
	}
%>     
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
			<%switch(switchNum) {
				case 0 : %>
              <li class="nav-item">
                 <a class="nav-link active" href="${pageContext.request.contextPath }/member/list.jsp">회원 목록으로</a>
              </li>
              <li class="nav-item">
                 <a class="nav-link" href="${pageContext.request.contextPath }/todo/list.jsp">할일 목록으로</a>
              </li>
           <% break;
				case 1 : %>
              <li class="nav-item">
                 <a class="nav-link" href="${pageContext.request.contextPath }/todo/list.jsp">할일 목록으로</a>
              </li>
           <% break;
				case 2 : %>
                <li class="nav-item">
                 <a class="nav-link" href="${pageContext.request.contextPath }/member/list.jsp">회원 목록으로</a>
              </li>
           	<% break;
           	} %>
    	</ul>
    </div>
  </div>
  <script type="text/javascript">
  console.log("<%=thisPage.toString()%>");
  </script>
</nav>


