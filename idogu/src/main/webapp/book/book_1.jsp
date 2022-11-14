<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>book_1</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<style>
	/*datepicer 버튼 롤오버 시 손가락 모양 표시*/
	.ui-datepicker-trigger{cursor: pointer;}
	/*datepicer input 롤오버 시 손가락 모양 표시*/
	.hasDatepicker{cursor: pointer;}
</style>
<script type="text/javascript" src="./js/book_datepicker.js"></script>
<script type="text/javascript" src="./js/book_1.js"></script>
</head>
<body>
<form action="./Book_2.re" method="post" name="book_1" id="book_1">
<input type="hidden" name="K_IN" id="K_CHECKIN" value="0">	
<input type="hidden" name="K_OUT" id="K_CHECKOUT" value="0">	
<input type="hidden" name="K_NOD" id="K_NOD" value="0">	
<input type="hidden" name="K_SMALL" id="K_SMALL" value="0">	
<input type="hidden" name="K_MEDIUN" id="K_MEDIUN" value="0">	
<input type="hidden" name="K_BIG" id="K_BIG" value="0">	

	<table >
			<tr>
				<td ><div align="left">날짜 선택</div></td>
			</tr>
			<tr>
				<td>체크인</td>
				<td>
					<input type="text" name="K_IN" id="K_IN">
				</td>
			<tr>
				<td>체크아웃</td>
				<td>
					<input type="text" name="K_OUT" id="K_OUT">
				</td>
			</tr>
			<tr>
				<td>숙박일수</td>
				<td>
					<div id="K_NOD" class="K_NOD">&nbsp;일</div>
				</td>
			</tr>
			<tr bgcolor="#cccccc">
				<td colspan=2 style="height:1px;"></td>
			</tr>
			<tr><td>강아지 크기<td></tr>
			<tr align="center">
				<td >소형견</td>
				<td align="right">
					<input type="number" min='0' max='10' id="K_SAMLL" name="K_SAMLL" value="0">마리
				</td>
			</tr>
			<tr align="center">
				<td >중형견</td>
				<td align="right">
					<input type="number" min='0' max='10' id="K_MEDIUN" name="K_MEDIUN" value="0">마리
				</td>
			</tr>
			<tr align="center">
				<td >대형견</td>
				<td align="right">
					<input type="number" min='0' max='10' id="K_BIG" name="K_BIG" value="0">마리
				</td>
			</tr>
			<tr>	
				<td colspan="2" align="center">
					<a href="./Book_2.re">[객실 선택하기]</a>
					<a href="javascript:history.go(-1)">[뒤로]</a>
				</td>
	</table>
</form>
</body>
</html>