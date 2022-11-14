package net.board.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.board.db.BoardBean;
import net.board.db.BoardDAO;
import net.board.action.Action;
import net.board.action.ActionForward;

public class BoardDetailAction_2 implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("utf-8");
		BoardDAO boarddao = new BoardDAO();
		BoardBean boarddata = new BoardBean();
		
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id"); 
		
		int num = (int)session.getAttribute("num");
		
			boarddao.setReadCountUpdate(num); // 조회수 1 늘리는 메소드
			boarddata = boarddao.getDetail(num); // num에 해당하는 게시글 객체를 불러옴. boarddata에 게시글 하나 저장됨
			
			if(boarddata == null) {
				System.out.println("상세보기 실패");
				return null;
			}
			
			System.out.println("상세보기 성공");
			
			request.setAttribute("boarddata", boarddata); 
			ActionForward forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("./board/qna_board_view.jsp");
			
			return forward;
			
			
		} 
		
}