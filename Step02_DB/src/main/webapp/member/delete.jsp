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
	int intNum=Integer.parseInt(request.getParameter("num"));
		
	MemberDto dto=new MemberDto();
	dto.setNum(intNum);
	
	MemberDao dao=MemberDao.getInstance();
	boolean isSuccess=dao.delete(dto);
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
		<!-- 상대경로로 기입. /member/는 떼고 쓴다. -->
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

	</div>
	<%if(isSuccess){%>
	<script>alert("회원 삭제 작업 성공");</script>
	<%}else {%>
	<script>alert("회원 삭제 작업 실패");</script>
	<%} %>   
</html>