<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="net.member.db.*"%>

<!--  id에 해당하는 member 정보를 담아옴  -->
<%
MemberBean member = (MemberBean) request.getAttribute("member");
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내정보 수정 페이지</title>
</head>

<style type="text/css">
#cstyle {
	position: relative;
	left: 40%;
}
</style>

<script type="text/javascript">

function check() {
	if(document.modifyform.M_PW.value == ""){
		alert("비밀번호를 입력하세요");
		document.modfyform.M_PW.focus();
		return;
}
	
	if(document.modifyform.M_TEL.value == ""){
		alert("전화번호를 입력하세요");
		document.modfyform.M_TEL.focus();
		return;
}
	
	if(document.modifyform.M_EMAIL.value == ""){
		alert("이메일을 입력하세요");
		document.modfyform.M_EMAIL.focus();
		return;
}
	
/* 	location.href = './MemberModifyAction.me';
	 */
	 modifyform.submit();


}

function deleteMember() {
	
	if(confirm("정말 탈퇴하시겠습니까 ? ")){
		location.href='./MemberDelete.me';  // 탈퇴 메소드로 이동 
	}else{
		location.href='';
	}
	
	
	
}



</script>


<body>

<h2  style="color: #cccccc"> 회원정보 수정 페이지 </h2>

	<form id="cstyle"  method="post" name="modifyform"  action="./MemberModifyAction.me"  >
		<table border="1">

			<tr align="center">
				<td>아이디 :</td>
				<td > <input   style="background-color: #E4E4E4;" type="text" name="M_ID" value="<%=member.getM_ID() %>" readonly="readonly" > </td>
				
				
			</tr>

			<tr align="center">
				<td>비밀번호 :</td>
				<td> <input name="M_PW" type="text" value="<%= member.getM_PW() %>" > </td>
			</tr>

			<tr align="center">
				<td>비밀번호 확인 :</td>
				<td> <input name="M_PW2" type="text" value="<%= member.getM_PW() %>" > </td>
			</tr>
			
			<tr align="center">
				<td>이름 :</td>
				<td> <input  style="background-color: #E4E4E4;"  type="text" name="M_ID" value="<%=member.getM_ID() %>" readonly="readonly" > </td>
				
			</tr>

			<tr align="center">
				<td>전화번호 :</td>
				<td><input  name="M_TEL" type="text" value="<%= member.getM_TEL() %>" ></td>
			</tr>

			<tr align="center">
				<td>이메일 주소 :</td>
				<td><input name="M_EMAIL" type="text" value="<%= member.getM_EMAIL() %>" ></td>
			</tr>



		</table>
		<br>
		
		<a   style="margin-left: 105px;"  onclick="check();">[ 저 장 ]</a>
			&nbsp;&nbsp;
		<a onclick="deleteMember();" > [ 회원 탈퇴 ] </a>
		
		<!-- &nbsp;&nbsp;  <input type="button" value="회원 탈퇴"  onclick="deleteMember();" > -->
		
	</form>

</body>
</html>