package net.book.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface Action {
	//ActionForward값 리턴(isRedirect, path값 리턴)
		public ActionForward execute(HttpServletRequest request, HttpServletResponse response)throws Exception;

}
