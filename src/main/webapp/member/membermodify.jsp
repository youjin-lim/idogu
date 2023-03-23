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
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.min.js" integrity="sha384-IDwe1+LCz02ROU9k972gdyvl+AESN10+x7tBKgc9I5HFtuNz0wWnPclzo6p9vxnk" crossorigin="anonymous"></script>
<title>내정보 수정 페이지</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
</head>

<style type="text/css">
div {
	margin: auto;
	text-align: center;
}



table {
	position: relative;
	margin: auto;
}


.divbg{
position: absolute;
background-color: white;
	
	top: 70%;
	left: 50%;
	height: 560px;
	width: 700px;
	margin-top: -450px;
	margin-left: -350px;
	padding-top : 40px;
	border-radius: 7px;


}


#fontsize {
	font-size: large;
}




</style>

<script type="text/javascript">
	function check() {
		if (document.modifyform.M_PW.value == "") {
			alert("비밀번호를 입력하세요");
			document.modfyform.M_PW.focus();
			return  ;
		}

		if (document.modifyform.M_PW2.value == "") {
			alert("비밀번호 확인칸을 확인하세요");
			document.modfyform.M_PW2.focus();
			return;
		}

		if (document.modifyform.M_TEL.value == "") {
			alert("전화번호를 입력하세요");
			document.modfyform.M_TEL.focus();
			
			return ;
		}

		if (document.modifyform.M_EMAIL.value == "") {
			alert("이메일을 입력하세요");
			document.modfyform.M_EMAIL.focus();
			return;
		}

		if (document.modifyform.M_PW.value != document.modifyform.M_PW2.value) {
			alert("비밀번호가 일치하지 않습니다. 다시 확인하세요");
			document.modifyform.M_PW.focus();
			return;
		}

		/* 	location.href = './MemberModifyAction.me';
		 */
		 modifyform.submit(); 

	}

	function deleteMember() {

		if (confirm("정말 탈퇴하시겠습니까 ?")) {
			alert('이용해 주셔서 감사합니다.');
		//	location.href = './MemberDelete.me'; // 탈퇴 메소드로 이동 
			delform.submit();
		} else {
			return ;
			//location.href = '';
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


<body  style="background-image: url('./images/bgdog.png'); background-attachment: fixed; background-size: cover; height: 100vh; "     >
<div class="container">
<header>
      <nav class="navbar navbar-expand-lg navbar-fixed-top">
         <div class="container-fluid">
            <!-- <a href="./Main.re"><img src="images/main.png"></a> -->
         </div>
         <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
          </button>
           <div class="collapse navbar-collapse" id="navbarNavDropdown">
         <ul class="navbar-nav">
            <li class="nav-item">
               <a class="nav-link" href="./Main.re"><font color="white">Home</font></a>
            </li>
            <li class="nav-item">
               <a class="nav-link" href="./Book_1.re" target="_self"><font color="white">Reservation</font></a>
            </li>
            <li class="nav-item">
               <a class="nav-link" href="#"><font color="white">search</font></a>
            </li>
            <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"><font color="white">
               Community
            </font></a>
            <ul class="dropdown-menu">
               <li><a class="dropdown-item" href="./BoardList.no" target="_self">Notice</a></li>
               <li><a class="dropdown-item" href="./BoardList.do" target="_self">Q & A</a></li>
            </ul>
            </li>
         </ul>
         </div>
      </nav>
   </header>
  </div>
<form  name="delform"  action="./MemberDelete.me"></form>

<div class="divbg" >
	<form style="position: relative;" method="post" name="modifyform"
		action="./MemberModifyAction.me">

		<div>
			<h1 style="color: #cccccc">회원정보 수정 페이지</h1>
		</div>
		<br> <br>

		<table id="fontsize" >

			<tr style="background-color: #cccccc" height="2px;">
				<td colspan="2"></td>

			</tr>
			<tr>
				<td>&nbsp;</td>
			</tr>

			<tr align="center">
				<td>아이디 :</td>
				<td align="left"><input style="background-color: #E4E4E4;"
					type="text" name="M_ID" value="<%=member.getM_ID()%>"
					readonly="readonly"></td>


			</tr>

			<tr align="center">
				<td>비밀번호 :</td>
				<td align="left"><input name="M_PW" type="password"
					value="<%=member.getM_PW()%> " oninput="isSame()"></td>
			</tr>

			<tr align="center">
				<td>비밀번호 확인 :</td>
				<td align="left"><input name="M_PW2" type="password" value=""
					oninput="isSame()"></td>
			</tr>

			<tr align="right">
				<td colspan="2">&nbsp; <span id="same"></span>
				</td>
			</tr>


			<tr align="center">
				<td>이름 :</td>
				<td align="left"><input style="background-color: #E4E4E4;"
					type="text" name="M_NAME" value="<%=member.getM_NAME()%>"
					readonly="readonly"></td>

			</tr>

			<tr align="center">
				<td>전화번호 :</td>
				<td align="left"><input name="M_TEL" type="text"
					value="<%=member.getM_TEL()%>"></td>
			</tr>

			<tr align="center">
				<td>이메일 주소 :</td>
				<td align="left"><input name="M_EMAIL" type="text"
					value="<%=member.getM_EMAIL()%>"></td>
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
				<td colspan="2" align="center">
					<button type="button" onclick="check();" style="margin-left: 30px;" class="btn btn-outline-dark"  >저장</button>
					&nbsp;&nbsp;
					<button type="button" onclick="deleteMember();"  class="btn btn-outline-dark" >회원 탈퇴</button>&nbsp;&nbsp;
					<button onclick="history.back(-1);" class="btn btn-outline-dark" >뒤로가기</button>
				

				</td>
			</tr>





		</table>


		<!-- &nbsp;&nbsp;  <input type="button" value="회원 탈퇴"  onclick="deleteMember();" > -->

	</form>
	</div>

</body>
</html>