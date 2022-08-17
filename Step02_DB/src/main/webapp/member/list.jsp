<%@ page import="test.member.dao.MemberDao"%>
<%@ page import="java.util.List"%>
<%@ page import="test.member.dto.MemberDto"%>
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

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>

<style>
@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap');
body { font-family: 'Noto Sans KR', sans-serif; }
</style>

</head>
<body>
<jsp:include page="/include/navibar.jsp">
	<jsp:param value="member" name="thisPage"/>
</jsp:include>

	<div class="container">
		<a href="insertform.jsp">회원추가</a>
		<h1>회원 목록 페이지입니다.</h1>
		<table>
			<thead>
				<tr>
					<th>번호</th>
					<th>이름</th>
					<th>주소</th>
					<th>삭제</th>
					<th>수정</th>
				</tr>
			</thead>
			<tbody>
				<%for(MemberDto tmp:list) { %>
					
					<tr>
						<td><%=tmp.getNum() %></td>
						<td><%=tmp.getName() %></td>
						<td><%=tmp.getAddr() %></td>
						<td><a href="delete.jsp?num=<%=tmp.getNum()%>">삭제</a></td>
						<!-- 링크대로 넘기는 건데 ? 붙어서 가는것 >> Step01_index 참조 -->
						<!-- 해당 페이지로 value를 들고가도록 할 수 있다. -->
						<td><a href="updateform.jsp?num=<%=tmp.getNum()%>">수정</a></td>
						
					</tr>
					
				<%} %>
			</tbody>
		</table>
	</div>
	<jsp:include page="/include/footer.jsp"></jsp:include>]
</body>
</html>