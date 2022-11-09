package net.member.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.member.db.MemberBean;
import net.member.db.MemberDAO;
//회원정보 수정 
public class MemberModifyAction implements Action {

	
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		

		request.setCharacterEncoding("utf-8");
		ActionForward forward = new ActionForward();

		HttpSession session = request.getSession();
		

		
		MemberDAO memberdao = new MemberDAO();
		MemberBean member = new MemberBean();
		boolean result = false;
		
		
	
		try {
			// 수정한 정보 가져오기 
			member.setM_ID(request.getParameter("M_ID"));
			member.setM_PW(request.getParameter("M_PW"));
			member.setM_TEL(Integer.parseInt(request.getParameter("M_TEL")));
			member.setM_EMAIL(request.getParameter("M_EMAIL"));
		
			
			result = memberdao.memberModify(member); // 수정 쿼리 진행
			
			if( result == false ) {
				System.out.println("memberModify  회원 정보 수정 실패 ");
				return null;
			}
			System.out.println("회원정보 수정 완료 ");
			
			forward.setRedirect(true);
			forward.setPath("./MemberViewAction.me");
			
			
			
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		

		
		
		
		
		
		
		
		return forward;
	}

}
