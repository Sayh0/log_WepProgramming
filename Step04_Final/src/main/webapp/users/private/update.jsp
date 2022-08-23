<%@page import="test.users.dao.UsersDao"%>
<%@page import="test.users.dto.UsersDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//1. 수정할 회원의 정보를 읽어와서
	String id=(String)session.getAttribute("id");
 	String email=request.getParameter("email");
 	//프로필 이미지의 경로 읽어오기 ( 등록하지 않았으면 "empty" 이다 )
 	String profile=request.getParameter("profile");
 	UsersDto dto=new UsersDto();
 	dto.setId(id);
 	dto.setEmail(email);
 	//만일 프로필 이미지가 등록되 있는 상태라면
 	if(!profile.equals("empty")){
 		//dto에 전송된 프로필 이미지 경로를 담아준다.
 		dto.setProfile(profile);
 	}
 	//위의 if문 안쪽 블록이 수행되지 않았으면 dto에 profile 이라는 필드에는 null 이 들어있다.
 	
 	//2. DB 에 수정반영하고
 	boolean isSuccess=UsersDao.getInstance().update(dto);
 	//3. 응답한다.
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/users/private/update.jsp</title>
</head>
<body>
	<script>
		<%if(isSuccess){%>
			alert("수정 했습니다.");
			location.href="info.jsp";
		<%}else{%>
			alert("수정실패");
			location.href="updateform.jsp";
		<%}%>
	</script>
</body>
</html>





