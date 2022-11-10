<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, java.text.SimpleDateFormat, net.board.db.*" %>

<% 
	String id = null;
	if(session.getAttribute("id") != null){  
		id = (String)session.getAttribute("id");  // 로그인할 때 저장된 session
	}
	
	List boardList = (List)request.getAttribute("boardlist"); // BoardListction.java에서 넘어온 값
	// boardList에 최대 10개의 게시물들이 담겨져있음
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
<title>문의 게시판</title>
</head>
<body>
<!-- 게시판 리스트 -->
	<table>
		<tr align="center" valign="middle" bgcolor="#cccc66">
			<td colspan="3">문의 게시판</td>
			<td colspan="2" align="center">
				<font size="2">글 개수 : ${listcount }</font>
			</td>
		</tr>
		
		<tr align="center" valign="middle" bordercolor="#333333">
			<td style="font-family: Tahoma; font-size: 10pt" width="8%" height="26">
				<div align="center">번호</div>
			</td>
			<td style="font-family: Tahoma; font-size: 10pt" width="50%">
				<div align="center">제목</div>
			</td>
			<td style="font-family: Tahoma; font-size: 10pt" width="14%">
				<div align="center">작성자</div>
			</td>
			<td style="font-family: Tahoma; font-size: 10pt" width="17%">
				<div align="center">날짜</div>
			</td>
			<td style="font-family: Tahoma; font-size: 10pt" width="11%">
				<div align="center">조회수</div>
			</td>
		</tr>
		
		<%
		for(int i = 0; i < boardList.size(); i++){ // 게시물 하나하나 반복
			BoardBean bl = (BoardBean)boardList.get(i);
		%>
		<tr align="center" valign="middle" bordercolor="#333333">
			<td height="23" style="font-family: Tahoma; font-size: 10pt">
				<%=bl.getB_NUM() %>
			</td>
			<td style="font-family: Tahoma; font-size:10pt">
				<div align="left">
					<%if(bl.getB_RE_REF() != 0) { %> <!-- 답변 게시글이라면 -->
						<%for(int a = 0; a <= bl.getB_RE_LEV() * 2; a++) { %>
						&nbsp; <!-- 2, 4, 6... -->
						<%} %>
						▶
					<%}else {%> <!-- 답변 게시글이 아니라면 -->
						▶
					<%} %>
					<a href="./BoardDetailAction.do?num=<%=bl.getB_NUM() %>&pw=<%=bl.getB_PW() %>">
						<%=bl.getB_SUB() %> <!-- 제목 누르면 num= 값 가지고 BoarDetailAction.java로 이동 -->
						<%if(bl.getB_PW().equals("none")) {%>
						<font size="1pt">공개</font>
						<%}else{ %>
						<font size="1pt">비공개</font>
						<%} %>
					</a>
				</div> 
			</td>
			<td style="font-family: Tahoma; font-size: 10pt">
				<div align="center"><%=bl.getB_ID() %></div>
			</td>
			
			<td style="font-family: Tahoma; font-size: 10pt">
				<div align="center"><%=bl.getB_DATE() %></div>
			</td>
			<td style="font-family: Tahoma; font-size: 10pt">
				<div align="center"><%=bl.getB_READCOUNT() %></div>
			</td>
		</tr>
		<%} %>
		
		<tr align="center" height="20">
			<td colspan="7" style="font-family: Tahoma; font-size: 10pt">
				<%if(nowpage <= 1) {%> <!-- 현재 페이지가 1이라면 하이퍼링크 달지 않음 -->
				[이전]&nbsp;
				<%}else { %> <!-- 현재 페이지가 1이 아니라면 하이퍼링크 달음. page= 값 가지고 BoardListAction.java(36줄)로 이동 -->
				<a href="./BoardList.do?page=<%=nowpage -1 %>">[이전]</a>&nbsp;
				<%} %>
				
				<%for(int a = startpage; a <= endpage; a++) { 
					if(a == nowpage){ %> <!-- 현재페이지에는 하이퍼링크 달지 않음 -->
					[<%=a %>]
					<%}else { %>
					<a href="./BoardList.do?page=<%=a %>">[<%=a %>]</a>
					&nbsp;
					<%} %>
				<%} %>
				
				<%if(nowpage >= endpage) {%> <!-- 현재페이지가 마지막 페이지라면 하이퍼링크 달지 않음 -->
					[다음]
				<%}else { %>
					<a href="./BoardList.do?page=<%=nowpage + 1 %>">[다음]</a>
				<%} %>
			</td>
		</tr>
		
		<tr align="right">
			<td colspan="5">
				<%if(id != null && id.equals("admin")) {%> <!-- id가 admin이라면 [회원관리] 출력-->
					<a href="./MemberListAction.me">[회원관리]</a>
					<!-- 관리자만 [회원관리]누를 수 이씀. 확장자 정해지면 바꾸기 -->
				<%} %>
				<%if(id != null) {%>
					<a href="./BoardWrite.do">[글쓰기]</a> <!-- [글쓰기]누르면 qna_board_write.jsp로 이동 -->
				<%} %>
			</td>
		</tr>
				
	</table>

</body>
</html>