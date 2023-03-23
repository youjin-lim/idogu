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
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" 
	rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" 
	crossorigin="anonymous">
<link rel="stylesheet" href="css/qna_board_list.css" >
	
<script type="text/javascript">

	function submitSrchForm() {
	   document.srchForm.srchKey.value = document.srchForm.srchKey.value.trim(); // 검색어에 공백있다면 제거하고
	   document.srchForm.submit(); // BoardListAction.java로
	}
	
	fuction wirteBoard(){
		
	}
	
</script>
</head>
<body style="margin-bottom:100px; background-image: url('./images/bgdog.png'); background-attachment: fixed; background-size: cover; height: 100vh">
<%@ include file="../home/header.jsp" %>

	<!-- 게시판 리스트 -->
	<div style="height: 850px; width: 1000px; background-color: white; border-radius: 7px; margin:auto; margin-top: 3%" >
		<section class="notice">
			<div class="page-title" style="margin-top: 0">
				<div class="container">
					<h3>문의 게시판</h3>
				</div>
			</div>
		</section>
		
		<div class="container" align="right">
			<div class="write">
            <%if(id != null && !id.equals("admin")) {%> <!-- 비회원, 관리자도 글 못씀. 관리자는 답변글 작성만 가능 -->
               <a class="atag" href="./BoardWrite.do">
               <font style="color: #333333; font-weight: bold; text-shadow: 3px 1px 0px #F2A063; ">문의 남기기&nbsp;</font>
               </a><!-- qna_board_write.jsp로 -->
            <%} %>
            </div>
		</div>
		
		<!-- board serach area -->
		<div id="board-search">
			<div class="container">
				<div class="search-window">
			        <form class="serach-wrap" name="srchForm" action="BoardList.do" method="post">
			            <div class="searchSelect" align="center">
			            <select id="srchFlds" name="srchFlds">
			            <!-- 검색어 입력하고 [검색]버튼 눌러 -> BoardListAction.java로 갔다가 -> 다시 이 페이지로 넘어왔을 때 -->
			               <option value="all" <%=srchFlds.equals("all") ? "selected='selected'" : ""%>>모두</option> <!-- srchForm[0] -->
			               <option value="sub" <%=srchFlds.equals("sub") ? "selected='selected'" : ""%>>제목</option>
			               <option value="au" <%=srchFlds.equals("au") ? "selected='selected'" : "" %>>글쓴이</option>
			               <option value="con" <%=srchFlds.equals("con") ? "selected='selected'" : "" %>>내용</option>
			            </select>
			           		<input id="srchKey" type="text" name="srchKey" value="<%=srchKey %>" >
			            	<button type="submit" class="btn btn-secondary" onClick="submitSrchForm()">검색</button>
			            	
			            </div>
			         </form>
			     </div>
			 </div>
		</div>
		
		<div id="board-list">
			<div class="container">
				<table class="board-table">
					<thead>
						<tr>
							<th scope="col" class="th-num">번호</th>
							<th scope="col" class="th-title">제목</th>
							<th scope="col" class="th-id">아이디</th>
							<th scope="col" class="th-date">날짜</th>
							<th scope="col" class="th-readcount">조회수</th>
						</tr>
					</thead>
				<tbody>
					<tr>
					<%
					for(int i = 0; i < boardList.size(); i++){ // 게시물 반복
						BoardBean bl = (BoardBean)boardList.get(i);
					%>
						<td><%=boardList.size()-i %></td>
						<td>
							<div align="left">
							<%if(bl.getB_RE_LEV() != 0) { %> <!-- 답변 게시글이라면 -->
								<%for(int a = 0; a <= bl.getB_RE_LEV() * 2; a++) { %>
								&nbsp; <!-- 앞에 공백 -->
								<%}%>
							<img src="./images/reply.png" style="width: 12px; height: 10px">
							<%}%>
							<a class="atag" style="text-decoration: none" href="./BoardDetailAction_1.do?num=<%=bl.getB_NUM() %>">
							<%=bl.getB_SUB() %> <!-- 제목 누르면 num= 값 가지고 BoarDetailAction.java로 -->
							</a>
							<%if(bl.getB_PW().equals("none")) {%>
							<%}else{ %>
							<img src="./images/lock.png" style="width: 10px; height: 12px">
							<%} %>
							</div>
						</td>
						<td>
							<div>
							<%if(bl.getB_ID().equals("admin")) {%>
							관리자
							<%}else{ %>
							<%=bl.getB_ID() %>
							<%} %>
							</div>
						</td>
			
						<td>
							<div><%=bl.getB_DATE() %></div>
						</td>
						<td>
							<div><%=bl.getB_READCOUNT() %></div>
						</td>
					</tr>
				<%} %>
				</table>
			</div>
		</div>
		
		<div class="container">
			<div style="text-align: right">글 개수: ${listcount }개</div>
			<div style="text-align: center">
				<%if(nowpage <= 1) {%> <!-- 현재 페이지가 [1]이라면 하이퍼링크 달지 않음 -->
				이전&nbsp;
				<%}else { %> 
				<a class="atag" href="./BoardList.do?page=<%=nowpage -1 %>">이전</a>&nbsp;
				<%} %>
				
				<%for(int a = startpage; a <= endpage; a++) { 
					if(a == nowpage){ %> <!-- 현재페이지에는 하이퍼링크 달지 않음 -->
					<%=a %>&nbsp;
					<%}else { %>
					<a class="atag" href="./BoardList.do?page=<%=a %>"><%=a %></a>
					&nbsp;
					<%} %>
				<%} %>
				
				<%if(nowpage >= endpage) {%> <!-- 현재페이지가 마지막 페이지라면 하이퍼링크 달지 않음 -->
				다음
				<%}else { %>
				<a class="atag" href="./BoardList.do?page=<%=nowpage + 1 %>">다음</a>
				<%} %>
			</div>
		</div>
	</div>

</body>
</html>