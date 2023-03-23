package net.book.db;

public class RoomBean {
	
	//방 번호
	private int R_NUM;
	//방 이름
	private String R_NAME;
	//방 가격
	private int R_COST;
	//방 추가사항
	private String R_CONTENT;
	//방 갯수
	private int R_COUNT;
	
	public int getR_NUM() {
		return R_NUM;
	}
	public void setR_NUM(int r_NUM) {
		R_NUM = r_NUM;
	}
	public String getR_NAME() {
		return R_NAME;
	}
	public void setR_NAME(String r_NAME) {
		R_NAME = r_NAME;
	}
	public int getR_COST() {
		return R_COST;
	}
	public void setR_COST(int r_COST) {
		R_COST = r_COST;
	}
	public String getR_CONTENT() {
		return R_CONTENT;
	}
	public void setR_CONTENT(String r_CONTENT) {
		R_CONTENT = r_CONTENT;
	}
	public int getR_COUNT() {
		return R_COUNT;
	}
	public void setR_COUNT(int r_COUNT) {
		R_COUNT = r_COUNT;
	}
	
}
