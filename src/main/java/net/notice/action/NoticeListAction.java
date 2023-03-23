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

		int maxpage = (listcount %  limit) != 0 ? (listcount/limit) + 1 : (listcount/limit);
	    int startpage = ((int)((double)page/limit + 0.9)-1)*limit+1;
	    int endpage = startpage + limit -1;
		
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