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

	input#b_pw{
		width: 200px; /* 원하는 너비설정 */
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
		
		var contents = CKEDITOR.instances.p_content.getData();

	    if(contents == "") {
	        alert("내용을 입력하세요.");
	        return false;

	    } else {
	        boardform.submit();
	    }
		
		if(PW){ // 공개일때		
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
<body style="background-image: url('./images/bgdog.png'); background-attachment: fixed; background-size: cover; height: 100vh" >
<%@ include file="../home/header.jsp" %>
<div style="height: 750px; width: 900px;background-color: white;border-radius: 7px; margin: auto; margin-top:4% ">
    <form action="./BoardAddAction.do" method="post" name="boardform" style="padding-top: 50px">
        <input type="hidden" name="B_ID" value="<%=id %>">
        <table style="padding-top:50px" align="center" width="800" cellpadding="2">
            <tr>
            	<td height="40" align="center" bgcolor="#ccc"><font color="white" size="5">문의글</font></td>
            </tr>
            <tr>
                <td bgcolor=white>
                    <table class="table2">
                        <tr>
                        	<td align="center">작성자</td>
                        	<td><%=id %></td>
                        </tr>
 
                        <tr>
                        	<td align="center">제 목</td>
                        	<td><input id="b_sub" name="B_SUB" type="text" size="50" maxlength="100" value=""></td>
                        </tr>
 
                        <tr>
                       		<td align="center">내 용</td>
	                        <td>
	                        	<textarea class="form-control" id="p_content" rows="10" cols="30" name="B_CONTENT" style="width: 650px;"></textarea>
	                 				<script type="text/javascript">
	                    			CKEDITOR.replace('p_content'
	                             	 , {height: 300                                                  
	                     			});
	                  			</script>
	                        </td>
                        </tr>
 
                        <tr>
                        	<td style="width:150px" align="center">
								<input type="radio" name="SHOW" value="private" onClick="active();">비공개
								<input type="radio" name="SHOW" value="public" onClick="disable();" checked>공개
                       		</td>
                        	<td>
                        		<input id="b_pw" type="text" name="B_PW" disabled value="">
								<font size="1">비공개의 경우, 답변 게시글에도 같은 비밀번호가 부여됩니다.</font>
                       		</td>
                        </tr>
                    </table>
   
                </td>
            </tr>
                
            <tr>
                <td align="center">
                    <a class="no" href="javascript:addboard()">등록</a>&nbsp;&nbsp; <!--BoardAddAction.java로 이동-->
					<a class="no" href="javascript:history.go(-1)">뒤로</a>
        		</td>
        	</tr>
        </table>
    </form>
</div>
</body>
</html>