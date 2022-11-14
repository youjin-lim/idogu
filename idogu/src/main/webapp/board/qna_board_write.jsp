<!-- 문의 게시판 글쓰기. 회원들만 쓸 수 있도록 해야함. 비회원은 X -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
String id = (String)session.getAttribute("id"); // 로그인할 때 저장된 값
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의게시판</title>
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
	
	function addboard() {
		
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
<!-- 게시글 등록 -->
	<form action="./BoardAddAction.do" method="post" name="boardform">
		<input type="hidden" name="B_ID" value="<%=id %>">
		
		<table>
			<tr align="center" valign="middle">
				<td colspan="5">문의 게시판</td><br>
			</tr>
			
			<tr>
				<td colspan="2">&nbsp;</td>
			</tr>
			
			
			<tr>
				<td class="info">
					<div align="center">글쓴이</div>
				</td>
				<td>
					<%=id %>
				</td>
			</tr>
			
			<tr>
				<td class="info">
					<div align="center">제 목</div>
				</td>
				<td>
					<input name="B_SUB" type="text" size="50" maxlength="100" value="">
				</td>
			</tr>
			
			<tr>
				<td class="info">
					<div align="center">내 용</div>
				</td>
				<td>
					<textarea name="B_CONTENT" cols="80" rows="15" style="resize: none"></textarea>
				</td>
			</tr>
			
			<tr>
				<td class="info">
					<input type="radio" name="SHOW" value="private" onClick="active();">비공개
					<input type="radio" name="SHOW" value="public" onClick="disable();" checked>공개
				</td>
				<td>
					<input type="text" name='B_PW' disabled value="">
					<font size="1">비공개의 경우, 답변 게시글에도 같은 비밀번호가 부여됩니다.</font>
				</td>
			</tr>
			
			<tr bgcolor="cccccc">
				<td colspan="2" style="height: 1px"></td>
			</tr>
			
			<tr>
				<td colspan="2">&nbsp;</td>
			</tr>
			
			
			<tr align="center" valign="middle">
				<td colspan="5">
					<a href="javascript:addboard()">[등록]</a>&nbsp;&nbsp; <!--BoardAddAction.java로 이동-->
					<a href="javascript:history.go(-1)">[뒤로]</a>
				</td>
			</tr>
		
		</table>
	
	</form>

</body>
</html>