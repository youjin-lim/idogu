package net.member.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.member.db.MemberBean;
import net.member.db.MemberDAO;
// 회원이 내정보 보기를 눌렀을떄 
public class MemberViewAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		ActionForward forward = new ActionForward();
		
		HttpSession session = request.getSession();
		MemberDAO memberdao = new MemberDAO();
		MemberBean member = new MemberBean();
		
		String id = (String) session.getAttribute("id");
		
		if(id == null) {
			forward.setRedirect(true);
			forward.setPath("./MemberLogin.me");
		}
	
		member = memberdao.getDetailMember(id);
		
		if(member == null) {
			System.out.println("회원 정보 불러오기 실패");
			return null;
		}
		
		request.setAttribute("member", member);
		
		forward.setRedirect(false);
		forward.setPath("./member/memberform.jsp");
		
		
		
		return forward;
	}

}
