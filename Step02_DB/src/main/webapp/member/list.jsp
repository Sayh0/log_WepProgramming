<%@page import="test.member.dao.MemberDao"%>
<%@page import="java.util.List"%>
<%@page import="test.member.dto.MemberDto"%>
<%@ page import="test.util.DbcpBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  
<%
	new DbcpBean().getConn();
	MemberDao dao=MemberDao.getInstance();
	List<MemberDto> list=dao.getList();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/member/list.jsp</title>

</head>
	<div class="container">
		<a href="insertform.jsp">회원추가</a>
		<h1>회원 목록 페이지입니다.</h1>
		<table>
			<thead>
				<tr>
					<th>번호</th>
					<th>이름</th>
					<th>주소</th>
				</tr>
			</thead>
			<tbody>
				<%for(MemberDto tmp:list) { %>
					<tr>
						<td><%=tmp.getNum() %></td>
						<td><%=tmp.getName() %></td>
						<td><%=tmp.getAddr() %></td>
					</tr>
				<%} %>
			</tbody>
		</table>
	</div>
</html>