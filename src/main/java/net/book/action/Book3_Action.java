package net.book.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.book.db.BookBean;
import net.book.db.BookDAO;

public class Book3_Action implements Action {

   @Override
   public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
      request.setCharacterEncoding("utf-8");
      BookDAO bookdao = new BookDAO();
      BookBean bookdata = new BookBean();
      ActionForward forward = new ActionForward();
      HttpSession session = request.getSession();
      int result = 0;
      
      String id =(String)session.getAttribute("id");
      
      String[] arr=request.getParameterValues("K_COURSE");
      String c ="";
      if( arr  != null) {
      for( int i =0;i<arr.length;i++) {
         c+= arr[i]+" ";
      }}else {
         c="추가사항 없음";
      }

      String k = "";
      if((String)request.getParameter("K_CONTENT") == "" ) {
         k="특이사항 없음";
      }else {
         k = (String)request.getParameter("K_CONTENT");
      }
      
      
      try {
         bookdata.setR_NUM(Integer.parseInt(request.getParameter("R_NUM")));
         bookdata.setK_IN((String)session.getAttribute("K_IN"));
         bookdata.setK_OUT((String)session.getAttribute("K_OUT"));
         bookdata.setK_DOG(request.getParameter("K_DOG"));
         bookdata.setK_DOGNAME(request.getParameter("K_DOGNAME"));
         bookdata.setK_AGE(request.getParameter("K_AGE"));
         bookdata.setK_KG(Integer.parseInt(request.getParameter("K_KG")));
         bookdata.setK_SMALL((int)session.getAttribute("K_SMALL"));
         bookdata.setK_MEDIUM((int)session.getAttribute("K_MEDIUM"));
         bookdata.setK_BIG((int)session.getAttribute("K_BIG"));
         bookdata.setK_TOTAL(Integer.parseInt(request.getParameter("K_TOTAL2")));
         bookdata.setK_COURSE(c);
         bookdata.setM_ID(id);
         bookdata.setK_CONTENT(k);

         
         result = bookdao.bookInsert(bookdata);
         
         if(result ==0) {
            System.out.println("Book3_Action() 에러");
            return null;
         }
         System.out.println("Book3_Action() 완료");
         
               
      }catch(Exception e) {
         e.printStackTrace();
      }
      
      request.setAttribute("result", "true");
      
      forward.setRedirect(false);
      forward.setPath("./book/book_4.jsp");
      return forward;      
   }
}
