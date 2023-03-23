<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="net.member.db.MemberBean"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 페이지</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.min.js" integrity="sha384-IDwe1+LCz02ROU9k972gdyvl+AESN10+x7tBKgc9I5HFtuNz0wWnPclzo6p9vxnk" crossorigin="anonymous"></script>
<style>
@import url(//fonts.googleapis.com/earlyaccess/notosanskr.css);
	.center {
		position:absolute;
		left:50%;
		transform:translateX(-50%);
		background-color:white;
		width:320px;
		height:300px;
		font-family: 'Noto Sans KR', sans-serif;
		border-radius:7px;
		margin-top:15%;
	}
	table {
		font-size:11pt;
	}
	
	a {
		font-size:12pt;
	}
	#right {
		position:relative;
		right:8%;
	}
	.back {
		position:relative;
		margin:auto;
		left:10%;
		top:10%;
	}
	.container {
 		width: 90%;
 		margin: 0 auto;
	}
</style>
<script src="https://t1.kakaocdn.net/kakao_js_sdk/2.0.1/kakao.min.js"
  integrity="sha384-eKjgHJ9+vwU/FCSUG3nV1RKFolUXLsc6nLQ2R1tD0t4YFPCvRmkcF8saIfOZNWf/" crossorigin="anonymous"></script>
<script>
  Kakao.init('8e11bbe7e50e5dab7aea92e12c0d5d8e'); // 사용하려는 앱의 JavaScript 키 입력
</script>

<script>
  function loginWithKakao() {
    Kakao.Auth.authorize({
      redirectUri: 'http://localhost:8088/idogu/Main.me',
    });
  }
  
  // 아래는 데모를 위한 UI 코드입니다.
  displayToken()
  function displayToken() {
    var token = getCookie('authorize-access-token');

    if(token) {
      Kakao.Auth.setAccessToken(token);
      Kakao.Auth.getStatusInfo()
        .then(function(res) {
          if (res.status === 'connected') {
            document.getElementById('token-result').innerText
              = 'login success, token: ' + Kakao.Auth.getAccessToken();
          }
        })
        .catch(function(err) {
          Kakao.Auth.setAccessToken(null);
        });
    }
  }

  function getCookie(name) {
    var parts = document.cookie.split(name + '=');
    if (parts.length === 2) { return parts[1].split(';')[0]; }
  }
  
/*   function agree() {
	  location.href='./MemberAgree.me';
  } */
</script>
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
<form action="./MemberLoginAction.me" name="loginform" method="post" class="center">
<div class="back">
	<table>
		<h4>LOGIN</h4>
		<tr>
			<td>아이디 </td>
			<td>
				<input type="text" name="M_ID"/>
			</td>
		</tr>
		
		<tr>
			<td>비밀번호 </td>
			<td>
				<input type="password" name="M_PW"/>
			</td>
		</tr>
			
		<tr>
			<td colspan="4" align="right">
				<a href="javascript:loginform.submit()">로그인</a>
				<a href="./MemberAgree.me">회원가입</a>
			</td><br>
		</tr>
			
		<tr>
			<td colspan="4" align="center">
				<a href="./FindID.me">아이디 찾기</a>&nbsp;&nbsp;
				<a href="./FindPW.me">비밀번호 찾기</a>
			</td>
		</tr>

	</table>
		<table>
		<tr>
			<td>
				<a id="kakao-login-btn" href="javascript:loginWithKakao()">
  				<img src="https://k.kakaocdn.net/14/dn/btroDszwNrM/I6efHub1SN5KCJqLm1Ovx1/o.jpg" width="260"
    			alt="카카오 로그인 버튼" />
    			<p id="token-result"></p>
				</a>
			</td>
		</tr>
	</table>
</div>
</form>
</body>
</html>