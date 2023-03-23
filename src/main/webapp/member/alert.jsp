<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="net.member.action.*" %>
<%@ page import="net.member.db.*" %>
<%@ page import="java.io.PrintWriter" %>
<%
	String check = (String)request.getAttribute("check");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login</title>
</head>
<body>
<%
		if(check.equals("id")) {
		
		 	out.println("<script>");
			out.println("alert('비밀번호가 틀렸습니다.');");
			out.println("location.href='./MemberLogin.me';");
			out.println("</script>");
			out.close();
	 	}
		else if(check.equals("pw")) { 
		    out.println("<script>");
			out.println("alert('아이디가 존재하지 않습니다.');");
			out.println("location.href='./MemberLogin.me';");
			out.println("</script>");
			out.close(); 
	}	
%>

		
</body>
</html>