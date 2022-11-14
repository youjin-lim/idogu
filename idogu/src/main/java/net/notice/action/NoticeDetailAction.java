package net.notice.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.notice.db.NoticeBean;
import net.notice.db.NoticeDAO;

public class NoticeDetailAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("utf-8");
		
		NoticeDAO boarddao = new NoticeDAO();
		NoticeBean boarddata = new NoticeBean();
		
		int num = Integer.parseInt(request.getParameter("num"));
		
		boarddao.setReadCountUpdate(num);
		boarddata = boarddao.getDetail(num);
		
		if (boarddata == null) {
			System.out.println("내용 보기 실패");
			return null;
		}
		System.out.println("내용 보기 성공");
		
		request.setAttribute("boarddata", boarddata);
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("./notice/notice_view.jsp");
		return forward;
	}
}
