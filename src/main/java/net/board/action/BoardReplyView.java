package net.board.action;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.board.db.BoardBean;
import net.board.db.BoardDAO;
import net.board.action.Action;
import net.board.action.ActionForward;

public class BoardReplyView implements Action { // qna_board_reply.jsp에서 넘어온 페이지

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("utf-8"); // 안써주면 한글 인식 못함
		ActionForward forward = new ActionForward();
		BoardDAO boarddao = new BoardDAO();
		BoardBean boarddata = new BoardBean();
		int result = 0;
		
		boarddata.setB_NUM(Integer.parseInt(request.getParameter("B_NUM"))); // qna_board_reply.jsp(25줄)
		boarddata.setB_SUB(request.getParameter("B_SUB"));
		boarddata.setB_CONTENT(request.getParameter("B_CONTENT"));
		boarddata.setB_PW(request.getParameter("B_PW"));
		boarddata.setB_ID(request.getParameter("B_ID"));
		boarddata.setB_RE_REF(Integer.parseInt(request.getParameter("B_RE_REF")));
		boarddata.setB_RE_LEV(Integer.parseInt(request.getParameter("B_RE_LEV")));
		boarddata.setB_RE_SEQ(Integer.parseInt(request.getParameter("B_RE_SEQ")));
		
		result = boarddao.boardReply(boarddata); // 답변게시글 작성
		
		if(result == 0) { 
			System.out.println("답변글 작성 실패");
			return null;
		}
			
		System.out.println("답변글 작성 성공");
		
		request.setAttribute("boarddata", boarddata); 
		forward.setRedirect(false);
		forward.setPath("./board/qna_board_view.jsp"); 
		// 답변 게시글 등록하고 바로 게시글 상세보기로 이동
		return forward;
	}

}
