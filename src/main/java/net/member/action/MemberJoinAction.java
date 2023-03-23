package net.member.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.member.db.MemberBean;
import net.member.db.MemberDAO;

public class MemberJoinAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=utf-8");
		
		ActionForward forward = new ActionForward();
		PrintWriter out = response.getWriter();
		MemberDAO memberdao = new MemberDAO();
		MemberBean member = new MemberBean();
		
		boolean result = false;
		
		System.out.println("join");
		
		member.setM_ID(request.getParameter("M_ID"));
		member.setM_PW(request.getParameter("M_PW"));
		member.setM_NAME(request.getParameter("M_NAME"));
		member.setM_TEL(request.getParameter("M_TEL"));
		member.setM_EMAIL(request.getParameter("M_EMAIL"));
		
		result = memberdao.joinMember(member);
		
		if(result == false) {
			System.out.println("회원가입 실패");
		}
		
		out.println("<script>");
		out.println("alert('회원가입 완료 되었습니다.');");
		out.println("location.href='./MemberLogin.me';");
		out.println("</script>");
		out.close();
		
		forward.setRedirect(true);
		forward.setPath("./MemberLogin.me");
		return forward;
	}
}
