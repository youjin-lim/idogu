<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="net.member.db.*"%>

<!--  id에 해당하는 member 정보를 담아옴  -->
<%
MemberBean member = (MemberBean) request.getAttribute("member");

request.setAttribute("member", member);
String id = member.getM_ID();
%>

<%
if (member.getM_ID() == null) {
%>
<script type="text/javascript">
   alert('회원 전용 공간입니다. 로그인 후 이용하세요');

   window.location.href = './Main.re ';
</script>

<%
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.min.js" integrity="sha384-IDwe1+LCz02ROU9k972gdyvl+AESN10+x7tBKgc9I5HFtuNz0wWnPclzo6p9vxnk" crossorigin="anonymous"></script>
<title>내정보 확인하기</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
</head>

<style type="text/css">
div {
   margin: auto;
   text-align: center;
}

#fostyle {
   position: absolute;
   top: 50%;
   left: 50%;
   height: 420px;
   width: 350px;
   margin-top: -300px;
   margin-left: -175px;
}

table {
   position: relative;
   margin: auto;
   width: 300px;
}

.divbg {
   position: absolute;
   background-color: white;
   top: 70%;
   left: 50%;
   height: 560px;
   width: 700px;
   margin-top: -450px;
   margin-left: -350px;
   padding-top: 40px;
   border-radius: 7px;
}

#fontsize {
   font-size: large;
}

.container {
   width: 90%;
   margin: 0 auto;
}
</style>



<body style="background-image: url('./images/bgdog.png'); background-attachment: fixed; background-size: cover; height: 100vh;">
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
               <a class="nav-link" href="./home/info.jsp" target="_self"><font color="white">Brand</font></a>
            </li>
            <li class="nav-item">
               <a class="nav-link" href="./Book_1.re" target="_self"><font color="white">Reservation</font></a>
            </li>
            <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"><font color="white">
               Community
            </font></a>
            <ul class="dropdown-menu">
               <li><a class="dropdown-item" href="./BoardList.no" target="_self">Notice</font></a></li>
               <li><a class="dropdown-item" href="./BoardList.do" target="_self">Q & A</font></a></li>
            </ul>
            </li>
         </ul>
         </div>
      </nav>
   </header>
   </div>
   <div class="divbg">
      <form style="position: relative;" action="./MemberModify.me">
         <input type="hidden" name="M_ID" value="<%=member.getM_ID()%>">

         <div>
            <%
            if (id.equals("admin")) {
            %>
            <h1 style="color: #cccccc">  🔒 관리자 페이지 </h1>
            <%
            } else {
            %>

            <h1 style="color: #cccccc"> 👨‍🦲회원정보 확인페이지</h1>
            <%
            }
            %>
         </div>
         <br> <br>
         <table id="fontsize">




            <tr style="background-color: #cccccc" height="2px;">
               <td colspan="2"></td>

            </tr>
            <tr>
               <td>&nbsp;</td>
            </tr>





            <%
            if (id.equals("admin")) {
            %>
            
               <tr align="center">
               <td colspan="2"><a href="adminview.me" style="text-decoration: none; color: b"> <br> ✔ ‍회원 목록 보기
               </a></td>
            </tr>
            
            <tr align="center">
               <td colspan="2"><a href="AdminBookList.re" style="text-decoration: none; color: b"> <br> ✔ ‍회원 예약 내역 확인하기
               </a></td>
            </tr>

         
            <%
            } else {
            %>

            <tr align="center">
               <td>아이디 :</td>
               <td id="tds"><%=member.getM_ID()%></td>
            </tr>

            <tr align="center">
               <td>비밀번호 :</td>
               <td><%=member.getM_PW()%></td>
            </tr>

            <tr align="center">
               <td>이름 :</td>
               <td><%=member.getM_NAME()%></td>
            </tr>

            <tr align="center">
               <td>전화번호 :</td>
               <td><%=member.getM_TEL()%></td>
            </tr>

            <tr align="center">
               <td>이메일 주소 :</td>
               <td><%=member.getM_EMAIL()%></td>
            </tr>

            <tr align="center">
               <td colspan="2"><a href="BookList.re" style="text-decoration: none; color: b"> <br> ✔ ‍예약 내역 확인하기
               </a></td>
            </tr>

            <%
            }
            %>


            <tr>
               <td>&nbsp;</td>
            </tr>





            <tr style="background-color: #cccccc" height="2px;">
               <td colspan="2"></td>

            </tr>

            <tr>
               <td>&nbsp;</td>
            </tr>

            <tr>
               <td align="center">

                  <button type="submit" onclick="location.href='MemberModify.me'" style="width: 150px;" class="btn btn-outline-dark">내정보 수정하기</button>
               </td>
               <td align="center">
                  <button type="button" onclick="location.href='Main.re'" class="btn btn-outline-dark">홈으로 돌아가기</button> <!--    
               <a onclick="history.go(-1) ;return false;"> [뒤로가기] </a> &nbsp; &nbsp;
               <a onclick="location.href='MemberModify.me'"> [ 내정보 수정하기 ] </a> -->
               </td>
            </tr>
         </table>


      </form>
   </div>

</body>
</html>