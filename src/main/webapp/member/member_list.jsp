<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="net.member.db.*" %>
<%
	List memberlist = (List)request.getAttribute("memberlist");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 관리 시스템 (관리자 모드)</title>
</head>
<body>
<table border="1">
	<tr align="center">
		<td colspan="2">회원 목록</td>
	</tr>
	
	<%
		for(int i=0; i<memberlist.size();i++) {
			MemberBean member = (MemberBean)memberlist.get(i);			
	%>
	
	<tr align="center">
		<td>
			<a href="MemberViewAction.me?id=<%=member.getM_ID() %>">
				<%=member.getM_ID() %>
			</a>
		</td>
		<td>
			<a href="MemberDeleteAction.me?id=<%=member.getM_ID() %>">삭제</a>
		</td>
	</tr>
	<% } %>
	
	<tr align="center">
		<td colspan="2">
			<a href="./BoardList.do">[게시판 이동]</a>
		</td>
	</tr>
</table>
</body>
</html>