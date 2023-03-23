<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="net.member.db.*" %>
<%
	String id = (String)request.getAttribute("findId");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기</title>
<style>
	.center {
		position:absolute;
		top:45%;
		left:40%;
		align:center;
	}
</style>
</head>
<body>
<div class="center"><h3>회원님의 아이디는 "<%= id %>" 입니다.<br><br><br><br></h3>
<a class="center" href="./MemberLogin.me">확인</a></div>
</body>
</html>