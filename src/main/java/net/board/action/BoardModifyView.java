package net.board.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.board.db.BoardBean;
import net.board.db.BoardDAO;
import net.board.action.Action;
import net.board.action.ActionForward;

public class BoardModifyView implements Action { // qna_board_view.jsp에서 버튼 누르고 넘어온 페이지

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		ActionForward forward = new ActionForward();
		request.setCharacterEncoding("utf-8");
		
		BoardDAO boarddao = new BoardDAO();
		BoardBean boarddata = new BoardBean();
		
		int num = Integer.parseInt(request.getParameter("num"));
		boarddata = boarddao.getDetail(num); // 해당 게시글 객체를 반환
		
		if(boarddata == null) {
			System.out.println("(수정)상세보기 실패");
			return null;
		}
		System.out.println("(수정)상세보기 성공");
		
		request.setAttribute("boarddata", boarddata); 
		forward.setRedirect(false);
		forward.setPath("./board/qna_board_modify.jsp");
		return forward;
	}

}

