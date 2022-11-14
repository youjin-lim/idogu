package net.member.action;

// 내정보 수정하기를 클릭했을때 
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.member.db.MemberBean;
import net.member.db.MemberDAO;

public class MemberModify implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("여기여기");
		HttpSession session = request.getSession();
	
		
		request.setCharacterEncoding("utf-8");
		ActionForward forward = new ActionForward();

		MemberDAO memberdao = new MemberDAO();
		MemberBean member = new MemberBean();

		String id = (String) session.getAttribute("id");
        
		
		boolean result = false;

		member = memberdao.getDetailMember(id);
		if (member == null) {
			System.out.println("회원정보 수정창 이동실패");
			return null;
		}

		
		request.setAttribute("member", member);
		forward.setRedirect(false);
		forward.setPath("./member/membermodify.jsp");

		return forward;

	}

}
