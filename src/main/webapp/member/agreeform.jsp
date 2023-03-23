<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="net.member.db.MemberBean"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.min.js" integrity="sha384-IDwe1+LCz02ROU9k972gdyvl+AESN10+x7tBKgc9I5HFtuNz0wWnPclzo6p9vxnk" crossorigin="anonymous"></script>
<title>Insert title here</title>
<style>
@import url(//fonts.googleapis.com/earlyaccess/notosanskr.css);

	.notosanskr * { 
 		font-family: 'Noto Sans KR', sans-serif;
	}
	.agree {
		margin:auto;
	}
	.normal {
		width:350px;
		height:97px;
		overflow:auto;
		border:1px solid #d3d3d3;
		font-size:10pt;
		font-family: 'Noto Sans KR';
		}
	span {
		font-size:10pt;
	}
	#right {
		position:relative;
		right:8%;
	}
	h4, h5 {
		font-family: 'Noto Sans KR';
	}
	.back {
		position:absolute;
		left:50%;
		transform:translateX(-50%);
		display:flex;
		background-color:white;
		width:530px;
		height:650px;
		font-family: 'Noto Sans KR';
		border-radius:7px;
		margin-top:5%;
	}
	.container {
 		 width: 90%;
 		 margin: 0 auto;
	}
</style>
<script type="text/javascript">
function chk(){
	if(document.getElementById('check_1').checked == false) {
		alert('필수 약관에 동의하셔야 합니다.');
	}
	if(document.getElementById('check_2').checked == false) {
		alert('필수 약관에 동의하셔야 합니다.');
	}
	if(document.getElementById('check_1').checked && document.getElementById('check_2').checked == true) {
		location.href='http://localhost:8088/idogu/MemberJoin.me';
	}
}

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
<div class="back">
<div class="agree">

	<h4>I dog U 이용약관</h4>
	<br>
	<h5>I dog U 이용약관 동의<strong>(필수)</strong></h5>
		<div class="normal">
			<strong>'아이도그유'를 이용해 주셔서 감사합니다. </strong><br><br>
			본 약관은 다양한 아이도그유 서비스의 이용과 관련하여 아이도그유 서비스를 제공하는 아이도그유 주식회사(이하 ‘아이도그유’)와 이를 이용하는 아이도그유 서비스 회원(이하 ‘회원’) 또는 비회원과의 관계를 설명하며, 
			아울러 여러분의 아이도그유 서비스 이용에 도움이 될 수 있는 유익한 정보를 포함하고 있습니다. <br><br>
			아이도그유 서비스를 이용하시거나 아이도그유 서비스 회원으로 가입하실 경우 여러분은 본 약관 및 관련 운영 정책을 확인하거나 동의하게 되므로, 
			잠시 시간을 내시어 주의 깊게 살펴봐 주시기 바랍니다.
		</div>
		<input type="checkbox" name="check_1" id="check_1"> <span>이용 약관에 동의합니다.</span>
	
	<h5>개인정보 수집 및 이용 동의<strong>(필수)</strong></h5>
		<div class="normal">
			개인정보보호법에 따라 '아이도그유'에 회원가입 신청하시는 분께 수집하는 개인정보의 항목, 개인정보의 수집 및 이용목적, 개인정보의 보유 및 이용기간, 동의 거부권 및 동의 거부 시 불이익에 관한 사항을 안내 드리오니 자세히 읽은 후 동의하여 주시기 바랍니다. <br><br>
			<strong>1. 수집하는 개인정보</strong><br>
			이용자는 회원가입을 하지 않아도 정보 검색, 뉴스 보기 등 대부분의 '아이도그유' 서비스를 회원과 동일하게 이용할 수 있습니다. 
			이용자가 메일, 캘린더, 카페, 블로그 등과 같이 개인화 혹은 회원제 서비스를 이용하기 위해 회원가입을 할 경우, 아이도그유는 서비스 이용을 위해 필요한 최소한의 개인정보를 수집합니다. <br><br>
			회원가입 시점에 아이도그유가 이용자로부터 수집하는 개인정보는 아래와 같습니다. <br>
			- 회원 가입 시 필수항목으로 아이디, 비밀번호, 이름, 생년월일, 성별, 휴대전화번호를, 선택항목으로 본인확인 이메일주소를 수집합니다.<br>
			단, 비밀번호 없이 회원 가입 시에는 필수항목으로 아이디, 이름, 생년월일, 휴대전화번호를, 선택항목으로 비밀번호를 수집합니다. <br>
			만약 이용자가 입력하는 생년월일이 만14세 미만 아동일 경우에는 법정대리인 정보(법정대리인의 이름, 생년월일, 성별, 중복가입확인정보(DI), 휴대전화번호)를 추가로 수집합니다. <br>
			- 단체아이디로 회원가입 시 단체아이디, 비밀번호, 단체이름, 이메일주소, 휴대전화번호를 필수항목으로 수집합니다. 그리고 단체 대표자명을 선택항목으로 수집합니다. <br><br>
			서비스 이용 과정에서 이용자로부터 수집하는 개인정보는 아래와 같습니다. <br>
			- 회원정보 또는 개별 서비스에서 프로필 정보(별명, 프로필 사진)를 설정할 수 있습니다. 회원정보에 별명을 입력하지 않은 경우에는 마스킹 처리된 아이디가 별명으로 자동 입력됩니다. <br>
			- 아이도그유 내의 개별 서비스 이용, 이벤트 응모 및 경품 신청 과정에서 해당 서비스의 이용자에 한해 추가 개인정보 수집이 발생할 수 있습니다. 
			추가로 개인정보를 수집할 경우에는 해당 개인정보 수집 시점에서 이용자에게 ‘수집하는 개인정보 항목, 개인정보의 수집 및 이용목적, 개인정보의 보관기간’에 대해 안내 드리고 동의를 받습니다.
		</div>
		<input type="checkbox" name="check_2" id="check_2"> <span>이용 약관에 동의합니다.</span>
		
	<h5>프로모션 정보 수신 동의<strong>(선택)</strong></h5>
		<div class="normal">
			'아이도그유'에서 제공하는 이벤트/혜택 등 다양한 정보를 휴대전화, 이메일로 받아보실 수 있습니다. <br>
			일부 서비스(별도 회원 체계로 운영하거나 네이버 가입 이후 추가 가입하여 이용하는 서비스 등)의 경우, 
			개별 서비스에 대해 별도 수신 동의를 받을 수 있으며, 이때에도 수신 동의에 대해 별도로 안내하고 동의를 받습니다.
		</div>
		<input type="checkbox" name="check_3" id="check_3"> <span>이용 약관에 동의합니다.</span>
		
		<br><br>
		
		<input type="button" onclick="chk()" value="확인" class="btn btn-outline-dark btn-sm">
		<input type="button" value="취소" onclick="javascript:history.go(-1)" class="btn btn-outline-dark btn-sm">
</div>
</div>
</body>
</html>