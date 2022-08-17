<%@page import="java.util.List"%>
<%@page import="test.todo.dao.TodoDao"%>
<%@page import="test.todo.dto.TodoDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
	
	String num=request.getParameter("num");
	int intNum=Integer.parseInt(num);
	String content=request.getParameter("content");
	String regdate=request.getParameter("regdate");
	
	TodoDto dto=new TodoDto();
	dto.setNum(intNum);
	dto.setContent(content);
	dto.setRegdate(regdate);
	TodoDao dao=TodoDao.getInstance();
	
	boolean isSuccess=dao.update(dto);
	List<TodoDto> list=dao.getListAll();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- bootstrap -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
</head>
	<div class="container">
		<a href="list.jsp">돌아가기</a>
		<h1>수정된 할일 목록입니다.</h1>
		<table>
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
	<script>alert("회원 수정 작업 성공");</script>
	<%}else {%>
	<script>alert("회원 수정 작업 실패");</script>
	<%} %>   
	<!--  부트스트랩 js 사용 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript" src="/js/bootstrap.js"></script>
</body>
</html>