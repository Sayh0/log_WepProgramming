<%@page import="test.util.DbcpBean"%>
<%@page import="java.util.List"%>
<%@page import="test.todo.dao.TodoDao"%>
<%@page import="test.todo.dto.TodoDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	new DbcpBean().getConn();
	TodoDao dao=TodoDao.getInstance();
	List<TodoDto> list=dao.getListAll();
%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/todo/list.jsp</title>
<!-- bootstrap -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
</head>
	<div class="container">
		<a href="insertform.jsp">할일 추가</a>
		<h1>할일 목록 페이지입니다.</h1>
		<table class="table table-sm">
			<thead>
				<tr>
					<th>번호</th>
					<th>할일</th>
					<th>날짜</th>
					<th>삭제</th>
					<th>수정</th>
				</tr>
			</thead>
			<tbody>
				<%for(TodoDto tmp:list) { %>
					<tr>
						<td><%=tmp.getNum() %></td>
						<td><%=tmp.getContent() %></td>
						<td><%=tmp.getRegdate() %></td>
						<td><a href="delete.jsp?num=<%=tmp.getNum()%>">삭제</a></td>
						<td><a href="updateform.jsp?num=<%=tmp.getNum()%>">수정</a></td>
					</tr>
				<%} %>
			</tbody>
		</table>
	</div>
<!--  부트스트랩 js 사용 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript" src="/js/bootstrap.js"></script>
</body>
</html>