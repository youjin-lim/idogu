<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="net.notice.db.*"%>

<%
// 관리자
//	String id = "admin";
String id = null;

if (session.getAttribute("id") != null) {
	id = (String) session.getAttribute("id");
}

// 연동
NoticeBean board = (NoticeBean) request.getAttribute("boarddata");
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
<link rel="stylesheet" href="css/notice.css">
</head>

<body
	style="margin-bottom: 100px; background-image: url('./images/bgdog.png'); background-attachment: fixed; background-size: cover; height: 100vh">

	<%@ include file="../home/header.jsp"%>

	<div style="margin-top: 150px; margin: 0 auto;">

		<section class="view">
			<div
				style="width: 1100px; border-radius: 7px; background-color: white; padding-top: 20px; margin: 20px auto 10px auto;">
				<div class="page-title">
					<div style="width: 1000px; margin: 0 auto;">
						<h3>
							<a class="a1" href="./BoardList.no">공지사항</a>
						</h3>
					</div>
				</div>

				<div style="width: 1000px; margin: 0 auto;">
					<div class="nsubarea">
						<div class="subtitle">
							<%=board.getN_SUB()%>
						</div>
						<div class="subdate">
							<%=board.getN_DATE()%>
						</div>
					</div>
				</div>

				<div style="width: 1000px; margin: 0 auto;">
					<div class="ncontent">
						<div class="content">
							<%
							if (!(board.getN_FILE() == null)) {
							%>
							<div style="text-align: center;">
								<img src="./noticeupload/<%=board.getN_FILE()%>" style="max-width: 100%; height: auto;">
							</div>
							<br>
							<%
							}
							%>

							<%=board.getN_CONTENT()%>
						</div>
					</div>
				</div>

				<div style="width: 1000px; margin: 0 auto;">
					<div class="flist">
						<a class="a1" href="./BoardList.no">목록</a>&nbsp;

						<%
						if (id != null && id.equals("admin")) {
						%>

						<a class="a1" href="./BoardModify.no?num=<%=board.getN_NUM()%>">수정</a>&nbsp;
						<a class="a1"
							href="./BoardDeleteAction.no?num=<%=board.getN_NUM()%>">삭제</a>&nbsp;

						<%
						}
						%>
					</div>
				</div>
			</div>
		</section>
	</div>
</body>
</html>