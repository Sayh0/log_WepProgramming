<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%
	// 기억합시다 el로 추출하려면 request든 session 이든 담아둬야 합니다!
	// test 를 위해 sample data 를 request 영역에 담기
	request.setAttribute("jumsu", 75);
	// el로 추출하려면 ${requestScope.jumsu } 혹은 그냥 ${jumsu}(생략가능하니까)
%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/test_jstl/test04.jsp</title>
</head>
<body>
	<%if( (10 % 2) == 0) { %>
		<p>10 은 짝수 입니다.</p>
	<%} %>
	<!-- 위 코드는 아래와 같다. -->
	<c:if test="${ 10%2 eq 0 }">
		<p>10 은 짝수 입니다.</p>
	</c:if>
	<c:if test="${ 11%2 eq 0 }">
		<p>11 은 짝수 입니다.</p>
	</c:if>
	<c:if test="${jumsu%2 eq 0 }">
		<p>${jumsu } 는 짝수 입니다.</p>
	</c:if>
	
	<p> 획득한 점수는 <strong>${jumsu }</strong> 입니다.</p>
	<p>
		따라서 이번 학기 학점은
		<c:choose>
			<c:when test="${jumsu ge 90 }">A</c:when>
			<c:when test="${jumsu ge 80 }">B</c:when>
			<c:when test="${jumsu ge 70}">C</c:when>
			<c:when test="${jumsu ge 60 }">D</c:when>
			<c:otherwise>F</c:otherwise> 
			<!-- jsp에 else if 는 없고, 마지막에 otherwise 를 써서 비슷하게 활용한다. -->
		</c:choose>
		입니다
	</p>
	<p>
		<strong>${jumsu }</strong> 는
		<c:choose>
			<c:when test="${jumsu%2 eq 0}">
				짝수
			</c:when>
			<c:otherwise>
				홀수
			</c:otherwise>
		</c:choose>
		입니다.
	</p>
	
	<%
		String id=(String)session.getAttribute("id");
	%>
	
	<%if(id == null){ %>
		<p> 로그인이 필요 합니다.</p>
	<%}else{ %>
		<p> <strong><%=id %></strong> 님 로그인중...</p>
	<%} %>
	
	<c:choose>
		<c:when test="${ empty id }">
			<p>로그인이 필요 합니다.</p>
		</c:when>
		<c:otherwise>
			<p> <strong>${id }</strong> 님 로그인중...</p>
		</c:otherwise>
	</c:choose>
</body>
</html>















