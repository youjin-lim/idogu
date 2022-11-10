package net.notice.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.notice.db.NoticeDAO;

public class NoticeDeleteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		request.setCharacterEncoding("utf-8");
		ActionForward forward = new ActionForward();
		boolean result = false;
		
		int num = Integer.parseInt(request.getParameter("num"));
		
		NoticeDAO boarddao = new NoticeDAO();
		
		result = boarddao.boardDelete(num);
		
		if (result == false) {
			System.out.println("삭제 실패");
			return null;
		}
		
		System.out.println("삭제 완료");
		
		
		forward.setRedirect(true);
		forward.setPath("./BoardList.no");
		return forward;
	}

}