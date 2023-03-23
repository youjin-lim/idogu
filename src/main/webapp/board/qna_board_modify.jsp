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
	table.table2{
		border-collapse: separate;
        border-spacing: 1px;
        line-height: 1.5;
        border-top: 1px solid #ccc;
        margin-bottom:10px;
        margin-top:10px;
        width: 100%
    }
    table.table2 tr {
        margin: 0;
        padding: 10px;
        font-weight: bold;
        border-bottom: 1px solid #ccc;
    }
    table.table2 td {
        padding: 10px;
        vertical-align: middle;
        border-bottom: 1px solid #ccc;
        vertical-align: "middle";
    }
        
        
	a.no {
    	text-decoration: none;
    	color: black;
	}
	
	a.no:hover {
		font-weight: bold;
		color: black;
	}
    
    input#b_sub{
		width: 400px; /* 원하는 너비설정 */
		height: 30px;
    	padding: 5px 5px; /* 여백으로 높이 설정 */
    	border: 1px solid #999;
    	border-radius: 0px; /* iOS 둥근모서리 제거 */
    	vertical-align: middle;
    	font-size: 10pt;
	}
	

</style>
<script type="text/javascript" src="./ckeditor/ckeditor.js"></script>
<script>

	function modifyboard() {
		
		if(document.modifyform.B_SUB.value.trim() == ""){
			alert("제목을 작성해주세요.");
			document.modifyform.B_SUB.focus();
			return;
		}
		
		var contents = CKEDITOR.instances.p_content.getData();
	    if(contents == "") {
	        alert("내용을 입력하세요.");
	        return false;

	    } else {
	        modifyform.submit();
	    }
	    return true; 

	}
	

</script>
</head>
<body style="background-image: url('./images/bgdog.png');background-attachment: fixed; background-size: cover; height: 100vh">
<%@ include file="../home/header.jsp" %>
<!-- 게시판 수정 -->
<div style="height: 750px;width: 900px; background-color: white; border-radius: 7px; margin: auto; padding-top: 50px; margin-top:100px">
	<form action="BoardModifyAction.do" method="post" name="modifyform">
		<input type="hidden" name="B_NUM" value="<%=board.getB_NUM()%>">
		<input type="hidden" name="B_ID" value="<%=id %>">
		<input type="hidden" name="B_PW" value="<%=board.getB_PW() %>">

		<table style="padding-top:50px" align="center" width="800" cellpadding="2">
			<tr>
            	<td height=40 align= center bgcolor=#ccc><font color=white size="5">문의글 수정</font></td>
            </tr>
			<tr>
				<td bgcolor="white">
					<table class="table2">
						<tr>
                        	<td style="width: 100px" align="center">작성자</td>
                        	<td><%=id %></td>
                        </tr>

						<tr>
                        	<td align="center">제 목</td>
                        	<td><input id="b_sub" name="B_SUB" type="text" size="50" maxlength="100" value="<%=board.getB_SUB()%>"></td>
                        </tr>
						
						<tr>
                        	<td align="center">내 용</td>
                        	<td>
	                        	<textarea class="form-control" id="p_content" rows="10" cols="30" name="B_CONTENT" style="width: 650px;"><%=board.getB_CONTENT() %></textarea>
	                 				<script type="text/javascript">
	                    			CKEDITOR.replace('p_content'
	                             	 , {height: 300                                                  
	                     			});
	                  			</script>
                       		</td>
                        </tr>
					</table>
				</td>
			</tr>
						
			<tr>
				<td align="center">
					<a class="no" href="javascript:modifyboard()"><font size="4">수정</font></a>&nbsp;&nbsp;
					<!-- BoardModifyAction.java로 이동 -->
					<a class="no" href="javascript:history.go(-1)"><font size="4">뒤로</font></a>&nbsp;&nbsp;
					
				</td>
			</tr>
		</table>
			
	</form>
</div>
	
</body>
</html>