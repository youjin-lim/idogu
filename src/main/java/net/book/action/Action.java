package net.book.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface Action {
	//ActionForward�� ����(isRedirect, path�� ����)
		public ActionForward execute(HttpServletRequest request, HttpServletResponse response)throws Exception;

}
