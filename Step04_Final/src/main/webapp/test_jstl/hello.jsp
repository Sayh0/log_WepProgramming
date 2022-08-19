<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!-- 
	자바 코드를 대체할 수 있는 라이브러리. 특별한 마크업을 사용 가능해졌다.
	prefix="c" 는 c 라는 제어변수를 지정해서 이걸 꺼널 때 쓰겠다는 뜻.
	jstl-1.2.jar 이건 외부 라이브러리 임포트 해 놔야 사용 가능. 
-->    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/test_jstl/hello.jsp</title>
</head>
<body>

	<c:forEach var="i" begin="0" end="9" step="1">
		<p>안녕 ${i }</p>
	</c:forEach>
	<!-- 위 코드는 아래와 같다. -->
	<%for(int i=0; i<=9 ; i++){ %>
		<p>안녕 <%=i %></p>
	<%} %>
</body>
</html>








