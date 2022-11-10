package net.notice.action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.notice.db.NoticeDAO;

public class NoticeListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		NoticeDAO boarddao = new NoticeDAO();
		List boardlist = new ArrayList();
		
		int page = 1;
		int limit = 10;
		
		request.setCharacterEncoding("utf-8");
		
		if (request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		
		
		String cond = null;
		
		int listcount = boarddao.getListCount(cond);
		boardlist = boarddao.getBoardList(page, limit, cond);
		
		// 총 페이지 수: 0.95를 더해서 올림 처리
		int maxpage = (int)((double)listcount / limit + 0.95);
		
		// 현재 페이지에서 보여줄 시작 페이지 수 (1, 11, 21, 등..)
		int startpage = (((int)((double)page / 10 + 0.9)) - 1) * 10 + 1;
		
		// 현재 페이지에서 보여줄 마지막 페이지 수 (10, 20, 30 등)
		int endpage = startpage + 10 - 1;
		
		if (endpage > maxpage) {
			endpage = maxpage;
		}
		
		request.setAttribute("page", page);
		request.setAttribute("maxpage", maxpage);
		request.setAttribute("startpage", startpage);
		request.setAttribute("endpage", endpage);
		request.setAttribute("listcount", listcount);
		request.setAttribute("boardlist", boardlist);
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("./notice/notice_list.jsp");
		return forward;
		
	}
	
}