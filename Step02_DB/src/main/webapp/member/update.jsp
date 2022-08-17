<%@ page import="java.util.List"%>
<%@ page import="test.member.dao.MemberDao"%>
<%@ page import="test.member.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
	
	// 1. 폼 전송되는 수정할 회원의 정보를 읽어온다.
	String num=request.getParameter("num");
	int intNum=Integer.parseInt(num);
	String name=request.getParameter("name");
	String address=request.getParameter("address");
	
	// 2. DB에 수정 반영한다.
	MemberDto dto=new MemberDto();
	dto.setNum(intNum);
	dto.setName(name);
	dto.setAddr(address);
	MemberDao dao=MemberDao.getInstance();

	
	// 3. 응답한다.
	boolean isSuccess=dao.update(dto);
	List<MemberDto> list=dao.getList();

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/member/update.jsp</title>
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

	</div>
	<%if(isSuccess){%>
	<script>alert("회원 수정 작업 성공");</script>
	<%}else {%>
	<script>alert("회원 수정 작업 실패");</script>
	<%} %>   
</html>