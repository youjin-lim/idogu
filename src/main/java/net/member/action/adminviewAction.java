package net.member.action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.member.db.MemberBean;
import net.member.db.MemberDAO;
//관리자가 회원정보 조회를 위한 페이지 
public class adminviewAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		ActionForward forward = new ActionForward();
		HttpSession session = request.getSession();
		
		MemberDAO memberdao = new MemberDAO();
		List memberlist = new ArrayList();
		
		int page = 1;
		int limit = 10;
		
		if(request.getParameter("page") != null) {  // qna_board_list.jsp에서 [이전]이나 [다음], [숫자]등을 누르고 넘어왔다면 
			page = Integer.parseInt(request.getParameter("page"));
		}
		
		int listcount = memberdao.getListCount(); // 게시글 총개수 받아옴
		
		int maxpage = (int)((double)listcount / limit + 0.95);
		
		int startpage = (((int)((double)page / 10 + 0.9)) - 1) * 10 + 1;
		
		int endpage = maxpage;
		
		if(endpage > startpage + 10 -1) endpage = startpage + 10 - 1; 
		
		String id = (String)session.getAttribute("id");
		
		if(!(id.equals("admin"))) {
			return null; 
		}
		
		if(memberlist == null) {
			System.out.println("관리자님 정보를 불러오는데 실패했습니다.");
			return null;
		}
		
		memberlist = memberdao.getAdminview(page, limit); // 게시글 최대 10개가 담긴 List 반환
		
		request.setAttribute("page", page); // 현재 페이지수
		request.setAttribute("maxpage", maxpage); // 최대 페이지수
		request.setAttribute("startpage", startpage); // 현재 페이지에 표시할 첫 페이지수
		request.setAttribute("endpage", endpage); // 현재 페이지에 표시할 끝 페이지수
		request.setAttribute("listcount", listcount); // 게시글 수
		request.setAttribute("memberlist", memberlist); 
		
		forward.setRedirect(false);
		forward.setPath("./member/admin.jsp");
		
		return forward;
	}

}
