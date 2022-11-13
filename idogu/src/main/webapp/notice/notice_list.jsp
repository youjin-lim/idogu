<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.util.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="net.notice.db.*" %>

<%
	// 관리자
	String id = "admin";
	// String id = null;

	if (session.getAttribute("id") != null) {
		id = (String)session.getAttribute("id");
	}
	
	// 페이지
	List boardList = (List)request.getAttribute("boardlist");
	int listcount = ((Integer)request.getAttribute("listcount")).intValue();
	int nowpage = ((Integer)request.getAttribute("page")).intValue();
	int maxpage = ((Integer)request.getAttribute("maxpage")).intValue();
	int startpage = ((Integer)request.getAttribute("startpage")).intValue();
	int endpage = ((Integer)request.getAttribute("endpage")).intValue();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>

<style>
table {
  border-collapse: collapse;
  border-spacing: 0;
}

section.notice {
  padding: 80px 0;
}

.page-title {
  margin-bottom: 60px;
}

.page-title h3 {
  font-size: 28px;
  color: #333333;
  font-weight: 400;
  text-align: left;
}

.board-table {
  font-size: 13px;
  width: 100%;
  border-top: 1px solid #ccc;
  border-bottom: 1px solid #ccc;
}

.board-table a {
  color: #333;
  display: inline-block;
  line-height: 1.4;
  word-break: break-all;
  vertical-align: middle;
}

.board-table a:hover {
  text-decoration: underline;
}

.board-table th {
  text-align: center;
}

.board-table .th-num {
  width: 100px;
  text-align: center;
}

.board-table .th-date {
  width: 200px;
}

.board-table th, .board-table td {
  padding: 14px 0;
}

.board-table tbody td {
  border-top: 1px solid #e7e7e7;
  text-align: center;
}

.board-table tbody th {
  padding-left: 28px;
  padding-right: 14px;
  border-top: 1px solid #e7e7e7;
  text-align: left;
}

.board-table tbody th p{
  display: none;
}

.btn {
  display: inline-block;
  padding: 0 30px;
  font-size: 15px;
  font-weight: 400;
  background: transparent;
  text-align: center;
  white-space: nowrap;
  vertical-align: middle;
  -ms-touch-action: manipulation;
  touch-action: manipulation;
  cursor: pointer;
  -webkit-user-select: none;
  -moz-user-select: none;
  -ms-user-select: none;
  user-select: none;
  border: 1px solid transparent;
  text-transform: uppercase;
  -webkit-border-radius: 0;
  -moz-border-radius: 0;
  border-radius: 0;
  -webkit-transition: all 0.3s;
  -moz-transition: all 0.3s;
  -ms-transition: all 0.3s;
  -o-transition: all 0.3s;
  transition: all 0.3s;
}

.btn-dark {
  background: #555;
  color: #fff;
}

.btn-dark:hover, .btn-dark:focus {
  background: #373737;
  border-color: #373737;
  color: #fff;
}

.btn-dark {
  background: #555;
  color: #fff;
}

.btn-dark:hover, .btn-dark:focus {
  background: #373737;
  border-color: #373737;
  color: #fff;
}

/* reset */

* {
  list-style: none;
  text-decoration: none;
  padding: 0;
  margin: 0;
  box-sizing: border-box;
}

.clearfix:after {
  content: '';
  display: block;
  clear: both;
}

.container {
  width: 90%;
  margin: 0 auto;
}

.blind {
  position: absolute;
  overflow: hidden;
  clip: rect(0 0 0 0);
  margin: -1px;
  width: 1px;
  height: 1px;
}
</style>

</head>

<body>
<section class="notice">

	<%
		if (listcount > 0) {
	%>

	<div class="page-title">
		<div class="container">
			<h3>공지사항</h3>
		</div>
	</div>
		
	<div id="board-list">
        <div class="container">
            <table class="board-table">
                <thead>
                <tr style="background-color: #f6f6f6">
                    <th scope="col" class="th-num">번호</th>
                    <th scope="col" class="th-title">제목</th>
                    <th scope="col" class="th-date">등록일</th>
                    <th scope="col" class="th-num">조회수</th>
                </tr>
                </thead>
                
	<%
		for (int i = 0; i < boardList.size(); i++) {
			NoticeBean bl = (NoticeBean)boardList.get(i);
	%>
                
                <tbody>
                <tr>
                    <td><%= bl.getN_NUM() %></td>
                    <th>
                      <a href="./BoardDetailAction.no?num=<%= bl.getN_NUM() %>"><%= bl.getN_SUB() %></a>
                    </th>
                    <td><%= bl.getN_DATE() %></td>
                    <td><%= bl.getN_READCOUNT() %></td>
                </tr>
                </tbody>
                
	<%
		}
	%>
	
				<tr align="center" height="20">
					<td colspan="6" style="font-family:Tohoma; font-size: 10pt;">
						<% if (nowpage <= 1) { %>
							&nbsp;
						<% } else { %>
							<a href="./BoardList.no?page=<%= nowpage - 1 %>">[이전]</a>&nbsp;
						<% } %>	
			
						<% for (int a = startpage; a <= endpage; a++) {
							if (a == nowpage) {	%>
								<b><%= a %></b>
							<% } else { %>
								<a href="./BoardList.no?page=<%= a %>">[<%= a %>]</a>&nbsp;
							<% } %>
						<% } %>
			
						<% if (nowpage >= maxpage) { %>
							&nbsp;
						<% } else { %>
							<a href="./BoardList.no?page=<%= nowpage + 1 %>">[다음]</a>&nbsp;
						<% } %>
					</td>
				</tr>
				
	<% } else { %>
				
				<tr align="center" valign="middle">
					<td colspan="4">공지사항</td>
					<td align="right">
						<font size="2">등록된 글이 없습니다.</font>
					</td>
				</tr>
				
	<% } %>
				
            </table>
        </div>
    </div>
    
    <section>
    	<div>

			<% if (id != null && id.equals("admin")) { %>
			
				<a href="./BoardWrite.no">[글쓰기]</a>
			
			<% } %>
		</div>
	</section>
</section>
</body>
</html>