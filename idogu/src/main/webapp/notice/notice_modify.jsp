<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="net.notice.db.*" %>

<%
	NoticeBean board = (NoticeBean)request.getAttribute("boarddata");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
<script type="text/javascript">
	function modifyboard() {
		modifyform.submit();
	}
</script>
</head>

<body>
	<!-- 게시판 수정 -->
	<form action="./BoardModifyAction.no" method="post" name="modifyform">
		<input type="hidden" name="N_NUM" value="<%= board.getN_NUM() %>" />

		<table>
			<tr align="center" valign="middle">
				<td colspan="2">공지사항 게시판 글 수정</td>
			</tr>
			
			<tr>
				<td>
					<div align="center">제목</div>
				</td>
				<td>
					<input name="N_SUB" type="text" size="50" maxlength="100"
		 				value="<%= board.getN_SUB() %>" />
				</td>
			</tr>
			
			<tr>
				<td>
					<div align="center">내용</div>
				</td>
				<td>
					<textarea name="N_CONTENT" cols="67" rows="15"><%= board.getN_CONTENT() %></textarea>
				</td>
			</tr>
			
			<% if (!(board.getN_FILE() == null)) { %>

			<tr>
				<td>
					<div align="center">파일 첨부</div>
				</td>
				<td>
					&nbsp;&nbsp;<%= board.getN_FILE() %>
				</td>
			</tr>
			
			<% } %>

			<tr bgcolor="#cccccc">
				<td colspan="2" style="height:1px"></td>
			</tr>
			
			<tr>
				<td colspan="2">&nbsp;</td>
			</tr>
			
			<tr align="center" valign="middle">
				<td colspan="2">
					<a href="javascript:modifyboard()">[수정]</a>&nbsp;&nbsp;
					<a href="javascript:history.go(-1)">[뒤로]</a>
				</td>
			</tr>
		</table>
	
	</form>
</body>
</html>