<%@ page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	List<String> list=new ArrayList<String>();
	list.add("김구라");
	list.add("해골");
	list.add("원숭이");
	list.add("주뎅이");
	list.add("덩어리");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/friend/list.jsp</title>
<!-- bootSrtrap -->
<link href=\"https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css\" rel=\"stylesheet\" integrity=\"sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx\" crossorigin=\"anonymous\">
</head>
<body>
	<h1> 친구 목록입니다. </h1>
	<div class="container">
		<ul>
			<%	
				for(int i=0;i<list.size();i++) {
				  String tmp=list.get(i);
				  out.print("<li>"+tmp+"</li>");
				}
			%>
		</ul>
	<h2> 이렇게도 가능합니다. </h2>
		<ul>
			<%for(String tmp : list) {%>	  
				  <li><%=tmp %></li>
			<%}%>
		</ul>	
	</div>
</body>
</html>