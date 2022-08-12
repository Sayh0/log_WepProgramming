<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/member/insertform.jsp</title>
</head>
<body>
<div class="container">
	<h1>회원 추가 폼 입니다.</h1>
	<form action="insert.jsp" method="post">
		<div>
			<label for="name">이름</label>
			<input type="text" name="name" id="name"/>
		</div>
		<div>
			<label for="address">주소</label>
			<input type="text" name="address" id="address"/>
		</div>
		<button type="submit">추가</button>
	</form>
</div>
</body>
</html>