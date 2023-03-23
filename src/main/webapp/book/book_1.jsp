<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.text.SimpleDateFormat"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약하기</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi"
	crossorigin="anonymous">
<link rel="stylesheet" href="css/book_stylesheet.css">
<script type="text/javascript" src="./js/book1_check.js"></script>
</head>
<body>
	<%@ include file="../home/header.jsp"%>
	<div id="divbg1">
		<form action="./Book_2.re" method="post" name="book_1" onsubmit="return reservationCheck();">
			<div id="divbg1_1">
				<div>
					<h1 style="color: #cccccc" align="center">예약하기</h1>
					<br>
				</div>

				<table id="tb_book1">
					<tr style="background-color: #cccccc" height="2px;">
						<td colspan="2"></td>
					</tr>
					<tr>
						<td>&nbsp;</td>
					</tr>
					<tr>
						<td><div align="left" id="sub">날짜 선택</div></td>
					</tr>
					<tr>
						<td align="center">체크인</td>
						<td align="center">
							<%
							Date today = new Date();
							SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
							String now = simpleDateFormat.format(today);
							%> <input type="date" name="K_IN" id="K_IN" min="<%=now%>"
							value="sysdate">
						</td>
					<tr>
						<td align="center">체크아웃</td>
						<td align="center"><input type="date" name="K_OUT" id="K_OUT"
							min="<%=now%>"></td>
					<tr>
						<td>&nbsp;</td>
					</tr>
					<tr>
						<td><div id="sub">강아지 크기</div></td>
						<td><div id="isNumber">&nbsp;</div></td>
					</tr>
					<tr align="center">
						<td>소형견</td>
						<td align="center"><input type="text" min='0' max='10'
							id="K_SMALL" name="K_SMALL" value="0" onkeyup="isNumber(this);">마리</td>
					</tr>
					<tr align="center">
						<td>중형견</td>
						<td align="center"><input type="text" min='0' max='10'
							id="K_MEDIUM" name="K_MEDIUM" value="0" onkeyup="isNumber(this);">마리</td>
					</tr>
					<tr align="center">
						<td>대형견</td>
						<td align="center"><input type="text" min='0' max='10'
							id="K_BIG" name="K_BIG" value="0" onkeyup="isNumber(this);">마리</td>
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
							<button type="button" onclick="javascript:history.go(-1)"
								class="btn btn-outline-dark">뒤로</button>
							<button type="submit" class="btn btn-outline-dark">객실
								선택하기</button>
						</td>
				</table>
			</div>
		</form>
	</div>
</body>
<script>
function isNumber(obj){
	if(event.keyCode >= 48 && event.keyCode <= 57 ){
		document.getElementById("isNumber").innerHTML='';
	}else{
		document.getElementById("isNumber").innerHTML='숫자로 입력해주세요';
		document.getElementById("isNumber").style.color='red';
	}
}

</script>
</html>