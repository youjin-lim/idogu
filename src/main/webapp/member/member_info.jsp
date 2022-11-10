<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="net.member.db.*" %>
<%
	MemberBean member = (MemberBean)request.getAttribute("member");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 목록 상세보기 (관리자 모드)</title>
</head>
<body>
	<table>
		<tr>
			<td>아이디 : </td>
			<td><%=member.getM_ID() %></td>
		</tr>
		
		<tr>
			<td>비밀번호 : </td>
			<td><%=member.getM_PW() %></td>
		</tr>
		
		<tr>
			<td>이름 : </td>
			<td><%=member.getM_NAME() %></td>
		</tr>
		
		<tr>
			<td>휴대전화 : </td>
			<td><%=member.getM_TEL() %></td>
		</tr>
		
		<tr>
			<td>이메일 : </td>
			<td><%=member.getM_EMAIL() %></td>
		</tr>
		
		<tr>
			<td colspan="2">
				<a href="./MemberListAction.me">회원 정보 목록</a>
			</td>
		</tr>
	</table>
</body>
</html>