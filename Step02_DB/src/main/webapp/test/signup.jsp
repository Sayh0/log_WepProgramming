<%@ page import="java.util.Map"%>
<%@ page import="java.util.HashMap"%>
<%@ page import="java.util.Arrays"%>
<%@ page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	//한글 깨짐 방지
	request.setCharacterEncoding("utf-8");
	
	/*
		폼 전송되는 모든 내용을 추출해서 아래에 정보를 출력한다
	*/
	
	
	String email=request.getParameter("email");
	String comment=request.getParameter("comment");
	String job=request.getParameter("job");
	String[] concern=request.getParameterValues("concern");
	if (concern==null){
		concern=new String[0]; //넘어오는 게 없으면 빈 배열의 참조값을 넣어줌.
	}
	String gender=request.getParameter("gender");	
	if (gender==null){
		gender=" "; //넘어오는 게 없으면 빈 참조값을 넣어줌.
	}	
	//String[]을 List<String> 으로 변환하기.
	//변환하면 .contains() 메소드를 활용 가능
	List<String> list=Arrays.asList(concern);
%>



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/test/signup.jsp</title>
</head>
<body>
<div class="container">

   <h1>전송된 정보는 아래와 같습니다.</h1>
   <div>
      <label for="email">이메일</label>
      <input type="text" name="email" id="email" value="<%=email%>"/>
   </div>
   <div>
      <label for="comment">할말</label>
      <textarea name="comment" id="comment"><%=comment%></textarea>
   </div>
   <div>
      <label for="job">직업</label>
      <select name="job" id="job">
         <option value="">선택</option> <!-- 직업은 선택을 안 해도 빈 문자열이 넘어가기 때문에 nullPointException 안뜬다-->
         <option value="programmer" <%=job.equals("programmer") ? "selected" : "" %>>프로그래머</option>
         <option value="teacher" <%=job.equals("teacher") ? "selected" : "" %>>선생님</option>
         <option value="doctor" <%=job.equals("doctor") ? "selected" : "" %>>의사</option>
         <option value="etc" <%=job.equals("etc") ? "selected" : "" %>>기타</option>
      </select>
   </div>
   <div>
      <fieldset>
         <legend>관심사 체크</legend>
         <label>
            <input type="checkbox" name="concern" value="reading" <%=list.contains("reading")?"checked":""%>/> 
            독서
         </label>
         <label>
            <input type="checkbox" name="concern" value="game" <%=list.contains("game")?"checked":""%>/> 
            게임
         </label>
         <label>
            <input type="checkbox" name="concern" value="cooking" <%=list.contains("cooking")?"checked":""%>/> 
            요리
         </label>
      </fieldset>
   </div>
   <div>
      <fieldset>
         <legend>성별 체크</legend>
         <label>
            <input type="radio" name="gender" value="man"<%=gender.equals("man")?"checked":""%>/>
            남자
         </label>
         <label>
            <input type="radio" name="gender" value="woman"<%=gender.equals("woman")?"checked":""%>/>
            여자
         </label>
      </fieldset>
   </div>
</div>
</body>
</html>