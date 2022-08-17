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
	// 1. 폼 전송되는 name과 address 추출
	String name=request.getParameter("name");
	String address=request.getParameter("address");
	// 2. MemberDto 객체에 회원 정보 담기.
	MemberDto dto=new MemberDto();
	dto.setName(name);
	dto.setAddr(address);
	// 3. DB에 저장.
	MemberDao dao=MemberDao.getInstance();
	// 4. MemberDao 객체 이용해 DB 저장 후 성공여부 리턴받음
	boolean isSuccess=dao.insert(dto);
	List<MemberDto> list=dao.getList();

	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/member/insert.jsp</title>

<!-- bootstrap -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>

<style>
@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap');
body { font-family: 'Noto Sans KR', sans-serif; }
</style>

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
	<!-- 응답여부 부분 -->
   <div class="container mt-5">
      <h1>알림</h1>
      <%if(isSuccess){ %>
         <p class="alert alert-success">
            <strong><%=name %></strong> 의 정보를 추가 했습니다.
            <a class="alert alert-link" href="list.jsp">돌아가기</a>
         </p>
      <%}else{ %>
         <p class="alert alert-danger">
            회원 정보 추가 실패!
            <<a class="alert alert-link" href="insertform.jsp">다시 입력</a>
         </p>
      <%} %>
   </div>

</html>