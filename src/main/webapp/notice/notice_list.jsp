<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="java.util.*"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="net.notice.db.*"%>

<%
// 관리자
//	String id = "admin";
String id = null;

if (session.getAttribute("id") != null) {
	id = (String) session.getAttribute("id");
}

// 페이지
List boardList = (List) request.getAttribute("boardlist");
int listcount = ((Integer) request.getAttribute("listcount")).intValue();
int nowpage = ((Integer) request.getAttribute("page")).intValue();
int maxpage = ((Integer) request.getAttribute("maxpage")).intValue();
int startpage = ((Integer) request.getAttribute("startpage")).intValue();
int endpage = ((Integer) request.getAttribute("endpage")).intValue();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" 
	rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" 
	crossorigin="anonymous">
<link rel="stylesheet" href="css/notice.css" type="text/css">
</head>

<body style="margin-bottom: 100px; background-image: url('./images/bgdog.png'); background-attachment: fixed; background-size: cover; height: 100vh">

	<%@ include file="../home/header.jsp"%>

	<div style="margin-top: 150px; margin: 0 auto;">
		<section class="view">
		<div style="width: 1100px; border-radius: 7px; background-color: white; padding-top: 20px; margin: 20px auto 10px auto;">

			<%
			if (listcount > 0) {
			%>

			<div class="page-title">
				<div style="width: 1000px; margin: auto;">
					<h3>
						<a class="a1" href="./BoardList.no">공지사항</a>
					</h3>
				</div>
			</div>

			<div id="board-list">
				<div style="width: 1000px; margin: 0 auto;">
					<table class="board-table">
						<thead>
							<tr style="background-color: #f9f7f9">
								<th scope="col" class="th-num">번호</th>
								<th scope="col" class="th-title">제목</th>
								<th scope="col" class="th-date">등록일</th>
								<th scope="col" class="th-num">조회수</th>
							</tr>
						</thead>

						<%
						for (int i = 0; i < boardList.size(); i++) {
							NoticeBean bl = (NoticeBean) boardList.get(i);
						%>

						<tbody>
							<tr>
								<td><%=bl.getN_NUM()%></td>
								<th><a class="a1"
									href="./BoardDetailAction.no?num=<%=bl.getN_NUM()%>"><%=bl.getN_SUB()%></a>
								</th>
								<td><%=bl.getN_DATE()%></td>
								<td><%=bl.getN_READCOUNT()%></td>
							</tr>
						</tbody>

						<%
						}
						%>

					</table>
				</div>
			</div>

			<%
			} else {
			%>

			<div class="page-title">
				<div style="width: 1000px; margin: 0 auto;">
					<h3>
						<a class="a1" href="./BoardList.no">공지사항</a>
					</h3>
				</div>
			</div>

			<div id="board-list">
				<div class="ncontainer">
					<table class="board-table">
						<tr>
							<td align="center"><font size="2">등록된 글이 없습니다.</font></td>
						</tr>
					</table>
				</div>
			</div>

			<%
			}
			%>

			<div style="width: 1000px; margin: 0 auto;">
				<div class="nlist">
					<div class="fwritem">
						<%
						if (id != null && id.equals("admin")) {
						%>
						<a class="a1" href="./BoardWrite.no">글쓰기</a>
						<%
						}
						%>
					</div>

					<div class="flistm">
						<%
						if (nowpage <= 1) {
						%>
						&nbsp;
						<%
						} else {
						%>
						<a class="a1" href="./BoardList.no?page=<%=nowpage - 1%>">&lt;</a>&nbsp;
						<%
						}
						%>

						<%
						for (int a = startpage; a <= endpage; a++) {
							if (a == nowpage) {
						%>
						<b><%=a%></b>
						<%
						} else {
						%>
						<a class="a1" href="./BoardList.no?page=<%=a%>"><%=a%></a>
						<%
						}
						%>
						<%
						}
						%>

						<%
						if (nowpage >= maxpage) {
						%>
						&nbsp;
						<%
						} else {
						%>
						<a href="./BoardList.no?page=<%=nowpage + 1%>">&gt;</a>&nbsp;
						<%
						}
						%>
					</div>
				</div>
			</div>
			</div>
		</section>
	</div>
</body>
</html>