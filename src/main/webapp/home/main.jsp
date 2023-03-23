<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="net.member.db.MemberBean"%>

<%
	/* 	MemberBean member = new MemberBean();
	Object id = session.getAttribute("id"); */

	String id = null;
	
	if(session.getAttribute("id") != null){
		id = (String)session.getAttribute("id");
	}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.min.js" integrity="sha384-IDwe1+LCz02ROU9k972gdyvl+AESN10+x7tBKgc9I5HFtuNz0wWnPclzo6p9vxnk" crossorigin="anonymous"></script>
<title>IdogU</title>
<style>
.container {
  width: 90%;
  margin: 0 auto;
}
body {
	background-image:url('./images/bgmain.png');
	background-attachment: fixed; 
	background-size: cover; 
	height: 100vh"
}

</style>
</head>
<body>

<form method="post" name="main">
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
					<a class="nav-link" href="./Info.me" target="_self"><font color="white">Brand</font></a>
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
		</nav>
			<div align="right">
				<% if(id == null) { %>
			
				<a href="./MemberLogin.me" target="_self" style="text-decoration: none; color: white; font-size:17pt;">Login</a>
				<a href="./MemberAgree.me" style="text-decoration: none; color: white;font-size:17pt;">Join</a>
				
				<% } else if (id.equals("admin")) {%>
				<a href="./MemberViewAction.me" target="_self" style="text-decoration:none; color:white; font-size:17pt;">관리자 페이지</a>
				<a href="./MemberLogoutAction.me" style="text-decoration: none; color: white;font-size:17pt;">Logout</a>
				
				<%}else { %>
			
				<a href="./MemberViewAction.me" target="_self"  style="text-decoration: none; color: white;font-size:17pt;">내 정보 보기</a>
				<a href="./MemberLogoutAction.me" style="text-decoration: none; color: white;font-size:17pt;">Logout</a>

				<% } %>	
			</div>
	</header>
	</div>
	<!-- <div class="container">
		<iframe src="content.html" name="content" width="100%" height="800px" frameborder="0" framespacing="0" marginheight="0" marginwidth="0" scrolling="no"></iframe>
	</div> -->
</form>
</body>
</html>