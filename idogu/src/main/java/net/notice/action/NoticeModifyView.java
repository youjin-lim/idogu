package net.notice.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.notice.db.NoticeBean;
import net.notice.db.NoticeDAO;

public class NoticeModifyView implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
	
		request.setCharacterEncoding("utf-8");

		ActionForward forward = new ActionForward();
		NoticeDAO boarddao = new NoticeDAO();
		NoticeBean boarddata = new NoticeBean();

		int num = Integer.parseInt(request.getParameter("num"));
		boarddata = boarddao.getDetail(num);

		if (boarddata == null) {
			System.out.println("본문 보기 실패");
			return null;
		}
		System.out.println("본문 보기 성공");

		request.setAttribute("boarddata", boarddata);

		forward.setRedirect(false);
		forward.setPath("./notice/notice_modify.jsp");
		return forward;
	}
}