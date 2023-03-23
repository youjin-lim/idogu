package net.book.action;

import java.net.MulticastSocket;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.book.db.BookDAO;

public class BookdelAction implements Action {

   @Override
   public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
      
      HttpSession session = request.getSession();
      BookDAO bookdao = new BookDAO(); // 쿼리 실행공간 
      request.setCharacterEncoding("utf-8");
      System.out.println(7777777);
      int K_NUM = Integer.parseInt(request.getParameter("K_NUM").trim());
      
      int result = bookdao.bookdel(K_NUM);
      
      if(result ==0) {
         System.out.println(" 예약 삭제 실패");
         return null;
      }
      System.out.println("예약 삭제 성공");
      
      ActionForward forward = new ActionForward();
       
      if(session.getAttribute("id").equals("admin")) {
         forward.setRedirect(false);
         forward.setPath("/AdminBookList.re");
      }else {
      forward.setRedirect(false);
       forward.setPath("/BookList.re");
      }
      
      return forward;
      
      
      
      
      
      
   }

}