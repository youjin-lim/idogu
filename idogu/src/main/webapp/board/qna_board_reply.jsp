<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="net.board.db.*" %>
<% 
// BoardReplyAction.java에서 넘어온 페이지
String id = (String)session.getAttribute("id"); 
BoardBean board = (BoardBean)request.getAttribute("boarddata"); // 해당 번호를 갖는 게시글 객체를 반환
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>답글 게시글</title>
<style type="text/css">
	table{
		width: 700px;
		position: absolute;
		top: 50%;
		left: 50%;
		transform: translate(-50%, -50%);
		font-family: Tahoma;
	}
	
	td.info{
		font-size: 12pt; 
	}
	
	a {
    	text-decoration: none;
    	color: black;
	}
	
	a:hover {font-weight: bold;}
</style>

<script>
	
	function active(){
		 document.boardform.B_PW.disabled = false;
		 document.boardform.B_PW.focus();
		 document.boardform.B_PW.value = "";
	}

	function disable(){
		 document.boardform.B_PW.disabled = true;
		 document.boardform.B_PW.value = "";
	}

function replyboard() {
		
		var PW = document.boardform.B_PW.disabled; 
		// true이면 공개(비활성화), false이면 비공개(활성화)
		
		if(document.boardform.B_SUB.value.trim() == ""){
			alert("제목을 작성해주세요.");
			document.boardform.B_SUB.focus();
			return;
		}
		
		if(document.boardform.B_CONTENT.value.trim() == ""){
			alert("내용을 작성해주세요.");
			document.boardform.B_CONTENT.focus();
			return;
		}
		
		if(PW){ // 공개일때
			document.boardform.B_PW.disabled = false;
			document.boardform.B_PW.value = "none";
			boardform.submit();
				
		}else { // 비공개일때 
			if(document.boardform.B_PW.value.trim() == ""){
				alert("비밀번호를 입력해주세요.");
				document.boardform.B_PW.focus();
				return; 
					
			}else{
				boardform.submit();
			}

		}
	}

</script>
</head>
<body>
<!-- 게시판 답변 -->
	<form action="./BoardReplyView.do" method="post" name="boardform">
		<input type="hidden" name="B_NUM" value="<%=board.getB_NUM() %>">
		<input type="hidden" name="B_RE_REF" value="<%=board.getB_RE_REF() %>">
		<input type="hidden" name="B_RE_LEV" value="<%=board.getB_RE_LEV() %>">
		<input type="hidden" name="B_RE_SEQ" value="<%=board.getB_RE_SEQ() %>">
		<input type="hidden" name="B_ID" value="<%=id %>">
		<input type="hidden" name="B_PW" value="<%=board.getB_PW() %>">
		
		<table>
			<tr align="center" valign="middle">
				<td colspan="2">답변 게시글</td>
			</tr>
			
			<tr>
				<td colspan="2">&nbsp;</td>
			</tr>
			
			<tr>
				<td class="info">
					<div align="center">글쓴이</div>
				</td>
				<td>
					<%=id %> <!-- 관리자라면 admin -->
				</td>
			</tr>
			
			<tr>
				<td class="info">
					<div align="center">제 목</div>
				</td>
				<td>
					<input name="B_SUB" type="text" size="50" maxlength="100" value="Re: <%=board.getB_SUB() %>">
				</td>
			</tr>
			
			<tr>
				<td class="info">
					<div align="center">내 용</div>
				</td>
				<td>
					<textarea name="B_CONTENT" cols="67" rows="15" style="resize: none"></textarea>
				</td>
			</tr>
			
			<tr bgcolor="#cccccc">
				<td colspan="2" style="height:1px"></td>
			</tr>
			
			<tr>
				<td colspan="2">&nbsp;</td>
			</tr>
			
			<tr align="center" valign="middle">
				<td colspan="5">
					<a href="javascript:replyboard()">[등록]</a>&nbsp;&nbsp;
					<!-- BoardReplyView.Action으로 이동 -->
					<a href="javascript:history.go(-1)">[뒤로]</a>
				</td>
			</tr>
		
		</table>
	
	</form>
</body>
</html>