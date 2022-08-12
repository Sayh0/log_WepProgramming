<%@page import="java.util.List"%>
<%@page import="test.member.dao.MemberDao"%>
<%@page import="test.member.dto.MemberDto"%>
<%@page import="test.util.DbcpBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
%>
<%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
	String name=request.getParameter("name");
	String address=request.getParameter("address");
		
	MemberDto dto=new MemberDto();
	dto.setName(name);
	dto.setAddr(address);
	
	MemberDao dao=MemberDao.getInstance();
	boolean isSuccess=dao.insert(dto);
	List<MemberDto> list=dao.getList();


%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/member/insert.jsp</title>
</head>
	<div class="container">
		<a href="list.jsp">돌아가기</a>
		<h1>수정된 회원 페이지입니다.</h1>
		<table>
			<thead>
				<tr>
					<th>번호</th>
					<th>이름</th>
					<th>주소</th>
				</tr>
			</thead>
			<tbody>
				<%for(MemberDto tmp: list) { %>
					<tr>
						<td><%=tmp.getNum() %></td>
						<td><%=tmp.getName() %></td>
						<td><%=tmp.getAddr() %></td>
					</tr>
				<%} %>
			</tbody>
		</table>
		<p><%=name %></p>
		<p><%=address %></p>
		<p><%=isSuccess %></p>
	</div>
	<%if(isSuccess){%>
	<script>alert("회원 추가 작업 성공");</script>
	<%}else {%>
	<script>alert("회원 추가 작업 실패");</script>
	<%} %>   
</html>