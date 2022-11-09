<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="net.member.db.*" %>
<!--  id에 해당하는 member 정보를 담아옴  -->
<%
MemberBean member = (MemberBean) request.getAttribute("member");

%>



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내정보 수정하기</title>
</head>
<body>

	<table border="1">

		<tr align="center">
			<td>아이디 :</td>
			<td><%=member.getM_ID()%></td>
		</tr>

		<tr align="center">
			<td>비밀번호 :</td>
			<td>   <input name="M_PW" type="text" value="<%= member.getM_PW() %>" > </td>
		</tr>

		<tr align="center">
			<td>이름 :</td>
			<td><%=member.getM_NAME()%></td>
		</tr>

		<tr align="center">
			<td>전화번호 :</td>
			<td>  <input name="M_TEL" type="text" value="<%= member.getM_TEL() %>" > </td>
		</tr>

		<tr align="center">
			<td>이메일 주소 :</td>
			<td>  <input name="M_EMAIL" type="text" value="<%= member.getM_EMAIL() %>" > </td>
		</tr>


		<tr align="right">
			<td colspan="2">     <button onclick="location.href='MemberModifyAction.me' "  >저 장</button>  </td>
		</tr>

	</table>

</body>
</html>