<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="net.notice.db.*" %>

<%
	// 관리자
	String id = "admin";
//	String id = null;

	if (session.getAttribute("id") != null) {
		id = (String)session.getAttribute("id");
	}

	// 연동
	NoticeBean board = (NoticeBean)request.getAttribute("boarddata");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
</head>

<body>
	<!-- 게시판 수정 -->
	<table>
		<tr align="center" valign="middle">
			<td colspan="5">공지사항 내용 보기</td>
		</tr>
		
		<tr>
			<td>
				<%= board.getN_SUB() %>
			</td>
		</tr>
		
		<tr bgcolor="#cccccc">
			<td colspan="2" style="height: 1px;"></td>
		</tr>
		
		<tr>
			<td>
				<table style="table-layout: fixed">
					<tr>
						<td valign="top" style="width: 650px; height: 350px;">
							<% if (!(board.getN_FILE() == null)) { %>
							<div style="text-align : center;">
								<img src="./noticeupload/<%= board.getN_FILE() %>">
							</div>
							<% } %>
							
							<%= board.getN_CONTENT() %>
						</td>
					</tr>
				</table>
			</td>
		</tr>
		
		<tr bgcolor="#cccccc">
			<td colspan="2" style="height: 1px;"></td>
		</tr>
		
		<tr align="center" valign="middle">
			<td colspan="5">
				<font size=2>
					<a href="./BoardList.no">[목록]</a>&nbsp;&nbsp;
					
					<% if (id != null && id.equals("admin")) { %>
					
					<a href="./BoardModify.no?num=<%= board.getN_NUM() %>">[수정]</a>&nbsp;&nbsp;
					<a href="./BoardDeleteAction.no?num=<%= board.getN_NUM() %>">[삭제]</a>&nbsp;&nbsp;
					
					<% } %>
				</font>
			</td>
		</tr>
	</table>
</body>
</html>