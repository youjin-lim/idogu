package net.member.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

//connection pool 부분
public class MemberDAO {
	
	Connection con;
	PreparedStatement pstmt;
	ResultSet rs;
	DataSource ds;
	
	//생성자
	public MemberDAO() {
		try {
			Context init = new InitialContext();
			ds = (DataSource) init.lookup("java:comp/env/jdbc/OracleDB");
		}
		catch(Exception e) {
			System.out.println("DB 연결 실패 : " + e);
		}
		return;
	}
	
	//회원 확인
	public int isMember(MemberBean member) {
		
		String sql = "SELECT M_PW FROM mem WHERE M_ID=?";
		int result = -1;
		
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, member.getM_ID());
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				if(rs.getString("M_PW").equals(member.getM_PW())) {
					result = 1; //일치
				}
				else {
					result = 0; //불일치
				}
			}
			else {
				result = -1; //아이디 존재하지 않음
			}
		}
		catch(Exception e) {
			System.out.println("isMember()에러 : " + e);
		}
		finally {
			if(rs != null) {try {rs.close();}catch(SQLException e) {}}
			if(pstmt != null) {try {pstmt.close();}catch(SQLException e) {}}
			if(con != null) {try {con.close();}catch(SQLException e) {}}
		}
		return result;
	}
	
	//회원가입 메소드
	public boolean joinMember(MemberBean member) {

		String sql = "INSERT INTO mem VALUES(?, ?, ?, ?, ?)";
		int result = 0;
		
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, member.getM_ID());
			pstmt.setString(2, member.getM_PW());
			pstmt.setString(3, member.getM_NAME());
			pstmt.setString(4, member.getM_TEL());
			pstmt.setString(5, member.getM_EMAIL());
			
			result = pstmt.executeUpdate();
			
			if(result != 0) {
				return true; 
			}
		}
		catch(Exception e) {
			System.out.println("joinMember() 에러 : " + e);
		}
		finally {
			if(pstmt != null) { try {pstmt.close(); }catch(SQLException e) {}}
			if(con != null) { try {con.close(); }catch(SQLException e) {}}
		}
		return false;
	}
	
	
	//회원 목록, 게시판에 글을 쓰지 않아도 회원 목록에 보이도록 만듦
	public List getMemberList() {
		
		String sql = "SELECT DISTINCT M_ID, M_PW, M_NAME, M_TEL, M_EMAIL "
				+ "FROM mem m LEFT OUTER JOIN board b ON (m.M_ID = b.B_ID)";
			
		List memberlist = new ArrayList();
		
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				MemberBean mb = new MemberBean();
				mb.setM_ID(rs.getString("M_ID"));
				mb.setM_PW(rs.getString("M_PW"));
				mb.setM_NAME(rs.getString("M_NAME"));
				mb.setM_TEL(rs.getString("M_TEL"));
				mb.setM_EMAIL(rs.getString("M_EMAIL"));
				
				memberlist.add(mb);
			}
			
			return memberlist;
		}
		catch(Exception e) {
			System.out.println("getListMember() 에러 : " + e);
		}
		finally {
			if(rs != null) {try {rs.close();}catch(SQLException e) {}}
			if(pstmt != null) {try {pstmt.close();}catch(SQLException e) {}}
			if(con != null) {try {con.close();}catch(SQLException e) {}}
		}
		
		return null;
	}
	
	//회원 정보 보기
	public MemberBean getDetailMember(String viewId) {
		
		String sql = "SELECT * FROM mem WHERE M_ID=?";
		
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, viewId);
			rs = pstmt.executeQuery();
			
			rs.next();
			
			MemberBean mb = new MemberBean();
			
			mb.setM_ID(rs.getString("M_ID"));
			mb.setM_PW(rs.getString("M_PW"));
			mb.setM_NAME(rs.getString("M_NAME"));
			mb.setM_TEL(rs.getString("M_TEL"));
			mb.setM_EMAIL(rs.getString("M_EMAIL"));
			
			return mb;
		}
		catch(Exception e) {
			System.out.println("getDetailMember() 에러 : " + e);
		}
		finally {
			if(rs != null) {try {rs.close();} catch(SQLException e) {}}
			if(pstmt != null) {try {pstmt.close();} catch(SQLException e) {}}
			if(con != null) {try {con.close();} catch(SQLException e) {}}
		}
		return null;
	}
	
	
	//회원 삭제
	public boolean deleteMember(String deleteId) {

		String sql = "DELETE FROM mem WHERE M_ID=?";
		int result = 0;
		
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, deleteId);
			result = pstmt.executeUpdate();
			
			if(result != 0) {
				return true;
			}
		}
		catch(Exception e) {
			System.out.println("deleteMember() 에러 : " + e);
		}
		finally {
			if(rs != null) {try {rs.close();}catch(SQLException e) {}}
			if(pstmt != null) {try {pstmt.close();}catch(SQLException e) {}}
			if(con != null) {try {con.close();}catch(SQLException e) {}}
		}
		return false;
	}
	
	
}
