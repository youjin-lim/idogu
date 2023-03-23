package net.book.action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.book.db.BookDAO;

public class AdminBookList implements Action {

   @Override
   public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
      HttpSession session = request.getSession();
      BookDAO bookdao = new BookDAO(); // 쿼리 실행공간 
      List booklist = new ArrayList<>(); // 결과를 담을 공간 
      request.setCharacterEncoding("utf-8");
     System.out.println("엑션액션");
      
      
       booklist = bookdao.getAllbooklist();
       
       ActionForward forward = new ActionForward();
       forward.setRedirect(false);
       forward.setPath("./book/adminbooklist.jsp");
      request.setAttribute("booklist", booklist);
      
      return forward;
   }

}