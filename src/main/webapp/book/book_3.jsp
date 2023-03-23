<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="net.book.db.*"%>
<%
RoomBean room = (RoomBean) request.getAttribute("roomdata");
%>
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
<script src="http://code.jquery.com/jquery-1.11.2.min.js"></script>
<script type="text/javascript" src="./js/book3_check.js"></script>
</head>
<body onload="cost()">
	<%@ include file="../home/header.jsp"%>
	<div style="padding-bottom: 100px">
	<div id="divbg3">
		<form name="book_3" id="book_3" action="./Book_4.re" method="post" onsubmit="return reservationCheck_1();">
			<div id="divbg3_1">
				<h1 style="color: #cccccc" align="center">상세정보입력하기</h1>
				<br>
			</div>
			<table id="tb_book3">
				<tr style="background-color: #cccccc" height="2px;">
					<td colspan="2"></td>
				</tr>
				<tr><td>&nbsp;</td></tr>
				<tr>
					<td>날짜확인</td>
					<td><%=session.getAttribute("K_IN")%>&nbsp;~&nbsp; <%=session.getAttribute("K_OUT")%>&nbsp;&nbsp;
				</tr>
				<tr>
					<td>숙박일수</td>
					<td id="K_NOD" name="K_NOD"><%=session.getAttribute("K_NOD")%>
					</td>
				</tr>
				<tr>
					<td>소형견</td>
					<td id="K_SMALL"><%=session.getAttribute("K_SMALL")%></td>
				<tr>
					<td>중형견</td>
					<td><%=session.getAttribute("K_MEDIUM")%></td>
				<tr>
					<td>대형견</td>
					<td><%=session.getAttribute("K_BIG")%></td>
				</tr>
				<tr>
					<td>객실</td>
					<td><%=room.getR_NAME()%></td>
					<td><input type="hidden" id="<%=room.getR_NUM()%>"
						name="R_NUM" value="<%=room.getR_NUM()%>"></td>
				</tr>
				<tr>
					<td>객실 세부사항</td>
					<td><%=room.getR_CONTENT()%></td>
				</tr>
				<tr>
					<td>객실 가격</td>
					<td id="R_COST" name="R_COST"><%=room.getR_COST()%>
					</td>				
				</tr>
				<tr><td>&nbsp;</td></tr>
				<tr style="background-color: #cccccc" height="1px;">
					<td colspan="2"></td>
				</tr>
				<tr><td>&nbsp;</td></tr>
				
				<tr>
					<td>견종</td>
				</tr>
				<tr>
					<td colspan="2" align="right"><input type="text" id="K_DOG" name="K_DOG">&nbsp;&nbsp;&nbsp;&nbsp;</td>
				<tr>
					<td>강아지 이름</td>
				</tr>
				<tr>
					<td colspan="2" align="right"><input type="text" id="K_DOGNAME" name="K_DOGNAME">&nbsp;&nbsp;&nbsp;&nbsp;</td>
				</tr>
				<tr>
					<td>강아지 나이</td>
				</tr>
				<tr>
					<td colspan="2" align="right"><input type="text" id="K_AGE" name="K_AGE">&nbsp;세</td>
				</tr>
				<tr>
					<td>강아지 몸무게</td>
				</tr>
				<tr>
					<td colspan="2" align="right"><input type="text" id="K_KG" name="K_KG">&nbsp;kg</td>
				</tr>
				<tr>
					<td>특이사항</td>
				</tr>
				<tr>
					<td colspan="2" align="right">
                  		<textarea name="K_CONTENT" id="K_CONTENT" cols="25"   rows="5"></textarea><br>
                  		<font color="#cccccc">특이사항이나 알러지 정보를 기재해주세요</font>
              		</td>
				<tr>
					<td>추가항목</td>
				</tr>
				<tr>
					<td colspan="2" align="right"><input type="checkbox" name="K_COURSE"
							class="K_COURSE" id="snack" value="간식주기" onclick="add()">간식주기&nbsp;+5,000원&nbsp;
					</td>
				</tr>
				<tr>
					<td colspan="2" align="right"><input type="checkbox" name="K_COURSE"
							class="K_COURSE" id="walk" value="산책하기" onclick="add()">산책하기&nbsp;+10,000원
					</td>
				</tr>
				<tr>
					<td colspan="2" align="right"><input type="checkbox" name="K_COURSE"
							class="K_COURSE" id="beauty" value="미용하기" onclick="add()">미용하기&nbsp;+30,000원
					</td>
				<tr>
					<td >총 금액</td>
				</tr>
				<tr>
					<td colspan="2" align="right"><div id="sub"><font color="red">
						<span id="K_TOTAL"></span>
						<input type="hidden" id="K_TOTAL2"	name="K_TOTAL2"></font>원</div>
					</td>
				</tr>
				<tr><td><br></td></tr>
				<tr style="background-color: #cccccc" height="2px;">
					<td colspan="2"></td>
				</tr>
				<tr><td><br></td></tr>
				<tr>
					<td colspan="2" align="center">
						<button type="button" onclick="javascript:history.go(-1)"
							class="btn btn-outline-dark">뒤로</button>
						<button type="submit" class="btn btn-outline-dark">예약하기</button>

					</td>
				</tr>
			</table>
		</form>
	</div>
	</div>
</body>
<script>
	var r_cost = document.getElementById("R_COST").innerHTML;
	var k_nod = document.getElementById("K_NOD").innerHTML;
	var snack = document.getElementById("snack").innerHTML;
	var walk = document.getElementById("walk").innerHTML;
	var beauty = document.getElementById("beauty").innerHTML;
	var k_total = r_cost * k_nod;
	
	
	window.onload = function cost() {
		if(<%=session.getAttribute("K_SMALL")%> !== 0){
			k_total *= <%=session.getAttribute("K_SMALL")%>;
		}
		if(<%=session.getAttribute("K_MEDIUM")%> !== 0){
			k_total *= <%=session.getAttribute("K_MEDIUM")%>;
		}
		if(<%=session.getAttribute("K_BIG")%> !== 0){
			k_total *= <%=session.getAttribute("K_BIG")%>;
		}
		document.getElementById("K_TOTAL").innerHTML = k_total;
		document.getElementById("K_TOTAL2").value = k_total;
		var format_reslut= Number(document.getElementById("K_TOTAL").innerHTML).toLocaleString();
		document.getElementById("K_TOTAL").innerHTML = format_reslut;
	
	}
	
	function add() {
		var check1 = document.getElementById("snack").checked;
		var check2 = document.getElementById("walk").checked;
		var check3 = document.getElementById("beauty").checked;
	
		if (check1) {
			snack = 5000;
		} else {
			snack = 0;
		}
		if (check2) {
			walk = 10000;
		} else {
			walk = 0;
		}
		if (check3) {
			beauty = 30000;
		} else {
			beauty = 0;
		}
		document.getElementById("K_TOTAL").innerHTML = k_total + snack
				+ walk + beauty;
		document.getElementById("K_TOTAL2").value = k_total + snack + walk
				+ beauty;
		var format_reslut= Number(document.getElementById("K_TOTAL").innerHTML).toLocaleString();
		document.getElementById("K_TOTAL").innerHTML = format_reslut;
	}
</script>
</html>