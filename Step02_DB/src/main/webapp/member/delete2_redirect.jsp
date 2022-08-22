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
	
	// 컨텍스트 경로
	String cPath=request.getContextPath();
	// 아래 경로로 리다이렉트 이동 시킨다.(요청으로 다시 하라고 강요)
	// 리다이렉트 이동시키는 것 자체가 클라이언트 요청에 대한 "응답"이기도 하다!
	response.sendRedirect(cPath+"/member/list.jsp");
	// 이렇게 하면 확 줄여줄 수 있지. 바로 리스트로 돌아옴. 페이지 전체가 리프레시 되는 느낌을 줄 수 있음.
	// 사실 요청(삭제)-응답(다시요청(리다이렉트))이 순간적으로 되는 것임.
	// isSuccess 의 성공 실패 여부와는 상관 없다. 이건 이거대로 동작하는것
%>
<%-- 만약 성공실패여부에 따라 응답을 다르게 받고 싶다면,
<% if(isSuccess){ 
      response.sendRedirect(cPath+"/member/list.jsp");%>
   <%}else{ 
   //아니라면 아래 html을 호출.
   %> 
   <!DOCTYPE html>
   <html>
   <head>
   <meta charset="UTF-8">
   <title>/member/delete.jsp</title>
   </head>
   <body>
      
      <script>
         alert("삭제 실패!");
         location.href="list.jsp";
      </script>
      
   </body>
   </html>
   <%} %>
   
%>
 --%>