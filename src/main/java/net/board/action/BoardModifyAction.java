package net.board.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.board.db.BoardBean;
import net.board.db.BoardDAO;
import net.board.action.Action;
import net.board.action.ActionForward;

public class BoardModifyAction implements Action { // qna_bord_modify.jsp에서 넘어온 페이지

   @Override
   public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

      request.setCharacterEncoding("UTF-8");
      ActionForward forward = new ActionForward();
      
      boolean result = false;
      
      int num = Integer.parseInt(request.getParameter("B_NUM")); 
      
      BoardDAO boarddao = new BoardDAO();
      BoardBean boarddata = new BoardBean();
      
      try {
         boarddata.setB_NUM(num);
         boarddata.setB_SUB(request.getParameter("B_SUB"));
         boarddata.setB_CONTENT(request.getParameter("B_CONTENT"));
         boarddata.setB_PW(request.getParameter("B_PW"));
         boarddata.setB_ID(request.getParameter("B_ID")); 
         
         result = boarddao.boardModify(boarddata);
         
         if(result == false) {
            System.out.println("게시판 수정 실패");
            return null;
         }
         
         System.out.println("게시판 수정 완료");
         
         request.setAttribute("boarddata", boarddata);
         forward.setRedirect(false);
         forward.setPath("./board/qna_board_view.jsp");
         // 게시글 수정한 후 바로 수정된 게시물 상세보기로 바로 이동
         return forward;
      }
      catch(Exception e) {
         e.printStackTrace();
      }
      return forward;
   }
}