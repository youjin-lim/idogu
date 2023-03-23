package net.member.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class MemberLogoutAction implements Action {

   @Override
   public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
      ActionForward forward = new ActionForward();
      response.setContentType("text/html; charset=utf-8");
      HttpSession session = request.getSession();
      PrintWriter out = response.getWriter();

      session.invalidate();
      forward.setRedirect(false);
      forward.setPath("./home/main.jsp");
      System.out.println("로그아웃 성공");
      return forward;
   }
}