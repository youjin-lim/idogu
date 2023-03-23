package net.notice.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class NoticeFrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;

protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String requestURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		String command = requestURI.substring(contextPath.length());
		
		ActionForward forward = null;
		Action action = null;

		if (command.equals("/BoardWrite.no")) {
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("./notice/notice_write.jsp");
		
			
		// 작성글 - 등록
		} else if (command.equals("/BoardAddAction.no")) {
			action = new NoticeAddAction();
			
			try {
				forward = action.execute(request, response);
			
			} catch (Exception e) {
				e.printStackTrace();
			}
		
			
		// 리스트
		} else if (command.equals("/BoardList.no")) { 
			action = new NoticeListAction();
			  
			try { forward = action.execute(request, response);
			  
			} catch (Exception e) { e.printStackTrace(); }
		
			
		// 작성글 - 내용 보기
		} else if (command.equals("/BoardDetailAction.no")) {
			action = new NoticeDetailAction();

			try { forward = action.execute(request, response);

			} catch (Exception e) { e.printStackTrace(); }
		
		
		// 본문 내용 수정
		} else if (command.equals("/BoardModify.no")) {
			action = new NoticeModifyView();
			
			try { forward = action.execute(request, response);

			} catch (Exception e) { e.printStackTrace(); }

		
		// 본문 내용 수정 액션
		} else if (command.equals("/BoardModifyAction.no")) {
			action = new NoticeModifyAction();
			
			try { forward = action.execute(request, response);
			
			} catch (Exception e) { e.printStackTrace(); }
			
			
		// 작성글 - 삭제
		} else if (command.equals("/BoardDeleteAction.no")) {
			action = new NoticeDeleteAction();

			try { forward = action.execute(request, response);

			} catch (Exception e) { e.printStackTrace(); }

		}
		

		if (forward != null) {
			if (forward.isRedirect()) {
				response.sendRedirect(forward.getPath());
			
			} else {
				RequestDispatcher dispatcher = request.getRequestDispatcher(forward.getPath());
				dispatcher.forward(request, response);
			}
		}
	}
	
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

}