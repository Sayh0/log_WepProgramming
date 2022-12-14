<%@page import ="java.util.Random" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- 자바 작성 영역 시작(소스 파일 보기로는 안 보임). -->
<%
	String[] list = {"기대하던 일 큰 성과 보겠다.", "현실에 감사하는 마음을 가져라.", 
	    "새로운 길이 열린다.", "서쪽으로 가면 귀인을 만난다.", "때를 잘 활용하라."};
	int ranNum=new Random().nextInt(5);
	//해당 영역의 로컬변수로 fotrune.jsp.java 에 들어있는 로컬변수를 사용 가능하다.
	
	//print()는 servlet의 printWriter랑 비슷함
%>
<!-- 자바 작성 영역 끝(소스 파일 보기로는 안 보임). -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/fortune.jsp</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" />
</head>
<body>
   <p class="alert alert-primary">오늘의 운세: <%=list[ranNum] %></p> <!-- =는 servlet 클래스로 넘어갈 때는 .write가 아닌 .print() 안으로 넘어감. 괄호 안으로 넘어가는 거니까 ; 쓰지 않는다.-->
   <p class="alert alert-primary">오늘의 운세: <%out.print(list[ranNum]);  %></p> <!-- out.print()는 =로 단축 가능하다. 여기선 ; 쓴다. 직접 out.print 라인을 쓰는 거니까.-->
   <!-- %% 안은 통째로 자바 영역으로 들어간다. 그렇게 생각하면 세미콜론 쓰고 안 쓰고 구분할 수 있을 것. -->
</body>
</html>