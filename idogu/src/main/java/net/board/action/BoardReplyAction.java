package net.board.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.board.db.BoardBean;
import net.board.db.BoardDAO;
import net.board.action.Action;
import net.board.action.ActionForward;

public class BoardReplyAction implements Action { // qna_board_view에서 [답변] 누르고 넘어온 페이지

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		ActionForward forward = new ActionForward();
		BoardDAO boarddao = new BoardDAO();
		BoardBean boarddata = new BoardBean();
		
		int num = Integer.parseInt(request.getParameter("num")); 
		
		boarddata = boarddao.getDetail(num); // num에 해당하는 게시글 객체를 반환하는 메소드
		
		if(boarddata == null) {
			System.out.println("답변글 작성 실패");
			return null;
		}
		
		System.out.println("답변글 작성~~");
		
		request.setAttribute("boarddata", boarddata); 
		forward.setRedirect(false);
		forward.setPath("./board/qna_board_reply.jsp");
		return forward;
	}

}
