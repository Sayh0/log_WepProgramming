<%@page import="test.member.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/test/member.jsp</title>
</head>
<body>
	<%
		MemberDto dto=(MemberDto)request.getAttribute("dto");
		//MemberDto 타입을 기억해 오브젝트타입에서 타입캐스팅 해주는 모습.
	%>
	<p>번호 : <%=dto.getNum() %></p>
	<p>이름 : <%=dto.getName() %></p>
	<p>주소 : <%=dto.getAddr() %></p>
</body>
</html>