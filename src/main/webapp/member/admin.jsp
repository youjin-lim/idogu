<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, java.text.SimpleDateFormat, net.member.db.*" %>
<%
List<MemberBean> list = (List)request.getAttribute("memberlist");
int listcount = ((Integer)request.getAttribute("listcount")).intValue();
int nowpage = ((Integer)request.getAttribute("page")).intValue();
int maxpage = ((Integer)request.getAttribute("maxpage")).intValue();
int startpage = ((Integer)request.getAttribute("startpage")).intValue();
int endpage = ((Integer)request.getAttribute("endpage")).intValue();

%>



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<link rel="stylesheet" href="css/book_stylesheet.css">
<style type="text/css">
#fostyle {
   position: relative;
   padding-top:5%;
}
.center{
/* position: absolute; */
background-color: white;
	left: 50%;
	height: 500px;
	width: 1580px;
	margin-top: -450px;
	margin-left: -780px;
	border-radius: 7px;
	margin: auto;
	margin-top:8%;
}
</style>
</head>
<body>
<%@ include file="../home/header.jsp"%>
	<div class="center">
	<form id="fostyle">
	<h3 align="center">회원 목록</h3><br><br>
	<table class="table table-sm" style="width:1490px; margin:auto;">
		<tr bgcolor="#B3D2FA" align="center">
			<th>회원 이름</th>
			<th>회원 아이디</th>
			<th>회원 삭제</th>
		</tr>
		
		<%for(int i = 0; i < list.size(); i++) {
		MemberBean mb = list.get(i);
		session.setAttribute("d_id", mb.getM_ID());
		
		%>
		<tr onmouseover="this.style.backgroundColor = '#D0FBFF' " onmouseout="this.style.backgroundColor = ''" align="center">
			<td><%=mb.getM_NAME()%></td>
			<td><%=mb.getM_ID() %></td>
			<td><a href="./AdminDeleteAction.me?d_id=<%=mb.getM_ID() %>"  >삭제</a><!-- 특정 회원 삭제하는 Action, 쿼리 --></td>
		<%} %>
	</table>
	
	<div style="text-align: right">총 회원수: ${listcount }명&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div>
	<div style="text-align: center">
		<%if(nowpage <= 1) {%> <!-- 현재 페이지가 [1]이라면 하이퍼링크 달지 않음 -->
		◀ 이전&nbsp;
		<%}else { %> 
		<a class="atag" href="./adminview.me?page=<%=nowpage -1 %>">◀ 이전</a>&nbsp;
		<%} %><!-- 회원 많아야지 제대로 실행되는지 알 수 있음 -->
				
		<%for(int a = startpage; a <= endpage; a++) { 
			if(a == nowpage){ %> <!-- 현재페이지에는 하이퍼링크 달지 않음 -->
			<%=a %>&nbsp;
			<%}else { %>
			<a class="atag" href="./adminview.me?page=<%=a %>"><%=a %></a>
			&nbsp;
			<%} %>
		<%} %>
				
			<%if(nowpage >= endpage) {%> <!-- 현재페이지가 마지막 페이지라면 하이퍼링크 달지 않음 -->
			다음 ▶
			<%}else { %>
			<a class="atag" href="./adminview.me?page=<%=nowpage + 1 %>">다음 ▶</a>
			<%} %>
		</div>
	</form>
	</div>
</body>
</html>