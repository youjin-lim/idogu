<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, java.text.SimpleDateFormat, net.board.db.*" %>

<% 
	String id = null;
	if(session.getAttribute("id") != null){ // 로그인했다면
		id = (String)session.getAttribute("id"); // 아이디 저장
	}
	
	// boardList에 최대 10개의 게시물들이 담김
	List boardList = (List)request.getAttribute("boardlist"); // BoardListAction.java에서 넘어온 파라미터 값들
	int listcount = ((Integer)request.getAttribute("listcount")).intValue();
	int nowpage = ((Integer)request.getAttribute("page")).intValue();
	int maxpage = ((Integer)request.getAttribute("maxpage")).intValue();
	int startpage = ((Integer)request.getAttribute("startpage")).intValue();
	int endpage = ((Integer)request.getAttribute("endpage")).intValue();
	
	// 검색 기능용
	String srchKey = (String)request.getAttribute("srchKey"); // qna_board_list.jsp에서 검색어 입력했을 때
	// 검색어 입력하고 [검색]버튼 누름 -> BoardListAction.java -> qna_board_list.jsp로 다시 넘어왔을 때  
	if(srchKey == null) { // [검색]버튼 누르지 않았을 때는 변수 srchKey에 null이 저장됨
		srchKey = "";
	}
	   
	String srchFlds = (String)request.getAttribute("srchFlds");
 	if(srchFlds == null) {
 		srchFlds = "";
	}
%> 

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의 게시판</title>	
<style type="text/css">
	
	table {
		width: 800px;
		position: absolute;
		top: 50%;
		left: 50%;
		transform: translate(-50%, -50%);
		font-family: Tahoma;
	}
	
	a {
		color: black;
    	text-decoration: none;
	}
	
	a:hover {font-weight: bold;}

</style>

<script type="text/javascript">

	function submitSrchForm() {
	   document.srchForm.srchKey.value = document.srchForm.srchKey.value.trim(); // 검색어에 공백있다면 제거하고
	   document.srchForm.submit(); // BoardListAction.java로
	}
	
</script>
</head>
<body>
<!-- 게시판 리스트 -->
	<table>
		<tr align="center" valign="middle">
			<td colspan="5">문의 게시판</td>
		</tr>
		
		<tr>
			<td colspan="5" align="right">
				<font size="2">글 개수 : ${listcount }개</font>
			</td>
		</tr>
		
		<!-- 검색 기능 -->
	    <tr>
	        <td colspan="5" align="center">
	        <br>
	        <form name="srchForm" action="BoardList.do" method="post">
	            <select name="srchFlds">
	            <!-- 검색어 입력하고 [검색]버튼 눌러 -> BoardListAction.java로 갔다가 -> 다시 이 페이지로 넘어왔을 때 -->
	               <option value="all" <%=srchFlds.equals("all") ? "selected='selected'" : ""%>>모두</option> <!-- srchForm[0] -->
	               <option value="sub" <%=srchFlds.equals("sub") ? "selected='selected'" : ""%>>제목</option>
	               <option value="au" <%=srchFlds.equals("au") ? "selected='selected'" : "" %>>글쓴이</option>
	               <option value="con" <%=srchFlds.equals("con") ? "selected='selected'" : "" %>>내용</option>
	            </select>
	            <input type="text" name="srchKey" size="20" maxlength="50" value="<%=srchKey %>" >&nbsp;
	            <input type="button" value="검색" onClick="submitSrchForm()">
	         </form>
	         <br>
	         </td>
	    </tr>
		
		<tr align="center" valign="middle" bgcolor="lightgray">
			<td style="font-size: 10pt" width="8%" height="26">
				<div align="center">번호</div>
			</td>
			<td style="font-size: 10pt" width="50%">
				<div align="center">제목</div>
			</td>
			<td style="font-size: 10pt" width="20%">
				<div align="center">작성자</div>
			</td>
			<td style="font-size: 10pt" width="14%">
				<div align="center">날짜</div>
			</td>
			<td style="font-size: 10pt" width="8%">
				<div align="center">조회수</div>
			</td>
		</tr>
		
		<%
		for(int i = 0; i < boardList.size(); i++){ // 게시물 반복
			BoardBean bl = (BoardBean)boardList.get(i);
		%>
		<tr align="center" valign="middle">
			<td height="23" style="font-size: 10pt">
				<%=bl.getB_NUM() %>
			</td>
			<td style="font-size:10pt">
				<div align="left">
					<%if(bl.getB_RE_LEV() != 0) { %> <!-- 답변 게시글이라면 -->
						<%for(int a = 0; a <= bl.getB_RE_LEV() * 2; a++) { %>
						&nbsp; <!-- 앞에 공백 -->
						<%} %>
						▶
					<%}else { // 답변 게시글이 아니라면 
					  } %>
					<a href="./BoardDetailAction_1.do?num=<%=bl.getB_NUM() %>">
						<%=bl.getB_SUB() %> <!-- 제목 누르면 num= 값 가지고 BoarDetailAction.java로 -->
					</a>
					<%if(bl.getB_PW().equals("none")) {%>
					<font size="1">&nbsp;공개</font>
					<%}else{ %>
					<font size="1">&nbsp;비공개</font>
					<%} %>
				</div> 
			</td>
			<td style="font-size: 10pt">
				<div align="center"><%=bl.getB_ID() %></div>
			</td>
			
			<td style="font-size: 10pt">
				<div align="center"><%=bl.getB_DATE() %></div>
			</td>
			<td style="font-size: 10pt">
				<div align="center"><%=bl.getB_READCOUNT() %></div>
			</td>
		</tr>
		<%} %>
		
		<tr align="center" height="20">
			<td colspan="7" style="font-size: 10pt">
				<%if(nowpage <= 1) {%> <!-- 현재 페이지가 [1]이라면 하이퍼링크 달지 않음 -->
				[이전]&nbsp;
				<%}else { %> 
				<a href="./BoardList.do?page=<%=nowpage -1 %>">[이전]</a>&nbsp;
				<%} %>
				
				<%for(int a = startpage; a <= endpage; a++) { 
					if(a == nowpage){ %> <!-- 현재페이지에는 하이퍼링크 달지 않음 -->
					[<%=a %>]&nbsp;
					<%}else { %>
					<a href="./BoardList.do?page=<%=a %>">[<%=a %>]</a>
					&nbsp;
					<%} %>
				<%} %>
				
				<%if(nowpage >= endpage) {%> <!-- 현재페이지가 마지막 페이지라면 하이퍼링크 달지 않음 -->
				[다음]
				<%}else { %>
				<a href="./BoardList.do?page=<%=nowpage + 1 %>">[다음]</a>
				<%} %>
			</td>
		</tr>
		
		<tr align="right">
			<td colspan="5">
				<%if(id != null) {%> <!-- 비회원은 글 못씀 -->
					<a href="./BoardWrite.do">[글쓰기]</a> <!-- qna_board_write.jsp로 -->
				<%} %>
			</td>
		</tr>
				
	</table>

</body>
</html>