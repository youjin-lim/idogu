package net.board.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.board.db.BoardDAO;
import net.board.action.Action;
import net.board.action.ActionForward;

public class BoardDeleteAction implements Action {

   @Override
   public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
      
      ActionForward forward = new ActionForward();
      request.setCharacterEncoding("utf-8");
      
      HttpSession session = request.getSession();
      String id = (String)session.getAttribute("id");
      
      boolean result = false;
      int num = Integer.parseInt(request.getParameter("num"));
      int re_ref = Integer.parseInt(request.getParameter("re_ref"));
      System.out.println(re_ref);
      
      BoardDAO boarddao = new BoardDAO();
      
      result = boarddao.boardDelete(num, re_ref);

      if(result == false) {
         System.out.println("게시판 삭제 실패");
         return null;
      }
      
      System.out.println("게시판 삭제 성공");
      forward.setRedirect(true);
      forward.setPath("./BoardList.do");
      return forward;
   }

}