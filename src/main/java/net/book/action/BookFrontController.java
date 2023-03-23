package net.book.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class BookFrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
	protected void doService(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		System.out.println("doServict()시작");
		String RequestURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		String command = RequestURI.substring(contextPath.length());
		
		ActionForward forward = null;
		Action action = null;
		
	//main.jsp이동
		if(command.equals("/Main.re")) {
			 forward=new ActionForward();
			 forward.setRedirect(false);
			 forward.setPath("./home/main.jsp");
		}
	//main.jsp Reservation 클릭시 
		else if(command.equals("/Book_1.re")) {
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("./book/book_1.jsp");
		}		


		//book_1.jsp 에서 날짜, 강아지 크기 선택 시
		else if(command.equals("/Book_2.re")) {
			action = new Book1_Action();
			try {
				forward = action.execute(request, response);
			}catch(Exception e) {
				e.printStackTrace();
			}
		}

		//book_2.jsp 객실 선택 시
		else if(command.equals("/Book_3.re")) {
			action = new Book2_Action();
			try {
				forward = action.execute(request, response);
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		
		//book_3.jsp 객실 선택 시
		else if(command.equals("/Book_4.re")) {
			action = new Book3_Action();
			try {
				forward = action.execute(request, response);
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		//Book3.jsp
		else if(command.equals("/Book_5.re")) {
		forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("./book/book_4.jsp");
		}
		//나의 예약 정보 확인	
		  else if (command.equals("/BookList.re")) {
		         action = new BooklistAction();
		     
		         
		         try {
		            forward = action.execute(request, response);
		         } catch (Exception e) {
		            e.printStackTrace();
		         }
		         
		      }
		
		     else if (command.equals("/bookdel.re")) {
		           
		         
		          System.out.println(request.getParameter("K_NUM"));
		           
		           action = new BookdelAction();
		           
		           try {
		                  forward = action.execute(request, response);
		               } catch (Exception e) {
		                  e.printStackTrace();
		               }
		           
		        }
		
		     else if (command.equals("/AdminBookList.re")) {
		           System.out.println("관리자 컨트롤러");
		           
		                  action = new AdminBookList();
		           
		           try {
		                  forward = action.execute(request, response);
		               } catch (Exception e) {
		                  e.printStackTrace();
		               }
		           
		           
		        }
		
		if(forward!=null) {
			if(forward.isRedirect()) {
				response.sendRedirect(forward.getPath());
			}else {
				RequestDispatcher dispatcher = request.getRequestDispatcher(forward.getPath());
				dispatcher.forward(request, response);
			}
		}
		
	}
		
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doGet()에서 doService()이동");
		doService(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doPost()에서 doService()이동");
		doService(request, response);
	}

}
