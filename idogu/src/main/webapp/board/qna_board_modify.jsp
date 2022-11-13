<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="net.board.db.*" %>
<%
// BoardModifyView.java에서 넘어온 페이지
String id = (String)session.getAttribute("id"); // 로그인할 때 만들어졌던 값
BoardBean board = (BoardBean)request.getAttribute("boarddata");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의 게시글 수정</title>
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
		 document.modifyform.B_PW.disabled = false;
		 document.modifyform.B_PW.focus();
		 document.modifyform.B_PW.value = "";
	}

	function disable(){
		 document.modifyform.B_PW.disabled = true;
		 document.modifyform.B_PW.value = "";
	}

	function modifyboard() {
		
		var PW = document.modifyform.B_PW.disabled; 
		// true이면 공개(비활성화), false이면 비공개(활성화)
		
		if(document.modifyform.B_SUB.value.trim() == ""){
			alert("제목을 작성해주세요.");
			document.modifyform.B_SUB.focus();
			return;
		}
		
		if(document.modifyform.B_CONTENT.value.trim() == ""){
			alert("내용을 작성해주세요.");
			document.modifyform.B_CONTENT.focus();
			return;
		}
		
		if(PW){ // 공개일때
			document.modifyform.B_PW.disabled = false;
			document.modifyform.B_PW.value = "none";
			boardform.submit();
				
		}else { // 비공개일때 
			if(document.modifyform.B_PW.value.trim() == ""){
				alert("비밀번호를 입력해주세요.");
				document.modifyform.B_PW.focus();
				return; 
					
			}else{
				modifyform.submit();
			}

		}
	}

</script>
</head>
<body>
<!-- 게시판 수정 -->
	<form action="BoardModifyAction.do" method="post" name="modifyform">
		<input type="hidden" name="B_NUM" value="<%=board.getB_NUM()%>">
		<input type="hidden" name="B_ID" value="<%=id %>">
		<input type="hidden" name="B_PW" value="<%=board.getB_PW() %>">

		<table>
			<tr align="center" valign="middle">
				<td colspan="5">문의 게시글 수정</td>
			</tr>
			
			<tr>
				<td colspan="2">&nbsp;</td>
			</tr>
			
			<tr>
				<td class="info">
					<div align="center">제 목</div>
				</td>
				<td>
					<input name="B_SUB" size="50" maxlength="100" value="<%=board.getB_SUB()%>">
				</td>
			</tr>
			
			<tr>
				<td class="info">
					<div align="center">내 용</div>
				</td>
				<td>
					<textarea name="B_CONTENT" cols="67" rows="15" style="resize: none"><%=board.getB_CONTENT() %></textarea>
				</td>
			</tr>
			
			<tr bgcolor="#cccccc">
				<td colspan="2" style="height: 1px"></td>
			</tr>
			
			<tr>
				<td colspan="2">&nbsp;</td>
			</tr>
			
			<tr align="center" valign="middle">
				<td colspan="5">
					<font size="2">
						<a href="javascript:modifyboard()">[수정]</a>&nbsp;&nbsp;
						<!-- BoardModifyAction.java로 이동 -->
						<a href="javascript:history.go(-1)">[뒤로]</a>&nbsp;&nbsp;
					</font>
				</td>
			</tr>
		</table>
			
	</form>
	
</body>
</html>