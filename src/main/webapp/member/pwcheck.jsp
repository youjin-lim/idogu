<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="net.member.db.*" %>
<%
	String pw = (String)request.getAttribute("findPW");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
<style>
	.center {
		position:absolute;
		top:45%;
		left:40%;
		align:center;
	}
</style>
</head>
<body>
<header>
<nav class="navbar navbar-expand-lg navbar-fixed-top" id="right">
			<div class="container-fluid">
				<!-- <a href="./Main.re"><img src="images/main.png"></a> -->
			</div>
			
			
			<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
    		  <span class="navbar-toggler-icon"></span>
 			</button>
 			 <div class="collapse navbar-collapse" id="navbarNavDropdown">
			<ul class="navbar-nav">
				<li class="nav-item">
					<a class="nav-link" href="#"><font color="black">Brand</font></a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="./Book_1.re" target="content"><font color="black">Reservation</font></a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="#"><font color="black">search</font></a>
				</li>
				<li class="nav-item dropdown">
				<a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"><font color="black">
					Community
				</font></a>
				<ul class="dropdown-menu">
					<li><a class="dropdown-item" href="./BoardList.no" target="content">Notice</font></a></li>
					<li><a class="dropdown-item" href="./BoardList.do" target="content">Q & A</font></a></li>
				</ul>
				</li>
			</ul>
			</div>
		</nav>
	</header>
<div class="center"><h3>회원님의 비밀번호는 "<%= pw %>" 입니다.<br><br><br><br></h3>
<a class="center" href="./MemberLogin.me">확인</a></div>
</body>
</html>