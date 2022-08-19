<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/test/fortune.jsp</title>
</head>
<body>
	<%
		// fortuneTody 라는 키값으로 담긴 String type 얻어내기 
		String fortune=(String)request.getAttribute("fortuneToday");
		//오브젝트 타입으로 리턴됨. 그래서 타입캐스팅 필요.

	%>
	<p>오늘의 운세: <strong><%=fortune %></strong></p>
	<!-- 최초 요청은 servlet이 받았지만 응답은 jsp가 함 -->
	<!-- 
		응답 순서 : 최초 요청은 서블렛이 받음.(/fortune 타고 왔으니까)
		서블렛은 뚝딱뚝딱 로직 수행결과를 담아두어서 forward 이동한다.(서버 내에서 이동)
		이게 응답을 위임시킨다. 어디로? fortune jsp로.
		
		spring framework에서는 jsp에 로직이 거의 없다. 로직은 서블릿 단에 집중,
		jsp는 응답에 집중
		
		logic 처리의 결과는 request로 jsp에 넘겨줌.
		
	 -->
</body>
</html>





