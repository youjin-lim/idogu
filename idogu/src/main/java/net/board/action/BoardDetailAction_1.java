package net.board.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.board.db.BoardBean;
import net.board.db.BoardDAO;
import net.board.action.Action;
import net.board.action.ActionForward;

public class BoardDetailAction_1 implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("utf-8");
		BoardDAO boarddao = new BoardDAO();
		BoardBean boarddata = new BoardBean();
		
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id"); // 로그인할 때 저장된 id
		
		int num = Integer.parseInt(request.getParameter("num")); // 게시글 숫자
		
		String pw = boarddao.isPassword(num); // 해당 게시글의 비밀번호를 가져옴
		
		if(id == null) { // (1) 비회원일때
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('회원가입 후 이용 가능합니다.');");
			out.println("location.href='./BoardList.do';"); // 다시 qna_board_list.jsp로
			out.println("</script>");
			out.close();
			return null;
	    } else if(!pw.equals("none") && !id.equals("admin")) { // (2) 게시글이 비공개이고 관리자가 아닐 때
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("var PW = prompt('비밀번호를 입력하세요.');");
			out.println("if(PW == " + pw + ") { location.href='./BoardDetailAction_2.do';}");
			out.println("else if (PW == null){ location.href='./BoardList.do';}"); // 비밀번호 입력하지 않고 [취소]버튼 눌렀을 때
			out.println("else if( PW != " + pw + ")");
			out.println("{alert('비밀번호가 다릅니다.');");
			out.println("location.href='./BoardList.do';}");
			out.println("</script>");
			out.close();
			
			session.setAttribute("num", num); // 게시글 숫자
			// 비밀번호가 맞을 때, num을 가지고 BoardDetailAction_2.java로 이동
			// 비밀번호 틀렸거나, 취소 버튼 눌렀을 때도 BoardListAction.java로 num 값이 전달되긴함
			// 거기서는 num 세션 값이 필요없으므로 BoardListAction.java에서 num 세션 값 없애주면 됨
			return null;
			
		} 
		
		// (3) 관리자나 공개 문의글의 경우는 아래 코드 실행
		boarddao.setReadCountUpdate(num); // 조회수 1씩 늘리는 메소드
		boarddata = boarddao.getDetail(num); // 해당 게시글 객체를 불러옴
		
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
