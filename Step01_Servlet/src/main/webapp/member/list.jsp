<%@page import="test.dto.MemberDto"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	//DB 에서 불러온 회원 목록이라고 가정하자
	List<MemberDto> list=new ArrayList<>();
	list.add(new MemberDto(1, "김구라", "노량진"));
	list.add(new MemberDto(2, "해골", "행신동"));
	list.add(new MemberDto(3, "원숭이", "상도동"));
	/*
	 * 회원 목록을 table 형식으로 클라이언트에게 응답해보기
	 */
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/member/list.jsp</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" />
</head>
<body>
	<h1> 회원 목록입니다. </h1>
	<div class="container">
	<table class="table table-stripted">
		<thead class="table-dark">
			<tr>
				<th>번호</th>
				<th>이름</th>
				<th>주소</th>
			</tr>
		</thead>
		<tbody>
		<%for(MemberDto dto:list) { %>
			<tr>
				<td><%=dto.getNum()%></td>
				<td><%=dto.getName()%></td>
				<td><%=dto.getAddr()%></td>
			</tr>
		<%}%>
		</tbody>
	</table>
	</div>
</body>
</html>