<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>       
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>index.jsp</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
<style>
@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap');
body { font-family: 'Noto Sans KR', sans-serif; }
</style>
</head>

<body>
<jsp:include page="/test_jstl/navbar.jsp"></jsp:include>
   <div class="container">
      
      <!-- 
         c:choose, c:when과 같은 문법은 클라이언트에서 바로 해석되지 않고 jsp 페이지에서 해석해서 해석된 결과를 응답하는 것임.
         EL과 jsp 코드를 이용하면 java 코드 없이 구성하는게 가능하다.
      -->
      
      <%--
         아래의 코드를 java코드로 작성하면 아래와 같다.
         <%
            // 세션 영역에 id라는 키값으로 저장된 값이 있는지 읽어와 본다(없으면 null)
            String id=(String)session.getAttribute("id");
         %>
         <%if(id !-_null{ %>
            <p>
               <a href="${pageContext.request.contextPath }/users/private/info.jsp">${id }</a> 님 로그인중...
               <a href="${pageContext.request.contextPath }/users/logout.jsp">로그아웃</a>
            </p>
         <%}else %>
            <a href="${pageContext.request.contextPath }/users/loginform.jsp">로그인</a>
         <%   } %>
       --%>
      <c:choose>
         <c:when test="${not empty sessionScope.id }"><!-- ${not empty sessionScope.id }은 EL 문법  -->
            <p>
               <a href="${pageContext.request.contextPath }/users/private/info.jsp">${id }</a> 님 로그인중...
               <a href="${pageContext.request.contextPath }/users/logout.jsp">로그아웃</a>
            </p>
         </c:when>
         <c:otherwise>
            <a href="${pageContext.request.contextPath }/users/loginform.jsp">로그인</a>
         </c:otherwise>
      </c:choose>
      
      
      <h1>인덱스 페이지 입니다.</h1>
      <ul>
         <li><a href="${pageContext.request.contextPath }/users/signup_form.jsp">회원가입</a></li>
         <li><a href="${pageContext.request.contextPath }/private/study.jsp">회원전용공간(공부)</a></li>
         <li><a href="${pageContext.request.contextPath }/private/game.jsp">회원전용공간(게임)</a></li>
         <li><a href="${pageContext.request.contextPath }/file/list.jsp">자료실</a></li>
         <li><a href="${pageContext.request.contextPath }/cafe/list.jsp">글 목록보기</a></li>
         
         <!-- 회원전용공간에 로그인여부를 어떻게 확인하는걸까? >> test.filer의 LoginFilter를 이용 -->
      </ul>
   </div>
</body>
</html>







