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
<script>
/* $(document).ready(function(){
	
    // 라디오버튼 클릭시 이벤트 발생
    $("input:radio[name=radio]").click(function(){
 
        if($("input[name=radio]:checked").val() == "a"){
            $("input:text[name=text]").attr("disabled",false);
            // radio 버튼의 value 값이 1이라면 활성화
 
        }else if($("input[name=radio]:checked").val() == "b"){
              $("input:text[name=text]").attr("disabled",true);
            // radio 버튼의 value 값이 0이라면 비활성화
        }
    });
});

$(document).ready(function(){
	 
    // 라디오버튼 클릭시 이벤트 발생
    $("input:button[name=add]").click(function(){
 
    	if($("input:text[name=text]").attr("disabled")){ // 비활성화가 되어 있다면(공개라면)
    		$("form").submit();
    	}else{ // 활성화되어있다면(비밀번호)
    		if($("input:text[name=text]").val().trim() == ""){ // q
    			alert("비밀번호를 입력해주세요.");
    			event.preventDefault();
    		}else{
    			$("form").submit();
    		}
    		
    	}

    });
}); */

</script>
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
	
	if(PW) {// 공개이면
		document.boardform.B_PW.disabled = false;
		document.boardform.B_PW.value = "none";
		boardform.submit();
	}else{ // 비공개이면(비밀번호)
		if(document.boardform.B_PW.value == ""){
			alert("비밀번호를 입력해주세요.");
			document.boardform.B_PW.focus();
			
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
				<td colspan="5">문의 게시판</td>
			</tr>
			
			<tr>
				<td style="font-family: 돋움; font-size: 12" height="16">
					<div align="center">글쓴이</div>
				</td>
				<td>
					<%=id %>
				</td>
			</tr>
			
			<tr>
				<td style="font-family: 돋움; font-size: 12" height="16">
					<div align="center">제 목</div>
				</td>
				<td>
					<input name="B_SUB" type="text" size="50" maxlength="100" value="">
				</td>
			</tr>
			
			<tr>
				<td style="font-family: 돋움; font-size: 12" height="16">
					<div align="center">내 용</div>
				</td>
				<td>
					<textarea name="B_CONTENT" cols="67" rows="15"></textarea>
				</td>
			</tr>
			
			<tr>
				<td style="font-family: 돋움; font-size: 12" height="16">
					<input type="radio" name="SHOW" value="private" onClick="active();">비공개
					<input type="radio" name="SHOW" value="public" onClick="disable();" checked>공개
				</td>
				<td>
					<input type="text" name='B_PW' disabled value="">
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