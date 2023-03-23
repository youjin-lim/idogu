<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.min.js" integrity="sha384-IDwe1+LCz02ROU9k972gdyvl+AESN10+x7tBKgc9I5HFtuNz0wWnPclzo6p9vxnk" crossorigin="anonymous"></script>
<title>아이디 찾기</title>
<style>
@import url(//fonts.googleapis.com/earlyaccess/notosanskr.css);
	form {
		position:absolute;
		left:50%;
		transform:translateX(-50%);
		background-color:white;
		width:350px;
		height:300px;
		font-family: 'Noto Sans KR';
		border-radius:7px;
		margin-top:15%;
	}
	.right {
		text-align:right;
	}
	#right {
		position:relative;
		right:8%;
	}
	.center {
		position:relative;
		margin:auto;
		left:11%;
		top:20%;
	}
	.container {
 		width: 90%;
 		margin: 0 auto;
	}
</style>
</head>
<body style="background-image:url('./images/bgdog.png'); background-attachment: fixed; background-size: cover; height: 100vh">
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
					<a class="nav-link" href="./home/info.jsp" target="_self"><font color="white">Brand</font></a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="./Book_1.re" target="_self"><font color="white">Reservation</font></a>
				</li>
				<li class="nav-item dropdown">
				<a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"><font color="white">
					Community
				</font></a>
				<ul class="dropdown-menu">
					<li><a class="dropdown-item" href="./BoardList.no" target="_self">Notice</font></a></li>
					<li><a class="dropdown-item" href="./BoardList.do" target="_self">Q & A</font></a></li>
				</ul>
				</li>
			</ul>
			</div>
		</nav>
	</header>
</div>
<form action="./FindIDAction.me" name="findidform" method="post">
	<div class="center">
	<h4>아이디 찾기</h4>
	<br>
	<table>
		<tr>
			<td>이름 </td>
			<td>
				<input type="text" name="M_NAME">
			</td>
		</tr>
		
		<tr>
			<td>이메일 </td>
			<td>
				<input type="text" name="M_EMAIL">
			</td>
		</tr>
		
		<tr>
			<td colspan="4" align="right">
				<a href="javascript:findidform.submit()">확인</a>
				<a href="./MemberLogin.me">취소</a>
			</td>
		</tr>
	</table>
</div>
</form>
</body>
</html>