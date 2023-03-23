package net.board.db;

import java.sql.Date;

public class BoardBean {

	private int B_NUM;
	private String B_SUB;
	private String B_CONTENT;
	private Date B_DATE;
	private int B_READCOUNT;
	private String B_PW;
	private String B_ID; // 이건 외래키인데 b로 해야하나 m으로 해야하나
	private int B_RE_REF;
	private int B_RE_LEV;
	private int B_RE_SEQ;
	
	public int getB_NUM() {
		return B_NUM;
	}
	public void setB_NUM(int b_NUM) {
		B_NUM = b_NUM;
	}
	public String getB_SUB() {
		return B_SUB;
	}
	public void setB_SUB(String b_SUB) {
		B_SUB = b_SUB;
	}
	public String getB_CONTENT() {
		return B_CONTENT;
	}
	public void setB_CONTENT(String b_CONTENT) {
		B_CONTENT = b_CONTENT;
	}
	public Date getB_DATE() {
		return B_DATE;
	}
	public void setB_DATE(Date b_DATE) {
		B_DATE = b_DATE;
	}
	public int getB_READCOUNT() {
		return B_READCOUNT;
	}
	public void setB_READCOUNT(int b_READCOUNT) {
		B_READCOUNT = b_READCOUNT;
	}
	public int getB_RE_REF() {
		return B_RE_REF;
	}
	public void setB_RE_REF(int b_RE_REF) {
		B_RE_REF = b_RE_REF;
	}
	public int getB_RE_LEV() {
		return B_RE_LEV;
	}
	public void setB_RE_LEV(int b_RE_LEV) {
		B_RE_LEV = b_RE_LEV;
	}
	public int getB_RE_SEQ() {
		return B_RE_SEQ;
	}
	public void setB_RE_SEQ(int b_RE_SEQ) {
		B_RE_SEQ = b_RE_SEQ;
	}
	public String getB_ID() {
		return B_ID;
	}
	public void setB_ID(String b_ID) {
		B_ID = b_ID;
	}
	
	public String getB_PW() {
		return B_PW;
	}
	public void setB_PW(String b_PW) {
		B_PW = b_PW;
	}
	
	
	
}