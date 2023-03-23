<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="net.book.*"%>
<%@ page import="net.book.db.*"%>
<%@ page import="java.util.List"%>
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
</style>
<%
String id = (String) session.getAttribute("id");
//로그인 안됐을때 로그인 페이지로 이동
/* if(session.getAttribute("id")==null){
	 response.sendRedirect("./MemberLogin.me");
 }
*/
Date today = new Date();
SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
String now = simpleDateFormat.format(today);

List roomlist = (List) request.getAttribute("roomList");

String k_nod = session.getAttribute("K_NOD").toString();
request.setAttribute("K_NOD", k_nod);
%>

</head>
<body>
	<%@ include file="../home/header.jsp"%>
	<div style="padding-bottom: 100px">
	<div id="divbg2">
		<form action="./Book_3.re" method="post" name="book_2" >
			<div class="divbg2_1">
				<div>
					<h1 style="color: #cccccc" align="center">객실선택하기</h1>
					<br>
				</div>
				<table id="tb_book2">
					<tr style="background-color: #cccccc" height="2px;">
						<td colspan="2"></td>
					</tr>
					<tr>
						<td>&nbsp;</td>
					</tr>
					<tr>
						<td>숙박일수</td>
						<td align="right"><%=session.getAttribute("K_IN")%>&nbsp;~&nbsp; <%=session.getAttribute("K_OUT")%><br>
					</tr>
					<tr>
						<td colspan="2" align="right">
							<%=session.getAttribute("K_NOD")%>박
						</td>
					</tr>
					<tr>
						<td>소형견&nbsp;<%=session.getAttribute("K_SMALL")%>
							&nbsp;&nbsp;중형견<%=session.getAttribute("K_MEDIUM")%>
							&nbsp;&nbsp;대형견<%=session.getAttribute("K_BIG")%>
						</td>
					</tr>
					<tr>
						<td>&nbsp;</td>
					</tr>
				</table>

				<%
				for (int i = 0; i < roomlist.size(); i++) {
					RoomBean rl = (RoomBean) roomlist.get(i);
				%>
				<table id="tb_book2_1">
					<tr>
						<td rowspan="2">
							<div>
								<%
								if (i == 0) {
								%>
								<img src="./images/dirus_1.PNG" id="dirus">
								<%
								} else if (i == 1) {
								%>
								<img src="./images/superier.PNG" id="superier">
								<%
								} else if (i == 2) {
								%>
								<img src="./images/suite.PNG" id="suite">
								<%
								} else if (i == 3) {
								%>
								<img src="./images/royalsuite.PNG" id="royalsuite">
								<%
								}
								%>
							</div>
						</td>
						<td>
							<div>
								<input type="hidden" name="R_NAME" value="<%=rl.getR_NAME()%>">
								<div id="sub"><%=rl.getR_NAME()%></div>
							</div>
							<div>
								<input type="hidden" name="R_CONTENT"
									value="<%=rl.getR_CONTENT()%>">
								<%=rl.getR_CONTENT()%>
							</div>
							<div>
								예약가 : <input type="hidden" name="R_COST"
									value="<%=rl.getR_COST()%>">
								<%=rl.getR_COST()%>원</div>
						</td>
						<td rowspan="2" align="center" valign="middle">
							<button name="btn_num" type="submit" value="<%=rl.getR_NUM()%>"
								class="btn btn-outline-dark">예약하기</button>
						</td>
					</tr>
					<tr>
						<td>
							<div>
								<%
								if (i == 0) {
								%>
								<img src="./images/dirus_1.PNG" class="small_1"> <img
									src="./images/di_1.PNG" class="small_1"> <img
									src="./images/di_2.PNG" class="small_1"> <img
									src="./images/di_3.PNG" class="small_1">
								<%
								} else if (i == 1) {
								%>
								<img src="./images/superier.PNG" class="small_2"> <img
									src="./images/sp_1.PNG" class="small_2"> <img
									src="./images/sp_2.PNG" class="small_2"> <img
									src="./images/sp_3.PNG" class="small_2">
								<%
								} else if (i == 2) {
								%>
								<img src="./images/suite.PNG" class="small_3"> <img
									src="./images/su_1.png" class="small_3"> <img
									src="./images/su_2.PNG" class="small_3"> <img
									src="./images/su_3.PNG" class="small_3">
								<%
								} else {
								%>
								<img src="./images/royalsuite.PNG" class="small_4"> <img
									src="./images/rs_1.PNG" class="small_4"> <img
									src="./images/rs_2.PNG" class="small_4"> <img
									src="./images/rs_3.PNG" class="small_4">
								<%
								}
								%>
							</div>
						</td>
					</tr>
					<tr>
						<td><br>
						<br></td>
						<%
						}
						%>
					</tr>
					<!-- 다시 반복 -->
					
				</table>
				<table id="tb_book2">
					<tr><td><br></td></tr>
					<tr style="background-color: #cccccc" height="2px;">
						<td colspan="2"></td>
					</tr>
					<tr><td><br><br></td></tr>
					<tr>
						<td align="center" colspan="2">
							<button  type="button" onclick="javascript:history.go(-1)"
								class="btn btn-outline-dark">뒤로</button>
						</td>
					</tr>
				</table>
			</div>
		</form>
	</div>
	</div>
	<script src="./js/showBig-result.js"></script>
</body>
</html>