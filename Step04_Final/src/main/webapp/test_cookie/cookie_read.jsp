<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//HttpServletRequest 객체를 이용해서 요청과 함께 전달된 쿠키 읽어내기
	Cookie[] cooks=request.getCookies(); //리턴타입은 쿠키 배열
	//"savedMsg" 라는 키값으로 저장된 문자열을 저장할 변수
	String savedMsg=null;
	if(cooks!=null){
		//반복문 돌면서 쿠키 객체를 하나씩 참조
		for(Cookie tmp:cooks){
			//쿠키의 키값을 읽어온다.
			String key=tmp.getName();
			if(key.equals("savedMsg")){//만일 우리가 찾는 키값이라면 
				//해당 키값으로 저장된 value 를 읽어낸다.
				savedMsg=tmp.getValue();
			}
		} //cookie 객체의 성능이 별로라 멋진 메소드 대신 수동으로 하나하나 찾는 과정이 필요하다.
	}
	
	// 이 긴 문장은 ${cookie.savedMsg.value} 로 멋지게 한줄로 가능하다. 
	// 단 Db에 저장할 때는 저런 방식의 사용이 필요하니 알고 있다.
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/test/cookie_read.jsp</title>
</head>
<body>
<p>savedMsg  라는 키값으로 저장된 문자열 : <%=savedMsg %></p>
<a href="cookie_form.jsp">다시 테스트</a>
</body>
</html>




