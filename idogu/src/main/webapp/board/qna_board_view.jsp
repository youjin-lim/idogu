<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="net.board.db.*" %>
<% 
BoardBean board = (BoardBean)request.getAttribute("boarddata"); 
String id = (String)session.getAttribute("id"); // 로그인할 떄 저장된 session
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의 게시판</title>
<style type="text/css">
	table{
		width: 500px;
		position: absolute;
		top: 50%;
		left: 50%;
		transform: translate(-50%, -50%);
		font-family: Tahoma;
	}
	
	td{
		padding: 10pt 0pt;
	}
	
	a {
   		text-decoration: none;
		color: black;
	}
	
	a:hover {font-weight: bold;}
</style>
</head>
<body>
<!-- 게시판 수정 -->
	<table id="big">
		<tr align="center" valign="middle">
			<td colspan="5"><%=board.getB_NUM() %>번 게시글</td>
		</tr>
		
		<tr>
			<td colspan="2">
				<div align="right"><font size="2">작성자 : <%=board.getB_ID() %></font></div>
			</td>
		</tr>
		
		<tr>
			<td colspan="2" style="padding: 0pt 0pt">&nbsp;</td>
		</tr>
		
		<tr>
			<td width="70pt">
				<div align="center">제 목</div>
			</td>
			<td style="font-size: 10pt">
				<%=board.getB_SUB() %>
			</td>
		</tr>
		
		<tr bgcolor="lightgray">
			<td colspan="2" style="height: 1px; padding: 0"></td>
		</tr>
		
		<tr>
			<td width="70pt">
				<div align="center">내 용</div>
			</td>
			<td style="font-size: 10pt">
				<%=board.getB_CONTENT() %>
			</td>
		</tr>
		
		<tr bgcolor="lightgray">
			<td colspan="2" style="height: 1px; padding: 0"></td>
		</tr>
		
		<tr align="center" valign="middle">
			<td colspan="5">
				<font size="2">
					<%if(id.equals(board.getB_ID()) || id.equals("admin")) {%> <!-- 게시글을 쓴 회원이나 관리자만 답변 가능 -->
					<a href="./BoardReplyAction.do?num=<%=board.getB_NUM() %>">
					[답변]
					</a>&nbsp;&nbsp;
					<%} %>
					<%if(id.equals(board.getB_ID())) {%> <!-- 게시글을 쓴 회원만 수정 가능. 관리자도 회원 게시글 수정 못함 -->
					<a href="./BoardModifyView.do?num=<%=board.getB_NUM() %>">
					<!-- BoardModifyView.java로 이동 -->
					[수정]
					</a>&nbsp;&nbsp;
					<%} %>
					<%if(id.equals(board.getB_ID())) {%> <!-- 게시글을 쓴 회원만 삭제 가능  -->
					<a href="./BoardDeleteAction.do?num=<%=board.getB_NUM() %>&re_ref=<%=board.getB_RE_REF()%>">
					[삭제]
					</a>&nbsp;&nbsp;
					<%} %>
					<a href="./BoardList.do">
					[목록]
					</a>
				</font>
			</td>
		</tr>
				
	</table>

</body>
</html>