package net.notice.db;

import java.sql.Date;

public class NoticeBean {

	private int N_NUM;
	private String M_ID;
	private String N_SUB;
	private String N_CONTENT;
	private String N_FILE;
	private int N_READCOUNT;
	private Date N_DATE;
	
	
	public int getN_NUM() {
		return N_NUM;
	}
	public void setN_NUM(int n_NUM) {
		N_NUM = n_NUM;
	}
	public String getM_ID() {
		return M_ID;
	}
	public void setM_ID(String m_ID) {
		M_ID = m_ID;
	}
	public String getN_SUB() {
		return N_SUB;
	}
	public void setN_SUB(String n_SUB) {
		N_SUB = n_SUB;
	}
	public String getN_CONTENT() {
		return N_CONTENT;
	}
	public void setN_CONTENT(String n_CONTENT) {
		N_CONTENT = n_CONTENT;
	}
	public String getN_FILE() {
		return N_FILE;
	}
	public void setN_FILE(String n_FILE) {
		N_FILE = n_FILE;
	}
	public int getN_READCOUNT() {
		return N_READCOUNT;
	}
	public void setN_READCOUNT(int n_READCOUNT) {
		N_READCOUNT = n_READCOUNT;
	}
	public Date getN_DATE() {
		return N_DATE;
	}
	public void setN_DATE(Date n_DATE) {
		N_DATE = n_DATE;
	}
	
}
