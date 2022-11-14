<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="net.member.db.*"%>

<!--  id에 해당하는 member 정보를 담아옴  -->
<%
MemberBean member = (MemberBean) request.getAttribute("member");

request.setAttribute("member", member);
%>

<%
if (member.getM_id() == null) {
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
div {
	margin: auto;
	text-align: center;
}

#fostyle {
	position: absolute;
	top: 50%;
	left: 50%;
	height: 420px;
	width: 350px;
	margin-top: -300px;
	margin-left: -175px;
}

table {
	position: relative;
	margin: auto;
	width: 300px;
}
</style>
<body>

	<form id="fostyle">
		<input type="hidden" name="M_ID" value="<%=member.getM_id()%>">

		<div>
			<h1 style="color: #cccccc">회원정보 확인페이지</h1>
		</div>
		<br> <br>
		<table>




			<tr style="background-color: #cccccc" height="2px;">
				<td colspan="2"></td>

			</tr>
			<tr>
				<td>&nbsp;</td>
			</tr>




			<tr align="center">
				<td>아이디 :</td>
				<td id="tds"><%=member.getM_id()%></td>
			</tr>

			<tr align="center">
				<td>비밀번호 :</td>
				<td><%=member.getM_pw()%></td>
			</tr>

			<tr align="center">
				<td>이름 :</td>
				<td><%=member.getM_name()%></td>
			</tr>

			<tr align="center">
				<td>전화번호 :</td>
				<td><%=member.getM_tel()%></td>
			</tr>

			<tr align="center">
				<td>이메일 주소 :</td>
				<td><%=member.getM_email()%></td>
			</tr>

			<tr align="center">
				<td colspan="2"><a href="BookList.re" style="text-decoration: none; color: b " > <br>  ✔  ‍예약 내역 확인하기 </a></td>
			</tr>

			<tr>
				<td>&nbsp;</td>
			</tr>





			<tr style="background-color: #cccccc" height="2px;">
				<td colspan="2"></td>

			</tr>

			<tr>
				<td>&nbsp;</td>
			</tr>

			<tr>
				<td colspan="2"  align="center" >
				
				<a onclick="history.go(-1) ;return false;" > [뒤로가기] </a>
				&nbsp; &nbsp;
				<a onclick="location.href='MemberModify.me'"> [ 내정보 수정하기 ] </a></td>
			</tr>
		</table>


	</form>

</body>
</html>