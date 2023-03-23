package net.book.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class RoomDAO {
	Connection con;
	PreparedStatement pstmt;
	ResultSet rs;
	DataSource ds;
	
	public RoomDAO() {
		try {
			Context init = new InitialContext();
			ds = (DataSource)init.lookup("java:comp/env/jdbc/OracleDB");
		}catch(Exception e) {
			System.out.println("DB���� ���� : "+e);
			return;
		}
	}

//Book_1 �� ����Ʈ
	public List<RoomBean> getRoomList() {
		List<RoomBean> list = new ArrayList<RoomBean>();
		String sql="select * from room order by r_num asc";
		
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				RoomBean roomdata = new RoomBean();
				roomdata.setR_NUM(rs.getInt("R_NUM"));
				roomdata.setR_NAME(rs.getString("R_NAME"));
				roomdata.setR_COST(rs.getInt("R_COST"));
				roomdata.setR_CONTENT(rs.getString("R_CONTENT"));
				roomdata.setR_COUNT(rs.getInt("R_COUNT"));
				
				list.add(roomdata);
			}
			return list;
			
		}catch(Exception e) {
			System.out.println("RoomDAO getRoomList() 에러 : "+e);
		}finally {
			if(rs != null) try {rs.close();} catch(SQLException e) {}
		     if(pstmt != null) try {pstmt.close();} catch(SQLException e) {}
		     if(con != null) try {con.close();} catch(SQLException e) {}
		}
		
		return list;
	}

	//Book2_Action에서 방 번호에 따른 정보 불러오기
	public RoomBean getRoomDetail(int num) throws Exception{
		RoomBean room = null;
		
		try {
			
			con = ds.getConnection();
			pstmt = con.prepareStatement("select r_num,r_name, r_cost, r_content from room where r_num=?");
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				room = new RoomBean();
				room.setR_NUM(rs.getInt("R_NUM"));
				room.setR_NAME(rs.getString("R_NAME"));
				room.setR_COST(rs.getInt("R_COST"));
				room.setR_CONTENT(rs.getString("R_CONTENT"));
			}
			return room;
		}catch(Exception e) {
			System.out.println("RoomDAO getRoomDetail() 에러 : "+e);
		}finally {
			if(rs != null) try {rs.close();} catch(SQLException e) {}
		     if(pstmt != null) try {pstmt.close();} catch(SQLException e) {}
		     if(con != null) try {con.close();} catch(SQLException e) {}
		}
		return null;
	}

}