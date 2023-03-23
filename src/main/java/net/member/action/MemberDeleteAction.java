package net.member.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.member.db.MemberBean;
import net.member.db.MemberDAO;

public class MemberDeleteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		System.out.println("삭제 쿼리쿼리");
		ActionForward forward = new ActionForward();
		HttpSession session = request.getSession();
		MemberDAO memberdao = new MemberDAO();
		MemberBean member = new MemberBean();
		
		boolean result = false;
		
		String id = (String)session.getAttribute("id");
		
		if(id == null) {
			forward.setRedirect(true);
			forward.setPath("./MemberLogin.me");
			return forward;
		}

		
		
		result = memberdao.deleteMember(id);
		session.setAttribute("id", null);
		
		if(result == false) {
			System.out.println("회원 정보가 존재하지 않습니다.");
			return null;
		}
		System.out.println("회원 탈퇴 완료@@");
		forward.setRedirect(false);
		forward.setPath("/Main.re");
		
		
		return forward;
	}
}
