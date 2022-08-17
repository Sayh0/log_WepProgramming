<%@page import="java.util.List"%>
<%@page import="test.todo.dao.TodoDao"%>
<%@page import="test.todo.dto.TodoDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	request.setCharacterEncoding("utf-8");
	response.setCharacterEncoding("utf-8");
	
	String content=request.getParameter("content");
	
	TodoDto dto=new TodoDto();
	dto.setContent(content);
	
	TodoDao dao=TodoDao.getInstance();
	
	boolean isSuccess=dao.insert(dto);
	List<TodoDto> list=dao.getListAll();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/todo/insertform.jsp</title>
<!-- bootstrap -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
</head>
<body>
<!--  부트스트랩 js 사용 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript" src="/js/bootstrap.js"></script>
	<div class="container">
		<a href="list.jsp">돌아가기</a>
		<h1>할일 페이지입니다.</h1>
		<table class="table table-sm">
			<thead>
				<tr>
					<th>번호</th>
					<th>할일</th>
					<th>등록날짜</th>
				</tr>
			</thead>
			<tbody>
				<%for(TodoDto tmp: list) { %>
					<tr>
						<td><%=tmp.getNum() %></td>
						<td><%=tmp.getContent() %></td>
						<td><%=tmp.getRegdate() %></td>
					</tr>
				<%} %>
			</tbody>
		</table>
		
	</div>
	<!-- 응답여부 부분 -->
   <div class="container">
      <h1>알림</h1>
      <%if(isSuccess){ %>
         <p>
            정보를 추가했습니다.
            <a href="list.jsp">돌아가기</a>
         </p>
      <%}else{ %>
         <p>
            회원 정보 추가 실패!
            <a href="insertform.jsp">다시 입력</a>
         </p>
      <%} %>
   </div>
</body>
</html>