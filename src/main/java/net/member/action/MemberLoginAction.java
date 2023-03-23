package net.member.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.member.db.MemberBean;
import net.member.db.MemberDAO;

public class MemberLoginAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		HttpSession session = request.getSession();
		ActionForward forward = new ActionForward();
		MemberDAO memberdao = new MemberDAO();
		MemberBean member = new MemberBean();
		
		int result = -1;
		
		member.setM_ID(request.getParameter("M_ID"));
		member.setM_PW(request.getParameter("M_PW"));
		
		result = memberdao.isMember(member);
		//아이디는 맞는데 비밀번호가 틀릴 때
		if(result == 0) {
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('비밀번호가 일치하지 않습니다.');");
			out.println("location.href='./MemberLogin.me';");
			out.println("</script>");
			out.close();
			
			return null;
		}
		
		//아이디가 존재하지 않을 떄
		else if(result == -1) {
			System.out.println("test33");
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('아이디가 존재하지 않습니다.');");
			out.println("location.href='./MemberLogin.me';");
			out.println("</script>");
			out.close();
			return null;
		}
		
		//로그인 성공(아이디와 비밀번호가 다 일치할 때)
		session.setAttribute("id", member.getM_ID());
		System.out.println("로그인 성공");
		forward.setRedirect(true);
		forward.setPath("./Main.re"); //여기 메인 페이지로 수정
		
		return forward;
	}
}
