package net.member.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.member.db.MemberDAO;

public class FindPWAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=utf-8");
		
		ActionForward forward = new ActionForward();
		PrintWriter out = response.getWriter();
		MemberDAO memberdao = new MemberDAO();
		
		String id = request.getParameter("M_ID");
		String name = request.getParameter("M_NAME");
		String email = request.getParameter("M_EMAIL");
		
		String pw = memberdao.findPW(id, name, email);
		
		if(pw == "") {
			out.println("<script>");
			out.println("alert('가입 정보가 존재하지 않습니다.');");
			out.println("location.href='./MemberLogin.me';");
			out.println("</script>");
			out.close();
		}
		
		request.setAttribute("findPW", pw);
		forward.setRedirect(false);
		forward.setPath("./member/pwcheck.jsp");
		return forward;
	}

}
