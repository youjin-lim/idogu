<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="net.member.db.*"%>

<!--  id에 해당하는 member 정보를 담아옴  -->
<%
MemberBean member = (MemberBean) request.getAttribute("member");

request.setAttribute("member", member);
%>

<%
if (member.getM_ID() == null) {
%>
<script type="text/javascript">
	alert('회원 전용 공간입니다. 로그인 후 이용하세요');

	window.location.href = '메인 화면 주소 넣기 ';
</script>

<%
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내정보 확인하기</title>
</head>

<style type="text/css">
#cstyle {
	position: relative;
	left: 40%;
}

#tds {
	width: 150px;
}


</style>
<body>
	<h2 style="color: #cccccc"  align="center" >회원정보 확인페이지</h2>

	<form id="cstyle"    >
		<input type="hidden" name="M_ID" value="<%=member.getM_ID()%>">
		<table>

			<tr style="background-color: #cccccc" height="2px;">
				<td colspan="2"></td>

			</tr>
			<tr>
				<td>&nbsp;</td>
			</tr>




			<tr align="center">
				<td>아이디 :</td>
				<td id="tds"><%=member.getM_ID()%></td>
			</tr>

			<tr align="center">
				<td>비밀번호 :</td>
				<td><%=member.getM_PW()%></td>
			</tr>

			<tr align="center">
				<td>이름 :</td>
				<td><%=member.getM_NAME()%></td>
			</tr>

			<tr align="center">
				<td>전화번호 :</td>
				<td><%=member.getM_TEL()%></td>
			</tr>

			<tr align="center">
				<td>이메일 주소 :</td>
				<td><%=member.getM_EMAIL()%></td>
			</tr>

			<tr align="center">
				<td colspan="2"><a href="BookList.re"> 내 예약내역 확인하기 </a></td>
			</tr>
			
			<tr>
			<td> &nbsp; </td>
			</tr>
			




			<tr style="background-color: #cccccc" height="2px;">
				<td colspan="2"></td>

			</tr>

		</table>
		<br> <a onclick="location.href='MemberModify.me'"> [ 내정보 수정하기 ]
		</a>

	</form>

</body>
</html>