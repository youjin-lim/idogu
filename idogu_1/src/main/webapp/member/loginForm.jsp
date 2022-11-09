<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 페이지</title>

<style type="text/css">
table {

    
	border: 2px solid blue;
	align-content: center;
}

#sty {


margin: 10px; 

padding: 20px;

}
</style>

<script type="text/javascript" src="../js/jquery.js" ></script>

<script type="text/javascript">

window.onload = function () {
	
	$('#in').onclick(function() {
		location.href='javascript:loginform.submit()';
	});
	
	$('#make').onclick(function() {
		location.href='MemberJoin.do';
	})
	
}


</script>

</head>
<body>

	<form name="loginform" action="./MemberLoginAction.do" method="post"  id="sty" >

		<table>

			<tr>
				<td colspan="2" align="center">로그인 페이지</td>
			</tr>

			<tr>
				<td>아이디 :</td>
				<td><input type="text" name="MEMBER_ID"></td>
			</tr>


			<tr>
				<td>비밀번호 :</td>
				<td><input type="password" name="MEMBER_PW"></td>
			</tr>
			
			<tr>
			<td colspan="2"   align="right"> 
			<input type="button" value="로그인"   id="in" >
			 <input type="button" value="회원가입"   id="make" >
			 </td>
			</tr>
			




		</table>





	</form>



</body>
</html>