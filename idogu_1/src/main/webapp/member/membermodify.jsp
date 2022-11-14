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

#formstyle {
	border: 2px solid gray;
}
</style>

<script type="text/javascript">
	function check() {
		if (document.modifyform.M_PW.value == "") {
			alert("비밀번호를 입력하세요");
			document.modfyform.M_PW.focus();
			return;
		}
		
		if (document.modifyform.M_PW2.value == "") {
			alert("비밀번호 확인칸을 확인하세요");
			document.modfyform.M_PW2.focus();
			return;
		}
		

		if (document.modifyform.M_TEL.value == "") {
			alert("전화번호를 입력하세요");
			document.modfyform.M_TEL.focus();
			return;
		}

		if (document.modifyform.M_EMAIL.value == "") {
			alert("이메일을 입력하세요");
			document.modfyform.M_EMAIL.focus();
			return;
		}

		
		if(document.modifyform.M_PW.value != document.modifyform.M_PW2.value){
			alert("비밀번호가 일치하지 않습니다. 다시 확인하세요");
			document.modifyform.M_PW.focus();
			return;
		}
		
		
		
		/* 	location.href = './MemberModifyAction.me';
		 */
		modifyform.submit();

	}

	function deleteMember() {

		if (confirm("정말 탈퇴하시겠습니까 ? ")) {
			location.href = './MemberDelete.me'; // 탈퇴 메소드로 이동 
		} else {
			location.href = '';
		}
	}

	function isSame() {

		if (document.modifyform.M_PW.value != ''
				&& document.modifyform.M_PW2.value != '') {

			if (document.modifyform.M_PW.value == document.modifyform.M_PW2.value) {
				document.getElementById('same').innerHTML = '비밀번호가 일치합니다.';
				document.getElementById('same').style.color = 'blue';

			} else {

				document.getElementById('same').innerHTML = '비밀번호가 일치하지 않습니다.';
				document.getElementById('same').style.color = 'red';

			}

		}

	}
</script>


<body>

	<h2 style="color: #cccccc"  align="center" >회원정보 수정 페이지</h2>

	<form id="cstyle" method="post" name="modifyform"
		action="./MemberModifyAction.me">
		<table>

			<tr style="background-color: #cccccc" height="2px;">
				<td colspan="2"></td>

			</tr>
			<tr>
				<td>&nbsp;</td>
			</tr>

			<tr align="center">
				<td>아이디 :</td>
				<td align="left"><input style="background-color: #E4E4E4;"
					type="text" name="M_ID" value="<%=member.getM_id()%>"
					readonly="readonly"></td>


			</tr>

			<tr align="center">
				<td>비밀번호 :</td>
				<td align="left"><input name="M_PW" type="password"
					value="<%=member.getM_pw()%> " onchange="isSame()"></td>
			</tr>

			<tr align="center">
				<td>비밀번호 확인 :</td>
				<td align="left"><input name="M_PW2" type="password"
					value="" onchange="isSame()">
					</td>
			</tr>
			
			<tr align="right">
			<td  colspan="2" > &nbsp; <span id="same"></span> </td>
			</tr>
			

			<tr align="center">
				<td>이름 :</td>
				<td align="left"><input style="background-color: #E4E4E4;"
					type="text" name="M_NAME" value="<%=member.getM_name()%>"
					readonly="readonly"></td>

			</tr>

			<tr align="center">
				<td>전화번호 :</td>
				<td align="left"><input name="M_TEL" type="text"
					value="<%=member.getM_tel()%>"></td>
			</tr>

			<tr align="center">
				<td>이메일 주소 :</td>
				<td align="left"><input name="M_EMAIL" type="text"
					value="<%=member.getM_email()%>"></td>
			</tr>

			<tr>
				<td>&nbsp;</td>
			</tr>

			<tr style="background-color: #cccccc" height="2px;">
				<td colspan="2"></td>

			</tr>




		</table>
		<br> 
		<a style="margin-left: "30px;" onclick="check();">[ 저 장]</a> &nbsp;&nbsp; 
		<a onclick="deleteMember();"> [ 회원 탈퇴 ] </a>  &nbsp; &nbsp;
		<a   onclick="history.go(-1); return false;" >[ 뒤로가기2 ]</a>

		<!-- &nbsp;&nbsp;  <input type="button" value="회원 탈퇴"  onclick="deleteMember();" > -->

	</form>

</body>
</html>