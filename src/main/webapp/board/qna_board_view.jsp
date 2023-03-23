<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="net.board.db.*" %>
<% 
BoardBean board = (BoardBean)request.getAttribute("boarddata"); 
String id = (String)session.getAttribute("id"); // 로그인할 떄 저장된 session
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의 게시글</title>
<link rel="stylesheet" href="css/qna_board_view.css">
<script type="text/javascript">
	function delete_confirm() {
		var c_delete = confirm("삭제하시겠습니까?");
		
	 	if(!c_delete){ // 취소누르면 링크 이동x
			return false;
		}else{
			return true;
		}
	}
</script>

</head>

<body style="margin-bottom:100px; background-image: url('./images/bgdog.png'); background-attachment: fixed; background-size: cover; height: 100vh" >
<%@ include file="../home/header.jsp" %>
<div style="height: 900px;width: 1000px; background-color: white;border-radius: 7px;margin: auto; margin-top: 50px">
   <section class="view">
      <div class="page-title">
         <div class="container">
            <% if(board.getB_ID().equals("admin")){ %>
            <h3>관리자 답변</h3>
            <%} else{%>
            <h3>문의글</h3>
            <%} %>
         </div>
      </div>
      
      <div class="container">
         <div class="nsubarea">
              <div class="subtitle">
               <%= board.getB_SUB() %>
            </div>
	        <div>
	           <div>
	           <%if(board.getB_ID().equals("admin")){%>
	           <%}else{%>
	           <%=board.getB_ID() %>
	           <%} %>
	           </div>
	            <div class="subdate">
	            <%if(board.getB_DATE() == null) {
	            }else{
	            %>
                <%=board.getB_DATE()%>
                <%} %>
               </div>
	        </div>
         </div>
      </div>

      <div class="container">
         <div class="ncontent">
            <div class="cont">
               <%= board.getB_CONTENT() %>
            </div>
         </div>
      </div>
            
      <div class="container">
         <div class="flist">
            <%if(id.equals("admin") || id.equals(board.getB_ID())) {%> <!-- 관리자와 자기글에만 답변 가능 -->
				<a class="no" href="./BoardReplyAction.do?num=<%=board.getB_NUM() %>">
				[답변]
				</a>&nbsp;&nbsp;
				<%} %>
				<%if(id.equals(board.getB_ID())) {%> <!-- 게시글을 쓴 회원만 수정 가능. 관리자도 회원 게시글 수정 못함 -->
				<a class="no" href="./BoardModifyView.do?num=<%=board.getB_NUM() %>">
				<!-- BoardModifyView.java로 이동 -->
				[수정]
				</a>&nbsp;&nbsp;
				<%} %>
				<%if(id.equals(board.getB_ID())) {%> <!-- 게시글을 쓴 회원만 삭제 가능  -->
				<a class="no" href="./BoardDeleteAction.do?num=<%=board.getB_NUM() %>&re_ref=<%=board.getB_RE_REF()%>" onclick="return delete_confirm()">
				<!-- href="" onclick="return 함수명()"
				이렇게 사용하는 경우, href에 설정한 경로로 이동하는 것보다 onclick이벤트가 먼저 실행된다. onclick 이벤트의 리턴값이 true이면 href로 연결된 링크로 이동하고, false이면 이동하지 않는다.
				-->
				[삭제]
				</a>&nbsp;&nbsp;					
				<%} %>
				<a class="no" href="./BoardList.do">
				[목록]
				</a>
         </div>
      </div>
</section>
</div>
</body>
</html>