
package net.member.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.member.db.MemberBean;
import net.member.db.MemberDAO;

public class FindIDAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=utf-8");
		
		ActionForward forward = new ActionForward();
		PrintWriter out = response.getWriter();
		MemberDAO memberdao = new MemberDAO();
		
		//브라우저에서 입력된 이름과 이메일값 받아오기
		String name = request.getParameter("M_NAME");
		String email = request.getParameter("M_EMAIL");
		
		String id = memberdao.findID(name, email);
		
		System.out.println(id);
		
		if(id == "") {
			out.println("<script>");
			out.println("alert('아이디가 존재하지 않습니다.');");
			out.println("location.href='./MemberLogin.me'");
			out.println("</script>");
			out.close();
		}
		
		request.setAttribute("findId", id);
		forward.setRedirect(false);
		forward.setPath("./member/idcheck.jsp");
		return forward;
	}
}
