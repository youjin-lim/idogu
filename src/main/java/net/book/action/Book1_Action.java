package net.book.action;

import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.book.db.RoomBean;
import net.book.db.RoomDAO;

public class Book1_Action implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		HttpSession session = request.getSession();
		ActionForward forward = new ActionForward();
		RoomDAO roomdao = new RoomDAO();
		RoomBean roomdata = new RoomBean();
		
		String id =(String )session.getAttribute("id");
		
		if(id == null) { // (1) 비회원일때
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('회원가입 후 이용 가능합니다.');");
			out.println("location.href='./MemberLogin.me';"); // 다시 qna_board_list.jsp로
			out.println("</script>");
			out.close();
			return null;
		}
		
		String K_IN = request.getParameter("K_IN");
		String K_OUT = request.getParameter("K_OUT");
		int K_SMALL = Integer.parseInt(request.getParameter("K_SMALL"));
		int K_MEDIUM = Integer.parseInt(request.getParameter("K_MEDIUM"));
		int K_BIG = Integer.parseInt(request.getParameter("K_BIG"));
		
		String str ="yyyy-MM-dd";
		SimpleDateFormat sdf = new SimpleDateFormat(str);
		
		long K_NOD = 0;
		try {
			Date k_in = sdf.parse(K_IN);
			Date k_out = sdf.parse(K_OUT);
			
			K_NOD = (k_out.getTime() - k_in.getTime()) / (24*60*60*1000);
			
		}catch(ParseException e) {
			System.out.println("Book_1.java 에러 : "+e);
		}
		
		session.setAttribute("K_IN", K_IN);
		session.setAttribute("K_OUT", K_OUT);
		session.setAttribute("K_NOD", K_NOD);
		session.setAttribute("K_SMALL", K_SMALL);
		session.setAttribute("K_MEDIUM", K_MEDIUM);
		session.setAttribute("K_BIG", K_BIG);
		
		List list = roomdao.getRoomList();
		
		request.setAttribute("roomList", list);
		forward.setRedirect(false);
		forward.setPath("./book/book_2.jsp");
		return forward;
	}

}
