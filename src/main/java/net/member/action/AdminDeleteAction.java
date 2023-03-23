package net.member.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.member.db.MemberBean;
import net.member.db.MemberDAO;

public class AdminDeleteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
	
		ActionForward forward = new ActionForward();
		HttpSession session = request.getSession();
		MemberDAO memberdao = new MemberDAO();
		MemberBean member = new MemberBean();
		
		String id = (String)request.getParameter("d_id");
		System.out.println(id + "체크 ");
		
		boolean result = memberdao.admin_delete(id);
		
		if(result == false) {
			System.out.println("관리자가 회원 삭제 실패");
			return null;
		}
		
		if(result == true) {
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('삭제되었습니다.');");
			out.println("location.href='./adminview.me';"); // 다시 qna_board_list.jsp로
			out.println("</script>");
			out.close();
			System.out.println("관리자가 회원 삭제 성공");
			return null;
		}
		
		return null;
	}

}
