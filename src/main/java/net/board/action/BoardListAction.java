package net.board.action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.board.db.BoardDAO;
import net.board.action.Action;
import net.board.action.ActionForward;

public class BoardListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("utf-8");
		ActionForward forward = new ActionForward();
		HttpSession session = request.getSession();
		
		String id = (String)session.getAttribute("id"); 
		
		BoardDAO boarddao = new BoardDAO();
		List boardlist = new ArrayList();
		
		int page = 1;
		int limit = 10;
		
		if(request.getParameter("page") != null) {  // qna_board_list.jsp에서 [이전]이나 [다음], [숫자]등을 누르고 넘어왔다면 
			page = Integer.parseInt(request.getParameter("page"));
		}
		
		int listcount = boarddao.getListCount(); // 게시글 총개수 받아옴
		
		int maxpage = (int)((double)listcount / limit + 0.95);
		
		int startpage = (((int)((double)page / 10 + 0.9)) - 1) * 10 + 1;
		
		int endpage = maxpage;
		
		if(endpage > startpage + 10 -1) endpage = startpage + 10 - 1; 
		
		// 검색 기능
		String srchKey = request.getParameter("srchKey"); // 검색어 
		String srchFlds = request.getParameter("srchFlds"); // 검색 필드
		String cond = null;
		
		if(srchKey == null || srchKey.equals("")) { // 만약 검색어 입력하고 [검색]버튼 누른게 아니라면
			cond = null; 
			
		// [검색]버튼 눌렀을 때
		}else if(srchFlds.equals("all")) { // 검색필드가 모두였을 때. 비공개 게시글은 내용 검색은 안되도록 B_PW = 'none'
			String whereFmt = " upper(B_SUB) like '%%' || upper('%s') || '%%' "
					+ " or upper(B_ID) like '%%' || upper('%s') || '%%' "
					+ " or (upper(B_CONTENT) like '%%' || upper('%s') || '%%' and B_PW = 'none')";
			cond = String.format(whereFmt, srchKey, srchKey, srchKey); 
			
		}else if(srchFlds.equals("sub")) { 
			String whereFmt = " upper(B_SUB) like '%%' || upper('%s') || '%%'";
			cond = String.format(whereFmt, srchKey);
			
		}else if(srchFlds.equals("au")) {
			String whereFmt = " upper(B_ID) like '%%' || upper('%s') || '%%'";
			cond = String.format(whereFmt, srchKey);
			
		}else if(srchFlds.equals("con")) { // 비공개 게시글은 내용 검색이 안되도록 B_PW = 'none'
			String whereFmt = " upper(B_CONTENT) like '%%' || upper('%s') || '%%' and B_PW = 'none'";
			cond = String.format(whereFmt, srchKey);
		
		}
		
		boardlist = boarddao.getBoardList(page, limit, cond); // 게시글 최대 10개가 담긴 List 반환
		
		request.setAttribute("page", page); // 현재 페이지수
		request.setAttribute("maxpage", maxpage); // 최대 페이지수
		request.setAttribute("startpage", startpage); // 현재 페이지에 표시할 첫 페이지수
		request.setAttribute("endpage", endpage); // 현재 페이지에 표시할 끝 페이지수
		request.setAttribute("listcount", listcount); // 게시글 수
		request.setAttribute("boardlist", boardlist); 
		
		request.setAttribute("srchKey", srchKey); // 검색어
		request.setAttribute("srchFlds", srchFlds); // 검색필드
		
		forward.setRedirect(false); // request.setAttribute은 RequestDispatcher 방식으로 이동해야지 세션 값이 전달됨
		forward.setPath("./board/qna_board_list.jsp");
		return forward;
		
	}

}
