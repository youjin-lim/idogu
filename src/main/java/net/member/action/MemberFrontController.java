package net.member.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.plaf.synth.SynthOptionPaneUI;
import javax.websocket.Session;

public class MemberFrontController extends HttpServlet implements javax.servlet.Servlet {
	private static final long serialVersionUID = 1L;

	protected void doProcess(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		System.out.println("member");
		String RequestURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		String command = RequestURI.substring(contextPath.length());
		ActionForward forward = null;
		Action action = null;
		
		if(command.equals("/MemberLogin.me")) { //MemberLogin.me가 들어오면 loginform.jsp를 실행 
			
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("./member/loginform.jsp");
		}

		else if(command.equals("/MemberJoin.me")) { //MemberJoin.me가 들어오면 joinform.jsp 실행
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("./member/joinform.jsp");
		}
		
		else if(command.equals("/MemberAgree.me")) {
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("./member/agreeform.jsp");
		}
		
		else if(command.equals("/MemberLoginAction.me")) {
			System.out.println("액션");
			action = new MemberLoginAction();
			try {
				forward = action.execute(request, response);
			}
			catch(Exception e) {
				e.printStackTrace();
			}
		}

		
		else if(command.equals("/MemberLogoutAction.me")) {
			action = new MemberLogoutAction();
			try {
				forward = action.execute(request, response);
			}
			catch(Exception e) {
				e.printStackTrace();
			}
		}
		
		
		else if(command.equals("/MemberJoinAction.me")) {
			action = new MemberJoinAction();
			try {
				forward = action.execute(request, response);
			}
			catch(Exception e) {
				e.printStackTrace();
			}
		}

		else if(command.equals("/MemberListAction.me")) {
			action = new MemberListAction();
			try {
				forward = action.execute(request, response);
			}
			catch(Exception e) {
				e.printStackTrace();
			}
		}

		// 회원 상세 정보 조회
		else if (command.equals("/MemberViewAction.me")) {

			
			action = new MemberViewAction(); // memberform.jsp로 가는 경로 설정해 준다.
			try {
				forward = action.execute(request, response);

			} catch (Exception e) {
				e.printStackTrace();
			}

		}

		// 회원이 회원 정보 수정을 눌렀을때 실행
		else if (command.equals("/MemberModify.me")) {
		
			
			action = new MemberModify();
			try {
				forward = action.execute(request, response);
				System.out.println("다시돌아옴");
				System.out.println(forward.getPath());
			} catch (Exception e) {
				e.printStackTrace();
			}

		}
		
		
		//수정 완료 클릭시 
		else if (command.equals("/MemberModifyAction.me")) {
			
			action = new MemberModifyAction();
			try {
				forward = action.execute(request, response);

				System.out.println("수정완료쿼리쿼리");
			} catch (Exception e) {
				e.printStackTrace();
			}

		}
		
		
		

		// 회원 탈퇴
		else if (command.equals("/MemberDelete.me")) {
			System.out.println("회원 탈퇴 controll");
			action = new MemberDeleteAction();
			try {
				forward = action.execute(request, response);

			} catch (Exception e) {
				e.printStackTrace();
			}

			// 해야할일 : 세션삭제, 탈퇴되었다고 메세지 날리기

		}
		
		else if(command.equals("/FindID.me")) {
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("./member/findid.jsp");
		}
		
		else if(command.equals("/FindPW.me")) {
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("./member/findpw.jsp");
		}
		
		
		else if(command.equals("/FindIDAction.me")) {
			action = new FindIDAction();
			try {
				forward = action.execute(request, response);
			}
			catch(Exception e) {
				e.printStackTrace();
			}
		}

		else if(command.equals("/FindPWAction.me")) {
			action = new FindPWAction();
			try {
				forward = action.execute(request, response);
			}
			catch(Exception e) {
				e.printStackTrace();
			}
		}
		
		   else if (command.equals("/adminview.me")) {
		         action = new adminviewAction();
		         try {
		            forward = action.execute(request, response);

		            System.out.println("관리자용 페이지 ");
		         } catch (Exception e) {
		            e.printStackTrace();
		         }
		         
		         
		      }
		
		   else if (command.equals("/AdminDeleteAction.me")) {
		         action = new AdminDeleteAction();
		         try {
		            forward = action.execute(request, response);

		         } catch (Exception e) {
		            e.printStackTrace();
		         }
		         
		         
		   }
		
		   else if (command.equals("/Info.me")) {
			   forward = new ActionForward();
			   forward.setRedirect(false);
			   forward.setPath("./home/info.jsp");
		         
		         
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

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doProcess(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doProcess(request, response);
	}

}
