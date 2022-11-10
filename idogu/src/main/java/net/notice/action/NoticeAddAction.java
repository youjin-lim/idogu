package net.notice.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import net.notice.db.NoticeBean;
import net.notice.db.NoticeDAO;

public class NoticeAddAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		NoticeDAO boarddao = new NoticeDAO();
		NoticeBean boarddata = new NoticeBean();
		ActionForward forward = new ActionForward();
		
		String realFolder = "";
		String uploadFolder = "/noticeupload";
		
		int fileSize = 5 * 1024 * 1024;
		
		String saveFolder = request.getSession().getServletContext().getRealPath(uploadFolder);
		
		System.out.println(saveFolder);
		
		boolean result = false;
		
		try {
			MultipartRequest multi = null;
			multi = new MultipartRequest (
					request,
					saveFolder,
					fileSize,
					"UTF-8",
					new DefaultFileRenamePolicy()
			);
			
			boarddata.setM_ID(multi.getParameter("M_ID"));
			boarddata.setN_SUB(multi.getParameter("N_SUB"));
			boarddata.setN_CONTENT(multi.getParameter("N_CONTENT"));
			boarddata.setN_FILE(multi.getFilesystemName((String)multi.getFileNames().nextElement()));
			
			result = boarddao.boardInsert(boarddata);
			
			if (result == false) {
				System.out.println("BoardAddAction 실패");
				return null;
			}
			System.out.println("BoardAddAction 성공");
			
			forward.setRedirect(true);
			forward.setPath("./BoardList.no");
			return forward;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
}