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
</head>
<body>
<!-- 게시판 수정 -->
	<table>
		<tr align="center" valign="middle">
			<td colspan="5">문의 게시판</td>
		</tr>
		
		<tr>
			<td style="font-family: 돋움; font-size: 12" height="16">
				<div align="center">제 목&nbsp;&nbsp;</div>
			</td>
			<td style="font-family: 돋움; font-size: 12">
				<%=board.getB_SUB() %>
			</td>
		</tr>
		
		<tr bgcolor="#cccccc">
			<td colspan="2" style="height: 1px"></td>
		</tr>
		
		<tr>
			<td style="font-family: 돋움; font-size: 12">
				<div align="center">내 용</div>
			</td>
			<td style="font-family: 돋움; font-size: 12">
				<table>
					<tr>
						<td valign="top" style="font-family: 돋움; font-size: 10">
							<%=board.getB_CONTENT() %>
						</td>
					</tr>
				</table>
			</td>
		</tr>
		
		<tr bgcolor="#cccccc">
			<td colspan="2" style="height: 1px"></td>
		</tr>
		
		<tr>
			<td colspan="2">&nbsp;</td>
		</tr>
		
		<tr align="center" valign="middle">
			<td colspan="5">
				<font size="2">
					<%if(id.equals(board.getB_ID()) || id.equals("admin")) {%>
					<a href="./BoardReplyAction.do?num=<%=board.getB_NUM() %>">
					[답변]
					</a>&nbsp;&nbsp;
					<%} %>
					<%if(!id.equals("admin") && id.equals(board.getB_ID())) {%>
						<a href="./BoardModify.do?num=<%=board.getB_NUM() %>">
						<!-- BoardModifyView.java로 이동. num= 값 가지고 -->
						[수정]
						</a>&nbsp;&nbsp;
					<%} %>
					<%if(id.equals(board.getB_ID())) {%>
						<a href="./BoardDeleteAction.do?num=<%=board.getB_NUM() %>">
						[삭제]
						</a>&nbsp;&nbsp;
					<%} %>
					<a href="./BoardList.do"> <!-- qna_board_list.jsp로 이동 -->
					[목록]
					</a>
				</font>
			</td>
		</tr>
				
	</table>

</body>
</html>