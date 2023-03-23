package net.book.action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.book.db.BookDAO;
// 내정보에서 나의 예약정보확인하기를 누르면 나오는 페이지 
public class BooklistAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		HttpSession session = request.getSession();
		BookDAO bookdao = new BookDAO(); // 쿼리 실행공간 
		List booklist = new ArrayList<>(); // 결과를 담을 공간 
		request.setCharacterEncoding("utf-8");
		
		String id = (String) session.getAttribute("id");
		
	    booklist = bookdao.getbooklist(id);
	    
	    ActionForward forward = new ActionForward();
	    forward.setRedirect(false);
	    forward.setPath("./book/mybooklist.jsp");
		request.setAttribute("booklist", booklist);
		
		return forward;
	}

}

