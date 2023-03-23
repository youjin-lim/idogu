<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="net.member.db.*" %>

<%
 	String id = request.getParameter("id");
	MemberDAO memberdao = new MemberDAO();
	int result = memberdao.isDuplicateId(id);
	out.print(result); 
%>