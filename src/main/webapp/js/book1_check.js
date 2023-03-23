function reservationCheck(){
   if (document.book_1.K_IN.value.length == 0) {
      alert("체크인 날짜를 선택해주세요.");
      book_1.K_IN.focus();
      return false;
   }
   
   if (document.book_1.K_OUT.value.length == 0 ||
      document.book_1.K_OUT.value <= document.book_1.K_IN.value) {
      alert("체크아웃 날짜를 선택해주세요.");
      book_1.K_OUT.focus();
      return false;
   }
   
   if (document.book_1.K_SMALL.value == 0 &&
      document.book_1.K_MEDIUM.value == 0 &&
      document.book_1.K_BIG.value == 0 ){ 
      alert("강아지 크기를 선택해주세요");
      book_1.K_SMALL.focus();
      return false;
   } 
   
   return ture;
}
