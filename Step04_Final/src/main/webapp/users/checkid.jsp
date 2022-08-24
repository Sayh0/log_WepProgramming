<%@page import="test.users.dao.UsersDao"%>
<%@page import="test.users.dto.UsersDto"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%--contentType이 application/json 인 것 확인하자.--%>
<%
	// inputId 라는 파라미터명으로 전달되는 문자열 읽어오기
	String inputId=request.getParameter("inputId");
	// dto 는 null 일수도 있고 아닐수도 있다 
	UsersDto dto=UsersDao.getInstance().getData(inputId);	
%>
<%if(dto==null){ %>
	{"isExist":false}
<%}else{ %>
	{"isExist":true}
<%}%>
<%--본 문서는 JSON 형식이기 때문에 세미콜론(;) 을 쓰는 것은 문법에 어긋난다.{isExist:false} 처럼 "" 뺴먹어서도 안된다. --%>
<%--어길 시 Syntax Error : JSON~ 어쩌고 하는 오류 발생..--%>
