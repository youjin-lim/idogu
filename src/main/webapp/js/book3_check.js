function reservationCheck_1(){
   if (document.book_3.K_DOG.value.length == 0) {
      alert("견종을 입력해주세요.");
      book_3.K_DOG.focus();
      return false;
   }
   
   if (document.book_3.K_DOGNAME.value.length == 0) {
      alert("강아지이름을 입력해주세요");
      book_3.K_DOGNAME.focus();
      return false;
   }
   
   if (document.book_3.K_AGE.value.length == 0 ){
      alert("강아지 나이를 입력해주세요");
      book_3.K_AGE.focus();
      return false;
   } 
   if (document.book_3.K_KG.value.length == 0 ){
      alert("강아지 몸무게를 입력해주세요");
      book_3.K_KG.focus();
      return false;
   } 
   
   return ture;
}
   
