package net.notice.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.notice.db.NoticeBean;
import net.notice.db.NoticeDAO;

public class NoticeModifyAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("utf-8");
		ActionForward forward = new ActionForward();
		boolean result = false;

		int num = Integer.parseInt(request.getParameter("N_NUM"));

		NoticeDAO boarddao = new NoticeDAO();
		NoticeBean boarddata = new NoticeBean();

		try {
			boarddata.setN_NUM(num);
			boarddata.setN_SUB(request.getParameter("N_SUB"));
			boarddata.setN_CONTENT(request.getParameter("N_CONTENT"));

			result = boarddao.boardModify(boarddata);
			
			if (result == false) {
				System.out.println("수정 실패");
				return null;
			}
			System.out.println("수정 완료");

			forward.setRedirect(true);
			forward.setPath("./BoardDetailAction.no?num=" + boarddata.getN_NUM());
			return forward;

		} catch (Exception ex) {
			ex.printStackTrace();
			
		}
		return null;
	}

}