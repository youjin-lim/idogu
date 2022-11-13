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

<!-- 에디터 -->
<script type="text/javascript" src="./ckeditor/ckeditor.js"></script>
</head>

<body>
	<!-- 게시판 등록 -->
	<form action="./BoardAddAction.no" method="post" enctype="multipart/form-data" name="boardform">
		<table>
			<tr align="center" valign="middle">
				<td colspan="2">공지사항 글쓰기</td>
			</tr>
			
			<tr>
				<td colspan="2">
					<input name="M_ID" type="text" size="10" maxlength="10" value=""/>
				</td>
			</tr>
			
			<tr>
				<td colspan="2">
					<input name="N_SUB" type="text" style="width:650px;" maxlength="50" value=""/>
				</td>
			</tr>
			
			<tr>
				<td colspan="2">
					<textarea class="form-control" id="p_content" rows="10" cols="30" name="N_CONTENT" style="width: 650px;"></textarea>
						<script type="text/javascript">
							CKEDITOR.replace('p_content'
										, {height: 500                                                  
							});
						</script>
				</td>
			</tr>
			
			<tr>
				<td colspan="2">
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