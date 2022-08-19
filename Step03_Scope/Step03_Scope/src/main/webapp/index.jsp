<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/index.jsp</title>
</head>
<body>
	<h1>인덱스 페이지 입니다</h1>
	<ul>
		<li><a href="${pageContext.request.contextPath }/fortune">오늘의 운세</a></li>
		<li><a href="${pageContext.request.contextPath }/member">회원 한명의 정보 보기</a></li>
		<li><a href="${pageContext.request.contextPath }/test/fortune.jsp">서블릿을 거치치 않으면?</a></li>
		<!-- 서블릿을 거치지 않으며 null 뜰걸. 서블릿을 거쳐서 forward 되지 않으면 응답이 제대로 안 됨.-->
		<li><a href="${pageContext.request.contextPath }/test/play.jsp">놀러가기</a></li>
	</ul>
	<form action="${pageContext.request.contextPath }/test/save.jsp" method="post">
		<input type="text" name="nick" placeholder="닉네임 입력..."/>
		<button type="submit">닉네임 기억 시키기</button>
	</form>
	<br />
	<form action="${pageContext.request.contextPath }/test/save" method="post">
		<input type="text" name="nick" placeholder="닉네임 입력..."/>
		<button type="submit">닉네임 기억 시키기</button>
	</form>
</body>
</html>

<!-- 
	<li><a href="${pageContext.request.contextPath }/fortune">오늘의 운세</a></li>
	
	이 링크에서 최초 요청은 servlet이 받았지만 응답은 jsp가 함 
	
	응답 순서 : 최초 요청은 서블렛이 받음.(/fortune 타고 왔으니까)
	서블렛은 뚝딱뚝딱 로직 수행결과를 담아두어서 forward 이동한다.(서버 내에서 이동)
	그다음 응답을 위임시킴. 어디로? fortune jsp로.
	
	spring framework에서는 jsp에 로직이 거의 없다. 로직은 서블릿 단에 집중,
	jsp는 응답에 집중
	
	logic 처리의 결과는 request로 jsp에 넘겨줌.
 -->
 
<!-- 
	웹서버는 동시에 불특정 다수의 요처을 받고 응답을 해야 하는 하나의 application이라는 것을 먼저 기억하자.
	하나 빠르게 응답 하고 연결 끊고, 또 하나 빠르게 응답 하고 연결 끊고 하는 방식.
	그럼 이런 불특정 다수의 클라이언트들을 서버는 어떻게 식별하는걸까? >> 쿠키cookie로!
 -->

<!--
	- HttpServletRequest 객체와 HttpSession 객체의 메소드 구분해서 알아두기.
	- getAttrivute와 getParameter를 혼동 많이 한다. 주의하자.
 -->














