<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	/*
	 * jsp 페이지에서 HtpServletRequest는 기본 객체이다.
	 * request 라는 이름의 지역변수에 참조값이 들어 있기 때문에 바로 . 찍어서 메소드 활용이 가능하다.
	 *
	 */
	
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
	//response.setContentType("text/html; charset-utf-8");
	//이 부분도 servlet으로 들어갈 때 알아처 처리되기 때문에 안써도 됨. 맨 위에 contentType 선언부 보이지?
	
	String msg = request.getParameter("msg");
	//System.out.println("jsp에선 자바단에 콘솔 출력이 안되는 버그가 있다."+msg);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" />

<title>Insert title here</title>
<style>
   @font-face {
      font-family: 'BMHANNAPro';
      src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_seven@1.0/BMHANNAPro.woff') format('woff');
      font-weight: normal;
      font-style: normal;
   }
   * {
      font-family: 'BMHANNAPro';
   }
</style>

</head>
<body>
	<div>
		<p><%=msg %><p>
		<p>(이)라는 메세지 잘 받았어 클라이언트야~!</p>
	</div>
</body>
</html>