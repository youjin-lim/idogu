<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.util.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="net.notice.db.*" %>

<%
	List boardList = (List)request.getAttribute("boardlist");
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
<title>공지사항</title>
<script type="text/javascript">
	function submitSrchForm() {
		document.srchForm.srchKey.value = document.srchForm.srchKey.value.trim();
		document.srchForm.submit();
	}
	
	function resetSrchForm() {
		document.srchForm.srchFlds[0].selected = true;
		document.srchForm.srchKey.value = "";
	}
</script>
</head>

<body>
	<!-- 게시판 리스트 -->
	<table>
	<%
		if (listcount > 0) {
	%>
	
	<tr align="center" valign="middle">
		<td colspan="5">공지사항 게시판</td>
	</tr>
	
	<tr align="center" valign="middle" bordercolor="#333333">
		<td style="font-family: Tahoma; font-size: 10pt;" width="10%" height="26">
			<div align="center">번호</div>
		</td>
		
		<td style="font-family: Tahoma; font-size: 10pt;" width="60%" height="26">
			<div align="center">제목</div>
		</td>
		
		<td style="font-family: Tahoma; font-size: 10pt;" width="20%" height="26">
			<div align="center">작성일</div>
		</td>
		
		<td style="font-family: Tahoma; font-size: 10pt;" width="10%" height="26">
			<div align="center">조회수</div>
		</td>
	</tr>
	
	<%
		for (int i = 0; i < boardList.size(); i++) {
			NoticeBean bl = (NoticeBean)boardList.get(i);
	%>
	
	<tr align="center" valign="middle" bordercolor="#333333"
		onmouseover="this.style.backgroundColor='#F8F8F8'"
		onmouseout="this.style.backgroundColor=''">
	
		<td height="23" style="font-family:Tahoma; font-size: 10pt;">
			<%= bl.getN_NUM() %>
		</td>
	
		<td style="font-family:Tahoma; font-size: 10pt;">
			<div align="left">
				<a href="./BoardDetailAction.no?num=<%= bl.getN_NUM() %>"><%= bl.getN_SUB() %></a>
			</div>
		</td>
	
		<td style="font-family:Tahoma; font-size: 10pt;">
			<div align="center"><%= bl.getN_DATE() %></div>
		</td>
	
		<td style="font-family:Tahoma; font-size: 10pt;">
			<div align="center"><%= bl.getN_READCOUNT() %></div>
		</td>
	</tr>
	
	<%
		}
	%>
	<tr align="center" height="20">
		<td colspan="6" style="font-family:Tohoma; font-size: 10pt;">
			<% if (nowpage <= 1) { %>
				[이전]&nbsp;
			<% } else { %>
				<a href="./BoardList.no?page=<%= nowpage - 1 %>">[이전]</a>&nbsp;
			<% } %>	
			
			<% for (int a = startpage; a <= endpage; a++) {
				if (a == nowpage) {	%>
					[<%= a %>]&nbsp;
				<% } else { %>
					<a href="./BoardList.no?page=<%= a %>">[<%= a %>]</a>&nbsp;
				<% } %>
			<% } %>
			
			<% if (nowpage >= maxpage) { %>
				[다음]
			<% } else { %>
				<a href="./BoardList.no?page=<%= nowpage + 1 %>">[다음]</a>&nbsp;
			<% } %>
		</td>
	</tr>
	
	<% } else { %>
	
	<tr align="center" valign="middle">
		<td colspan="4">공지사항</td>
		<td align="right">
			<font size="2">등록된 글이 없습니다.</font>
		</td>
	</tr>
	
	<% } %>
	
	<tr align="right">
		<td colspan="5">
			<a href="./BoardWrite.no">[글쓰기]</a>
		</td>
	</tr>
	</table>
</body>
</html>