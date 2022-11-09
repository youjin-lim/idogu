package net.member.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.member.db.MemberDAO;

//회원 탈퇴 
public class MemberDeleteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		ActionForward forward = new ActionForward();
		HttpSession session = request.getSession();
		MemberDAO memberdao = new MemberDAO(); // 쿼리 실행 공간
		boolean result = false;

		String id = (String) session.getAttribute("id");

		if (id == null) {
			System.out.println("DELETE 아이디 오류 null");
		}

		// 회원 삭제 실행
		result = memberdao.deleteMember(id);

		if (result == false) {
			System.out.println("회원 삭제 실패 ");
			return null;
		} else {
			System.out.println("회원 삭제 성공 ");
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('탈퇴가 완료되었습니다. 이용해주셔서 감사합니다.')");
			out.println("</script>");
			out.close();
		}

		session.invalidate();
		System.out.println("세션 종료");
		forward.setRedirect(true);
		forward.setPath("./Main.jsp");
		// github test
		return forward;
	}

}
