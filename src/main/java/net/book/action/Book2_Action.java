package net.book.action;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.book.db.RoomBean;
import net.book.db.RoomDAO;

public class Book2_Action implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		request.setCharacterEncoding("utf-8");
		RoomDAO roomdao = new RoomDAO();
		RoomBean roomdata = new RoomBean();

		HttpSession session = request.getSession();
		//String id =(String)session.getAttribute("id");
		
		//로그인이 되어 있지 않으면 book_1.jsp로 이동
	/*	if(id== null) {
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('로그인 또는 회원가입 후 이용 가능합니다.');");
			out.println("location.href='./Book_1.re';");
			out.println("</script>");
			out.close();
			return null;
		}
*/
		int num = Integer.parseInt(request.getParameter("btn_num"));
		//btn_num에 해당하는 db에 저장된 객체를 불러옴
		roomdata = roomdao.getRoomDetail(num);
		
		if(roomdata == null) {
			System.out.println("Book2_Action() 에러");
			return null;
		}
		
		System.out.println("Book2_Action() 성공");
		
		request.setAttribute("roomdata", roomdata);
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("./book/book_3.jsp");
		
		return forward;
	}

}
