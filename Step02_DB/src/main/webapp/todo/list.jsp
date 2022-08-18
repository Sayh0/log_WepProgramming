<%@page import="java.util.List"%>
<%@page import="test.todo.dao.TodoDao"%>
<%@page import="test.todo.dto.TodoDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%
	List<TodoDto> list = TodoDao.getInstance().getList();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/todo/list.jsp</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
<style>
.a1 {
   float: right;
}
</style>
<script type="text/javascript">

	function insertBtn(){
		location.href = "insertform.jsp";
	}

	function updateBtn(){
		//체크된 <input type="radio">요소의 참조값을 얻어오기
		let radio = document.querySelector('[name=radio]:checked');
		//만약 없다면?
		if(radio==null){
			alert("수정할 컨텐츠를 체크 하세요!");
			return;//함수를 여기서 끝내기 
		}
		//할일 수정 페이지로 이동하면서 get 방식 파라미터를 이용해 수정할 번호 가지고 가게 하기.
		location.href = "updateform.jsp?num="+radio.value;
	}
   	//삭제 버튼을 눌렀을때 호출되는 함수 
	function deleteBtn(){
		let radio = document.querySelector('[name=radio]:checked');
		if(radio==null){
			alert("삭제할 컨텐츠를 체크 하세요!");
			return;//함수를 여기서 끝내기 
		}
		if(confirm("정말로 삭제 합니까?")){
		  //delete.jsp 페이지로 이동하면서 num 이라는 파라미터 명으로 삭제할 번호를 들고 가도록 한다. 
		  location.href = "delete.jsp?num="+radio.value;
		}
	}
</script>

<!-- Bootstrap -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>

<style>
@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap');
body {
	font-family: 'Noto Sans KR', sans-serif;
}
</style>

<body>
<jsp:include page="/include/navibar.jsp">
	<jsp:param value="todo" name="thisPage"/>
</jsp:include>

   <div class="container">
      <h1 align="center">오늘할일</h1>
      <!-- 
      <a href="insertform.jsp" class="a1">할일추가</a>
       -->
      <table class="table table-bordered table-hover">
         <thead class="table-dark">
            <tr style="margin:auto; text-align:center;">
               <th width="100" align="center">번호</th>
               <th>할일</th>
               <th width="200">날짜</th>
               <th width="100">선택</th>
            </tr>
         </thead>
         <tbody>
            <%for (TodoDto tmp : list) {%>
            <tr>
               <td><%=tmp.getNum()%></td>
               <td><%=tmp.getContent()%></td>
               <td><%=tmp.getRegdate()%></td>
               <td><input type="radio" name="radio" value="<%=tmp.getNum()%>"/></td>
            </tr>
            <%}%>
         </tbody>
      </table>
   </div>
   <div class="container" align="right">
      <button type="button" class="btn btn-dark" onclick="insertBtn()">추가</button>
      <button type="button" class="btn btn-dark" onclick="updateBtn()">수정</button>
      <button type="button" class="btn btn-danger" onclick="deleteBtn()" >삭제</button>
   </div>
	<jsp:include page="/include/footer.jsp"></jsp:include>
</body>
</html>





