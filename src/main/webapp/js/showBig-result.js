var bigPic_1 = document.querySelector("#dirus");  // 큰 이미지 가져옴
var smallPics_1 = document.querySelectorAll(".small_1");  // 작은 이미지들을 노드 리스트로 가져옴

for(var i = 0; i < smallPics_1.length; i++) {
	smallPics_1[i].addEventListener("click", chagePic_1);   // 노드를 클릭하면 changePic 함수 실행
}
function chagePic_1() {
	var newPic = this.src;   // click 이벤트가 발생한 대상의 src 속성 값 가져옴
	bigPic_1.setAttribute("src", newPic);  // newPic 값을 큰 이미지의 src 속성에 할당.
	// 윗 줄을 cup.src = newPic; 로 사용해도 됨.
}	


var bigPic_2 = document.querySelector("#superier");  // 큰 이미지 가져옴
var smallPics_2 = document.querySelectorAll(".small_2");  // 작은 이미지들을 노드 리스트로 가져옴

for(var i = 0; i < smallPics_2.length; i++) {
	smallPics_2[i].addEventListener("click", chagePic_2);   // 노드를 클릭하면 changePic 함수 실행
}
function chagePic_2() {
	var newPic = this.src;   // click 이벤트가 발생한 대상의 src 속성 값 가져옴
	bigPic_2.setAttribute("src", newPic);  // newPic 값을 큰 이미지의 src 속성에 할당.
	// 윗 줄을 cup.src = newPic; 로 사용해도 됨.
}	
		
		
var bigPic_3 = document.querySelector("#suite");  // 큰 이미지 가져옴
var smallPics_3 = document.querySelectorAll(".small_3");  // 작은 이미지들을 노드 리스트로 가져옴

for(var i = 0; i < smallPics_3.length; i++) {
	smallPics_3[i].addEventListener("click", chagePic_3);   // 노드를 클릭하면 changePic 함수 실행
}
function chagePic_3() {
	var newPic = this.src;   // click 이벤트가 발생한 대상의 src 속성 값 가져옴
	bigPic_3.setAttribute("src", newPic);  // newPic 값을 큰 이미지의 src 속성에 할당.
	// 윗 줄을 cup.src = newPic; 로 사용해도 됨.
}		


var bigPic_4 = document.querySelector("#royalsuite");  // 큰 이미지 가져옴
var smallPics_4 = document.querySelectorAll(".small_4");  // 작은 이미지들을 노드 리스트로 가져옴

for(var i = 0; i < smallPics_4.length; i++) {
	smallPics_4[i].addEventListener("click", chagePic_4);   // 노드를 클릭하면 changePic 함수 실행
}
function chagePic_4() {
	var newPic = this.src;   // click 이벤트가 발생한 대상의 src 속성 값 가져옴
	bigPic_4.setAttribute("src", newPic);  // newPic 값을 큰 이미지의 src 속성에 할당.
	// 윗 줄을 cup.src = newPic; 로 사용해도 됨.
}	


			
