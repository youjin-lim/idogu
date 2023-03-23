package net.book.action;

public class ActionForward {
	//false : forward방식
		//true : isRdeirect방식
		private boolean isRedirect = false;
		private String path = null;
		
		public boolean isRedirect() {
			return isRedirect;
		}
		public void setRedirect(boolean isRedirect) {
			this.isRedirect = isRedirect;
		}
		public String getPath() {
			return path;
		}
		public void setPath(String path) {
			this.path = path;
		}
}
