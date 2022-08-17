<%@page import="java.util.List"%>
<%@page import="test.todo.dao.TodoDao"%>
<%@page import="test.todo.dto.TodoDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
	int intNum=Integer.parseInt(request.getParameter("num"));
		
	TodoDto dto=new TodoDto();
	dto.setNum(intNum);
	
	TodoDao dao=TodoDao.getInstance();
	boolean isSuccess=dao.delete(dto);
	List<TodoDto> list=dao.getListAll();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/todo/delete.jsp</title>
<!-- bootstrap -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
</head>
	<div class="container">
		<a href="list.jsp">돌아가기</a>
		<h1>수정된 할일 페이지입니다.</h1>
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
	<%if(isSuccess){%>
	<script>alert("할일 삭제 작업 성공");</script>
	<%}else {%>
	<script>alert("할일 삭제 작업 실패");</script>
	<%} %>   
<!--  부트스트랩 js 사용 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript" src="/js/bootstrap.js"></script>
</body>
</html>