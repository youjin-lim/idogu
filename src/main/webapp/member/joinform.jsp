<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="net.member.db.MemberBean"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 창 만들기</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.min.js" integrity="sha384-IDwe1+LCz02ROU9k972gdyvl+AESN10+x7tBKgc9I5HFtuNz0wWnPclzo6p9vxnk" crossorigin="anonymous"></script>
<style>
@import url(//fonts.googleapis.com/earlyaccess/notosanskr.css);
	.center {
		position:absolute;
		left:50%;
		transform:translateX(-50%);
		display:flex;
		background-color:white;
		width:510px;
		height:580px;
		font-family: 'Noto Sans KR';
		border-radius:7px;
		margin-top:7%;
	}
	table {
		font-size:11pt;
	}
	#right {
		position:relative;
		right:8%;
	}
	.back {
		position:relative;
		margin:auto;
		left:2%;
	}
	.container {
 		width: 90%;
 		margin: 0 auto;
	}
</style>
<!-- http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js -->
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script type="text/javascript">

function pwcheck() {
	var pw = document.getElementById('pw').value;
	var pw2 = document.getElementById('pw2').value;
	
	if(pw == pw2) {
		document.getElementById('check').innerHTML='비밀번호가 일치합니다.';
		document.getElementById('check').style.color='blue';
	}
	else {
		document.getElementById('check').innerHTML='비밀번호가 일치하지 않습니다.';
		document.getElementById('check').style.color='red';
	}
}

function join() {
	var id = document.getElementById("id");
	var pw = document.getElementById("pw");
	var pw2 = document.getElementById("pw2");
	var name = document.getElementById("name");
	var tel = document.getElementById("tel");
	var email = document.getElementById("email");
	
	if(id.value == "") {
		alert("아이디를 입력해주세요.");
		id.focus();
		return false;
	}

	if(pw.value == "") {
		alert("비밀번호를 입력해주세요.");
		pw.focus();
		return false;
	}
	
	if(pw2.value == "") {
		alert("비밀번호 확인을 입력해주세요.");
		pw2.focus();
		return false;
	}
	
	if(name.value == "") {
		alert("이름을 입력해주세요.");
		name.focus();
		return false;
	}
	
	if(tel.value == "") {
		alert("휴대폰 번호를 입력해주세요.");
		tel.focus();
		return false;
	}
	
	if(email.value == "") {
		alert("이메일을 입력해주세요.");
		email.focus();
		return false;
	}
	
	document.joinform.submit();
}

$(function() {
	$('#id_check').click(function() {
		let id = $('#id_check').val(); 
		
		$.ajax ({
			type:'POST',
			data : {'id' : $('input[name=M_ID]').val()},
			url : './member/idCheckform.jsp',
			dataType:'text',
			success:function(result) {
				if(result == 0) {
					$('#joincheck').prop('disabled', true);
					$('#idmessage').text('이미 사용중인 아이디입니다.');
					$('#idmessage').css('color', 'red');
					$('#idmessage').show();
				}
				else if(result == 1){
					$('#joincheck').prop('disabled', false);
					$('#idmessage').text('사용 가능한 아이디입니다.');
					$('#idmessage').css('color', 'blue');
					$('#idmessage').show();
				}
			}
		});
	})
})

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
<form action="./MemberJoinAction.me" name="joinform" method="post" class="center" class="center">
<div class="back">
	<table>
		<h4>JOIN</h4>
		<tr>
			<td>아이디</td>
		</tr>
		<tr>
			<td>
				<input type="text" id="id" name="M_ID" size="25" placeholder="아이디를 입력해주세요.">
				<input type="button" value="중복 확인" id="id_check" class="btn btn-outline-dark btn-sm">
				<div id="idmessage" style="display:none;"></div>
			</td>
		</tr>
		
		<tr>
			<td>비밀번호</td>
		</tr>
		<tr>
			<td>
				<input type="password" id="pw" name="M_PW" size="25" onchange="pwcheck()" placeholder="비밀번호를 입력해주세요.">
			</td>
		</tr>
		
		<tr>
			<td>비밀번호 확인</td>
		</tr>
		<tr>
			<td>
				<input type="password" id="pw2" name="M_PW" size="25" placeholder="비밀번호 확인을 입력해주세요." onchange="pwcheck()">
			</td>
		</tr>
		<tr>
			<td>
				<span id="check"></span>
			</td>
		</tr>
		<tr>
			<td>이름</td>
		</tr>
		<tr>
			<td>
				<input type="text" id="name" name="M_NAME" size="25" placeholder="이름을 입력해주세요.">
			</td>
		</tr>
		
		<tr>
			<td>휴대전화</td>
		</tr>
		<tr>
			<td>
				<input type="text" id="tel" name="M_TEL" size="25" placeholder="'-'을 제외한 숫자만 입력하세요.">
			</td>
		</tr>
		
		<tr>
			<td>이메일</td>
		</tr>
		<tr>
			<td>
				<input type="text" id="email" name="M_EMAIL" size="25" value="" placeholder="이메일을 입력해주세요."><br><br>
			</td>
		</tr>
		<tr>
			<td>
				<input type="button" value="회원가입" id="joincheck" onclick="join()" class="btn btn-outline-dark btn-sm">
				<input type="button" value="취소" onclick="javascript:history.go(-2)" class="btn btn-outline-dark btn-sm">
			</td>
		</tr>
	</table>
</div>
</form>
</body>
</html>