<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
<script>
	function addBoard() {
		boardform.submit();
	}
</script>
</head>

<body>
	<!-- 게시판 등록 -->
	<form action="./BoardAddAction.no" method="post" enctype="multipart/form-data" name="boardform">
		<table>
			<tr align="center" valign="middle">
				<td colspan="2">공지사항 글쓰기</td>
			</tr>
			
			<tr>
				<td>
					<div align="center">작성자</div>
				</td>
				<td>
					<input name="M_ID" type="text" size="10" maxlength="10" value=""/>
				</td>
			</tr>
			
			<tr>
				<td>
					<div align="center">제목</div>
				</td>
				<td>
					<input name="N_SUB" type="text" size="50" maxlength="100" value=""/>
				</td>
			</tr>
			
			<tr>
				<td>
					<div align="center">내용</div>
				</td>
				<td>
					<textarea rows="10" cols="30" name="N_CONTENT" style="width: 650px; height: 350px;"></textarea>
				</td>
			</tr>
			
			<tr>
				<td>
					<div align="center">파일 첨부</div>
				</td>
				<td>
					<input name="N_FILE" type="file"/>
				</td>
			</tr>
			
			<tr>
				<td colspan="2">
				&nbsp;
				</td>
			</tr>
			
			<tr align="center" valign="middle">
				<td colspan="2">
					<a href="javascript:addBoard()">[등록]</a>&nbsp;&nbsp;
					<a href="javascript:history.go(-1)">[취소]</a>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>