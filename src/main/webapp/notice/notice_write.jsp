<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="net.notice.db.*"%>

<%
String id = null;

if (session.getAttribute("id") != null) {
	id = (String) session.getAttribute("id");
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi"
	crossorigin="anonymous">
<link rel="stylesheet" href="css/notice.css?after">
<script>
	function addBoard() {
		var contents = CKEDITOR.instances.p_content.getData();

		if (document.boardform.N_SUB.value == "") {
			alert("제목을 입력하세요.");
			return false;

		} else if (contents == "") {
			alert("내용을 입력하세요.");
			return false;

		} else {
			boardform.submit();
		}
		return true;
	}
</script>
<!-- 에디터 -->
<script type="text/javascript" src="./ckeditor/ckeditor.js"></script>
<script src="../js/jquery.js" type="text/javascript"></script>

<style>
a {
	text-decoration: none;
	color: black;
}

a:hover {
	font-weight: bold;
}
</style>
</head>

<body
	style="margin-bottom: 100px; background-image: url('./images/bgdog.png'); background-attachment: fixed; background-size: cover; height: 100vh">
	<%@ include file="../home/header.jsp"%>

	<!-- 게시판 등록 -->
	<div style="margin-top: 150px; margin: 0 auto;">
		<section class="view">
			<div
				style="width: 1100px; border-radius: 7px; background-color: white; padding-top: 20px; margin: 20px auto 10px auto;">
				<form action="./BoardAddAction.no" method="post"
					enctype="multipart/form-data" name="boardform">
					<input type="hidden" name="M_ID" value="<%=id%>">
					<table style="margin: 0 auto; padding-top: 50px" align="center"
						width="900px" cellpadding="2">
						<tr>
							<td height="40" align="center" bgcolor="#ccc"><font
								color="white" size="5">공지사항</font></td>
						</tr>

						<tr>
							<td>
								<table class="table2">
									<tr>
										<td align="center">제 목</td>
										<td><input id="N_SUB" name="N_SUB" type="text"
											style="width: 900px;" maxlength="50" value="" /></td>
									</tr>

									<tr>
										<td align="center">내 용</td>
										<td><textarea class="form-control" id="p_content"
												rows="10" cols="30" name="N_CONTENT" style="width: 900px;"></textarea>
											<script type="text/javascript">
												CKEDITOR.replace('p_content', {
													height : 500
												});
											</script></td>
									</tr>

									<tr>
										<td align="center">파일첨부</td>
										<td><input name="N_FILE" type="file" /></td>
									</tr>
								</table>
							</td>
						</tr>

						<tr align="center" valign="middle" class="fwrite">
							<td colspan="2"><a class="a1" href="javascript:addBoard()">등록</a>&nbsp;&nbsp;
								<a class="a1" href="javascript:history.go(-1)">취소</a></td>
						</tr>
					</table>
				</form>
			</div>
		</section>
	</div>
</body>
</html>