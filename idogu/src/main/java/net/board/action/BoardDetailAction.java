package net.board.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.board.db.BoardBean;
import net.board.db.BoardDAO;
import net.board.action.Action;
import net.board.action.ActionForward;

public class BoardDetailAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("utf-8");
		BoardDAO boarddao = new BoardDAO();
		BoardBean boarddata = new BoardBean();
		// 아이디 가져오는 DAO 만들어야함!!. 자기가 쓴 글 자기만 보도록
		
		HttpSession session = request.getSession();
		// 회원들만 볼 수 있도록
		session.setAttribute("id", "1"); // 테스트용
		String id = (String)session.getAttribute("id"); // 변수 id는 로그인한 아이디임
		
		int num = Integer.parseInt(request.getParameter("num"));
		String pww = request.getParameter("pw"); // pww와 pw 두개로 나누어야할까?
		
		String pw = boarddao.isPassword(num);
		// boolean result = boarddao.isWriter(id);
		
		
		
		if(id == null) { // 비회원일때
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('회원가입 후 이용 가능합니다.');");
			out.println("location.href='./BoardList.do';"); // 다시 qna_board_list.jsp로
			out.println("</script>");
			out.close();
			return null;
		} else if(!pww.equals("none") && !id.equals("admin")) { // 로그인한 회원과 게시글 쓴 회원이 다를때 다시!!!!!!!!!!!!
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("var PW = prompt('비밀번호를 입력하세요.');");
			out.println("if(PW != " + pw + ") {alert('비밀번호가 다릅니다.');");
			out.println("location.href='./BoardList.do';"); // 다시 qna_board_list.jsp로
			out.println("}else{");
			out.println("alert('비밀번호가 맞습니다.'); ");
			out.println("location.href='./BoardDetailAction_2.do';");			
			out.println("}");
			out.println("</script>");
			out.close();
			
			session.setAttribute("num", num); // 답변 게시글 숫자
			return null;
			
		} 
		
		// 관리자의 경우나 공개문의글은 여기 아래
		// qna_board_list.jsp 또는 BoardReplyView.java 또는 BoardModifyAction.java에서 넘어온 값
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
