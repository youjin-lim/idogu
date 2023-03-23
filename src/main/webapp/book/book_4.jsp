<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi"
	crossorigin="anonymous">
<link rel="stylesheet" href="css/book_stylesheet.css">
<%
	String result = (String) request.getAttribute("result");
	System.out.println(result);
	if (result.equals("true")) {
%>
<title>예약하기</title>
</head>
<body>
	<%@ include file="../home/header.jsp"%>
	<div class="divbg4">
	<div>
		<h1 style="color: #cccccc" align="center">
			<br>예약이 완료되었습니다. </h1><br>
		<h2 style="color: #cccccc" align="center">
			<br>감사합니다</h2>
		<br>
	</div>
	<table class="tb_book4">
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
			<td>&nbsp;</td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<button type="button" class="btn btn-outline-dark" onclick="location.href='Main.re'">
				홈으로 돌아가기</button>			
				<button type="button" class="btn btn-outline-dark" onclick="location.href='BookList.re'">
				예약내역 확인하기</button>			
			</td>
	</table>
</div>
<%
} else {
%>
<div class="divbg4">
	<div>
		<h1 style="color: #cccccc" align="center">
			예약이 완료되지 않았습니다. </h1><br>
		<h2 style="color: #cccccc" align="center">
			다시 시도해주시기 바랍니다.</h2>
		<br>
	</div>
	<table class="tb_book4">
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
			<td>&nbsp;</td>
		</tr>
		<tr>
			<td>
				<td colspan="2" align="center">
				<button type="button" class="btn btn-outline-dark" onclick="location.href='Main.re'">
				홈으로 돌아가기</button>		
			</td>
		<tr>
			<td>
				<button type="button" class="btn btn-outline-dark" onclick="location.href='Book_1.re'">
				다시 예약하기</button>			
			</td>
	</table>
</div>

<%
}
%>

</body>
</html>