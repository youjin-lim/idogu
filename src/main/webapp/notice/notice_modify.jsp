<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="net.notice.db.*"%>

<%
NoticeBean board = (NoticeBean) request.getAttribute("boarddata");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
<link rel="stylesheet" href="css/notice.css">
<script type="text/javascript">
	function modifyboard() {
		var contents = CKEDITOR.instances.p_content.getData();

		if (document.modifyform.N_SUB.value == "") {
			alert("제목을 입력하세요.");
			return false;

		} else if (contents == "") {
			alert("내용을 입력하세요.");
			return false;

		} else {
			modifyform.submit();
		}
		return true;
	}
</script>

<!-- 에디터 -->
<script type="text/javascript" src="./ckeditor/ckeditor.js"></script>
</head>

<body
	style="margin-bottom: 100px; background-image: url('./images/bgdog.png'); background-attachment: fixed; background-size: cover; height: 100vh">
	<%@ include file="../home/header.jsp"%>

	<!-- 게시판 수정 -->
	<div style="margin-top: 150px; margin: 0 auto;">
		<section class="view">
			<div
				style="width: 1100px; border-radius: 7px; background-color: white; padding-top: 20px; margin: 20px auto 10px auto;">
				<form action="./BoardModifyAction.no" method="post"
					name="modifyform">
					<input type="hidden" name="N_NUM" value="<%=board.getN_NUM()%>" />

					<table style="margin: 0 auto; padding-top: 50px" align="center"
						width="900px" cellpadding="2">
						<tr>
							<td height="40" align="center" bgcolor="#ccc"><font
								color="white" size="5">공지사항</font></td>
						</tr>

						<tr>
							<td bgcolor=white>
								<table class="table2">
									<tr>
										<td align="center">제목</td>

										<td><input name="N_SUB" type="text" style="width: 900px;"
											maxlength="50" value="<%=board.getN_SUB()%>" /></td>
									</tr>

									<tr>
										<td align="center">내용</td>
										<td><textarea id="p_content" name="N_CONTENT" cols="67"
												rows="15" style="width: 900px;"><%=board.getN_CONTENT()%></textarea>
											<script type="text/javascript">
												CKEDITOR.replace('p_content', {
													height : 500
												});
											</script></td>
									</tr>

									<%
									if (!(board.getN_FILE() == null)) {
									%>

									<tr>
										<td>
											<div align="center">파일 첨부</div>
										</td>
										<td>&nbsp;&nbsp;<%=board.getN_FILE()%>
										</td>
									</tr>
									<%
									}
									%>

								</table>
							</td>
						</tr>

						<tr align="center" valign="middle" class="fwrite">
							<td colspan="2"><a class="a1"
								href="javascript:modifyboard()">[수정]</a>&nbsp;&nbsp; <a
								class="a1" href="javascript:history.go(-1)">[뒤로]</a></td>
						</tr>
					</table>
				</form>
			</div>
		</section>
	</div>
</body>
</html>