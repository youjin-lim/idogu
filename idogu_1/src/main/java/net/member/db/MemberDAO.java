package net.member.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import net.member.db.MemberBean;

public class MemberDAO {
	
	
	Connection con;
	PreparedStatement pstmt;
	ResultSet rs;
	DataSource ds;
	
	// 생성자로 연결 
	public MemberDAO() {
		
		try {
			Context init = new InitialContext();
			
			ds = (DataSource) init.lookup("java:comp/env/jdbc/OracleDB");
			
			
		} catch (Exception e) {
			System.out.println("DB 연결 실패");
			return;
		}
	
		
	}
	
	
	// 개인 상세 조회 쿼리 
	// 회원 상세보기 (관리자가 회원 상세보기 클릭 했을때 실행)
		public MemberBean getDetailMember(String id) {

			// 클릭한 아이디에 해당하는 맴버의 정보를 가져온다 
			String sql = "select * from mem where m_id=?";

			try {
				con=ds.getConnection();
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, id);
				rs =pstmt.executeQuery();
				rs.next();

				MemberBean mb = new MemberBean();
				mb.setM_ID(rs.getString("M_ID"));
				mb.setM_PW(rs.getString("M_PW"));
				mb.setM_NAME(rs.getString("M_NAME"));
				mb.setM_TEL(rs.getInt("M_TEL"));
				mb.setM_EMAIL(rs.getString("M_EMAIL"));
				return mb;

			} catch (Exception ex) {
				System.out.println("getDetailMember 에러 : "+ex);
			}finally {
				if(rs != null) try {rs.close();} catch(SQLException ex) {}
				if(pstmt != null) try {pstmt.close();} catch(SQLException ex) {}
				if(con != null) try {con.close();} catch(SQLException ex) {}
			}
			
			return null;
		} // 상세보기 끝
		
		
		//회원 개인정보 수정 
		public boolean memberModify(MemberBean modifyMember) throws Exception {

			String sql = "update mem set m_pw = ? , ";
			sql += "m_tel = ?, m_email= ?  where m_id = ? ";

			
			
			try {
				con = ds.getConnection();
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, modifyMember.getM_PW());
				pstmt.setInt(2, modifyMember.getM_TEL());
				pstmt.setString(3, modifyMember.getM_EMAIL());
				pstmt.setString(4, modifyMember.getM_ID());
				pstmt.executeUpdate();

				return true;

			} catch (Exception ex) {
				System.out.println("memberModify 수정 실패 555 : " + ex);
			} finally {

				if (rs != null)
					try {
						rs.close();
					} catch (SQLException e) {
					}
				if (pstmt != null)
					try {
						pstmt.close();
					} catch (SQLException e) {
					}
				if (con != null)
					try {
						con.close();
					} catch (SQLException e) {
					}

			}

			return false;
		} // 끝


		// 회원 삭제 
		public boolean deleteMember(String id) {
			
			String sql = "delete from mem where m_id =?";
			
			int result = 0;
			
			try {
				con = ds.getConnection();
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, id);
				
				result = pstmt.executeUpdate();
				
				if(result != 0) {
					return true;
				}
				
				
				
			} catch (Exception e) {
				System.out.println("dleteMember 에러 : "+e);
			}finally {
				if(rs != null) try {rs.close();} catch(SQLException ex) {}
				if(pstmt != null) try {pstmt.close();} catch(SQLException ex) {}
				if(con != null) try {con.close();} catch(SQLException ex) {}
			}
			
			
			
			return false;
		}





	
	
	
	

}
