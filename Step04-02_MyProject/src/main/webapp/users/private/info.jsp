
<%@page import="test.users.UsersDao"%>
<%@page import="test.users.UsersDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//1. session scope 에서 로그인된 아이디 불러오기
	String id=(String)session.getAttribute("id");
	//2. DB 에서 가입 정보를 불러온다.
	UsersDto dto=UsersDao.getInstance().getData(id);
	//3. 응답한다.
%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/users/private/info.jsp</title>
<!-- bootstrap -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
<!-- bootstrap -->
<!-- font -->
<style>
@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap');
body { font-family: 'Noto Sans KR', sans-serif; }
</style>
<!-- font -->
<style>
	#profileImage {
		width: 100px;
		height: 100px;
		border: 1px solid #cecece;
		border-radius: 50%;
	}
</style>
</head>
<body>
<jsp:include page="/WEB-INF/include/navbar.jsp"></jsp:include>
	<div class="container">
		<h1>가입 정보 입니다.</h1>
		<table>
			<tr>
				<th>아이디</th>
				<td><%=id %></td>
			</tr>
			<tr>
				<th>프로필 이미지</th>
				<td>
					<%if(dto.getProfile()==null){ %>
						<svg id="profileImage" xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-person-circle" viewBox="0 0 16 16">
							  <path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0z"/>
							  <path fill-rule="evenodd" d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8zm8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1z"/>
						</svg>
					<%}else{ %>
						<img id="profileImage" 
							src="${pageContext.request.contextPath }<%=dto.getProfile()%>">
					<%} %>
				</td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><a href="pwd_updateform.jsp">수정하기</a></td>
			</tr>
			<tr>
				<th>이메일</th>
				<td><%=dto.getEmail() %></td>
			</tr>
			<tr>
				<th>가입일</th>
				<td><%=dto.getRegdate() %></td>
			</tr>
		</table>
		<a href="updateform.jsp">개인정보 수정</a>
		<a href="javascript:deleteConfirm()">탈퇴</a>
	</div>
	<script>
		function deleteConfirm(){
			let isDelete=confirm("확인을 누르면 회원 탈퇴가 됩니다. 탈퇴 하시겠습니까?");
			if(isDelete){
				location.href="delete.jsp";
			}
		}
	</script>
</body>
</html>











