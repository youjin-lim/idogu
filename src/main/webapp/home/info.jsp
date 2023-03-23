<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>호텔 소개</title>
<style type="text/css">

table{
   margin: auto;
   width: 1000px;
   height: 300px;
   
 
}

img{
	width: 320px;
	height: 230px;
}

tr{
	font-size: 18px; 
}

</style>
</head>
<body style="background-image:url('./images/bgdog.png'); background-attachment: fixed; background-size: cover; height: 100vh;" >
<div style="padding-bottom: 30px">
<%@ include file="../home/header.jsp" %> 
	<form style="height: 3150px; width: 1100px;background-color: white;border-radius: 7px; margin: auto;
	margin-top: 2%; margin-bottom: 100px">
	
	<br><br><br>
	<h3 align="center">개요</h3>
	<div align="center">
	<div>최고의 반려견 전문가들이 24시간 케어하는 애견호텔!</div>
	<div>아이 도그 유는 작고 답답한 공간이 아닌 아늑하고 편안하게 휴식할 수 있는 넒은 객실을 갖춘 프리미엄 애견호텔입니다.</div>
	<div>여행/출장 또는 장시간 집을 비워야할 때 아이 도그 유 애견호텔의 여러 서비스를 이용해 보세요.</div>
	</div>
	<br><br>

	<table style="border-collapse: separate; border-radius: 20px; border: 4px dotted;  border-color: #FFB26E; ">
	   <tr align="center">
	      <td>로얄스위트</td>
	   </tr>
	   <tr align="center">   
	      <td>
	      <img src="./images/rs_1.PNG" >
	      <img src="./images/rs_2.PNG" >
	      <img src="./images/rs_3.PNG" >
	      </td>
	   </tr>
	</table>
	<br><br><br>
  
   <table style="border-collapse: separate; border-radius: 20px; border: 4px dotted;  border-color: #FFB26E; ">
	   <tr align="center">
	      <td>스위트</td>
	   </tr>
	   <tr  align="center">
	      <td>
	      	<img src="./images/su_1.png" >
	      	<img src="./images/su_2.PNG">
	      	<img src="./images/su_3.PNG">
	      </td>
	   </tr>
   </table>
   <br> <br> <br>
  
   <table style="border-collapse: separate; border-radius: 20px; border: 4px dotted;  border-color: #FFB26E; "> 
	   <tr align="center">
	      <td>슈페리어</td>
	   </tr>
	   <tr align="center">   
	  	  <td>
	       	<img src="./images/sp_1.PNG" >
	      	<img src="./images/sp_2.PNG">
	      	<img src="./images/sp_3.PNG">
	      </td>
	   </tr>
   </table>
   <br> <br> <br>
   
   <table style="border-collapse: separate; border-radius: 20px; border: 4px dotted;  border-color: #FFB26E; ">
	   <tr align="center">
	      <td>디럭스</td>
	   </tr>
	   <tr align="center">   
	   	  <td>
	   	  	<img src="./images/di_1.PNG">
	   	  	<img src="./images/di_2.PNG">
	   	  	<img src="./images/di_3.PNG">
	   	  </td>
	    </tr>
	</table>
	<br> <br> <br>

	<br>
	<h3 align="center">공간 소개</h3><br>
	<div align="center">
	   <div>아이 도그 유는 넓은 실내 공간을 자랑하며 호기심 많은 반려견들이</div>
	   <div>여기저기 탐험하며 놀 수 있는 재미있는 공간들이 준비되어 있습니다.</div>
	</div><br><br>

	<table style="border-collapse: separate; border-radius: 20px; border: 4px dotted;  border-color: #FFB26E; height: 570px">
	   <tr align="center" >
	      <td>실내놀이터</td>
	      <td>대형견 실내 놀이터</td>
	      <td>소형견 실내 놀이터</td>
	   </tr>
	   <tr  align="center">
	      <td><img src="./images/play.PNG"></td>
	      <td><img src="./images/play_b.PNG"></td>
	      <td><img src="./images/play_s.PNG"></td>
	   </tr>
	   
	   <tr align="center" >
	      <td>애견포토존</td>
	      <td>볼풀</td>
	      <td>보호자 모니터링이 가능한 CCTV</td>
	   </tr>
	   <tr  align="center">
	      <td><img src="./images/photo.PNG"></td>
	      <td><img src="./images/ball.PNG"></td>
	      <td><img src="./images/cctv.PNG"></td>
	   </tr>
	</table>
	<br><br><br>

	<h3 align="center">오시는 길</h3><br>
	<div id="map" style="margin:auto; width: 500px; height: 400px">
		<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=cd033a39a25f6e21dbc70db3f498f6e8"></script>
		<script>
		var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
		var options = { //지도를 생성할 때 필요한 기본 옵션
			center: new kakao.maps.LatLng(37.499014, 127.032904), //지도의 중심좌표.
			level: 3 //지도의 레벨(확대, 축소 정도)
		};
		var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴
		
		// 마커 표시
		var markerPosition  = new kakao.maps.LatLng(37.499014, 127.032904); // 마커가 표시될 위치
		
		var marker = new kakao.maps.Marker({// 마커 생성
		    position: markerPosition 
		});
		
		marker.setMap(map); // 마커가 지도 위에 표시되도록 설정
		
		// 아래 코드는 지도 위의 마커를 제거하는 코드입니다
		// marker.setMap(null);    
		</script>
	</div>
	<br><br><br>
	
	<h3 align="center">
		<img src="./images/call.png" style="width: 30px; height: 30px">&nbsp;전화문의 02-2222-3333
	</h3><br>
	
	</form>
</div>

</body>
</html>