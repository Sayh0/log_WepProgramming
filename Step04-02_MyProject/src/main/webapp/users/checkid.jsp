<%@page import="test.users.UsersDao"%>
<%@page import="test.users.UsersDto"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
    String inputId=request.getParameter("inputId");
    UsersDto dto=UsersDao.getInstance().getData(inputId);
%>

<%if(dto==null){ %>
	{"isExist":false}
<%}else{ %>
	{"isExist":true}
<%}%>