package net.board.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.board.db.BoardBean;
import net.board.db.BoardDAO;
import net.board.action.ActionForward;

public class BoardAddAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		BoardDAO boarddao = new BoardDAO();
		BoardBean boarddata = new BoardBean();
		ActionForward forward = new ActionForward();
		request.setCharacterEncoding("utf-8");
		
		String B_PW = ""; 
		
		if(request.getParameter("B_PW") == null) { // 공개 문의글일때
			B_PW = "none";
		}else {
			B_PW = request.getParameter("B_PW");
		}
		
		boolean result = false;
		
		try {
			boarddata.setB_ID(request.getParameter("B_ID"));
			boarddata.setB_SUB(request.getParameter("B_SUB"));
			boarddata.setB_CONTENT(request.getParameter("B_CONTENT"));
			boarddata.setB_PW(B_PW);
			
			result = boarddao.boardInsert(boarddata);
			
			if(result == false) {
				System.out.println("게시판 등록 실패");
				return null;
			}
			
			System.out.println("게시판 등록 완료");
			
			forward.setRedirect(true);
			forward.setPath("./BoardList.do");
			return forward;		
					
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}


}
