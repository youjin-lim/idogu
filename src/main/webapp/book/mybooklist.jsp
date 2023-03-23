<%@page import="org.apache.xalan.xsltc.compiler.Template"%>
<%@page import="java.util.ArrayList"%>
<%@page import="net.member.db.MemberBean"%>
<%@ page import="net.book.db.*"%>
<%@ page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
List bookList = (List) request.getAttribute("booklist");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.min.js" integrity="sha384-IDwe1+LCz02ROU9k972gdyvl+AESN10+x7tBKgc9I5HFtuNz0wWnPclzo6p9vxnk" crossorigin="anonymous"></script>
<title>나의 예약 내역 확인하기</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">

<style type="text/css">
/* #fostyle {
	position: absolute;
	top: 50%;
	left: 50%;
	height: 900px;
	width: 1580px;
	margin-top: -450px;
	margin-left: -780px;
	
}
 */
 #fostyle {
	position: relative;

	
}
 
 
.divbg{
/* position: absolute; */
background-color: white;
	
	top: 60%;
	left: 50%;
	height: 500px;
	width: 1580px;
	margin-top: -450px;
	margin-left: -780px;
	border-radius: 7px;
	margin: auto;
	


}
</style>


 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">

</head>

<body  style="background-image: url('./images/bgdog.png'); background-attachment: fixed; background-size: cover; height: 100vh; "      >
<div class="container">
<header>
      <nav class="navbar navbar-expand-lg navbar-fixed-top">
         <div class="container-fluid">
            <!-- <a href="./Main.re"><img src="images/main.png"></a> -->
         </div>
         <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
          </button>
           <div class="collapse navbar-collapse" id="navbarNavDropdown">
         <ul class="navbar-nav">
            <li class="nav-item">
               <a class="nav-link" href="./Main.re"><font color="white">Home</font></a>
            </li>
            <li class="nav-item">
               <a class="nav-link" href="./Book_1.re" target="_self"><font color="white">Reservation</font></a>
            </li>
            <li class="nav-item">
               <a class="nav-link" href="#"><font color="white">search</font></a>
            </li>
            <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"><font color="white">
               Community
            </font></a>
            <ul class="dropdown-menu">
               <li><a class="dropdown-item" href="./BoardList.no" target="_self">Notice</a></li>
               <li><a class="dropdown-item" href="./BoardList.do" target="_self">Q & A</a></li>
            </ul>
            </li>
         </ul>
         </div>
      </nav>
   </header>
  </div>
<br><br><br><br><br>
<div class="divbg" >
	
	
	
	<form action="" id="fostyle">



		<table class="table table-sm"  style="width: 1490px; margin: auto;" >
			<tr>
				<th colspan="11">
				<br>  <br>
					<h2 align="center">나의 예약 내역 확인하기</h2> <br> <br>
				</th>
			</tr>

			<tr bgcolor="#B3D2FA" align="center">
				
				<th width="100px" >이름</th>
				<th width="50px" >나이</th>
				<th width="50px" >KG</th>
				<th width="140px" >견종</th>
				<th width="120px" >방정보</th>
				<th width="220px" >코스</th>
				<th width="110px;" >체크인</th>
				<th width="110px;" >체크아웃</th>
				<th width="280px" >요청사항</th>
				<th width="130px" >결제 금액</th>
				<th width="110px" > 취 소 </th>
			</tr>

			<%
			if (bookList.size() == 0) {
			%>
			<tr>
				<td colspan="11" align="center" style="background-color: #EBEBEB;">예약 내역이 존재하지 않습니다.</td>
			</tr>
			<%
			} else {
			%>
			<%
			for (int i = 0; i < bookList.size(); i++) {
				BookBean bk = (BookBean) bookList.get(i);
				System.out.println(bk.getK_DOGNAME());
			%>

			<tr align="center" valign="middle" onmouseover="this.style.backgroundColor = '#D0FBFF' " onmouseout="this.style.backgroundColor = ''">
			
				<td><%=bk.getK_DOGNAME()%></td>
				<td><%=bk.getK_AGE()%></td>
				<td><%=bk.getK_KG()%> kg</td>
				<td><%=bk.getK_DOG()%></td>
				
				<td>  <% 
				
				String rname = "";
				int rnum =bk.getR_NUM();
				
				if(rnum == 1){
					 rname = "디럭스";
				}else if(rnum ==2){
					rname = "슈페리어";
				}else if (rnum == 3){
					rname = "스위트";
				}else {
					rname = "로얄스위트";
				}
				
				%>  <%=rname %> </td>
				
				
				
				<%-- <td><%=bk.getR_NUM()%></td> --%>
				
				
				<td><%=bk.getK_COURSE()%></td>
				<td><%=bk.getK_IN()%></td>
				<td><%=bk.getK_OUT()%></td>
				<td><%=bk.getK_CONTENT()%></td>
				<td><%=bk.getK_TOTAL()%></td>
				<%-- <td>   <a href="bookdel.re?K_NUM=<%=bk.getK_NUM() %> " > 예약 취소</a>  </td> --%>
				
				<td> <button type="button" onclick="del();"  class="btn btn-outline-primary"  >예약 취소</button> </td>
<script type="text/javascript">



function del( ) {
	
	if (confirm("정말 예약을 취소하시겠습니까 ?")) {
		alert('취소되었습니다 감사합니다.');
	 /* location.href='bookdel.re?K_NUM=num'; */
	   location.href = 'bookdel.re?K_NUM= <%=bk.getK_NUM() %>' ; 
		
	} else {
		return ;
		//location.href = '';
	}
	
	
	
}


</script>






			</tr>
			<%
			}
			}
			%>






		</table>
	
           <div align="right" >
           <br> <br>
			<button type="button" onclick="location.href='Main.re'"  style="margin-right: 100px;"  class="btn btn-outline-dark" >홈으로 돌아가기</button>
</div>


	



	</form>
</div>



</body>
</html>