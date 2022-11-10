package net.notice.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class NoticeDAO {

	DataSource ds;
	Connection con;
	PreparedStatement pstmt;
	ResultSet rs;
	
	// dbcp 연결
	public NoticeDAO() {
		try {
			Context init = new InitialContext();
			ds = (DataSource)init.lookup("java:comp/env/jdbc/OracleDB");
		
		} catch (Exception ex) {
			System.out.println("DB 연결 실패: " + ex);
			return;
		}
	}
	
	// 글 등록 / 데이터 입력
	public boolean boardInsert(NoticeBean board) {
		int num = 0;
		String sql = "";
		
		int result = 0;
		
		try {
			con = ds.getConnection();
			
			pstmt = con.prepareStatement("select max(n_num) from notice");
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				num = rs.getInt(1) + 1;
				
			} else {
				num = 1;
			}
			
			sql = "insert into notice (n_num, m_id, n_sub, n_content, n_file, n_readcount, n_date) "
					+ "values (?, ?, ?, ?, ?, ?, default)";
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, num);
			pstmt.setString(2, board.getM_ID());
			pstmt.setString(3, board.getN_SUB());
			pstmt.setString(4, board.getN_CONTENT());
			pstmt.setString(5, board.getN_FILE());
			pstmt.setInt(6, 0);
			
			result = pstmt.executeUpdate();
			if (result == 0)
				return false;
			
			return true;
		
		} catch (Exception ex) {
			System.out.println("DAO boardInsert() 에러: " + ex);
			
		} finally {
			if (rs != null) try { rs.close(); } catch (SQLException ex) {}
			if (pstmt != null) try { pstmt.close(); } catch (SQLException ex) {}
			if (con != null) try { con.close(); } catch (SQLException ex) {}
		}
		return false;
	}

	
	// 리스트 - 글의 개수 구하기
	public int getListCount(String cond) {
		
		int x = 0;

		String sql = "select count(*) from notice";
		
		if (cond != null && !cond.equals("")) {
			sql = sql + " where " + cond;
		}
		
		try {
			con = ds.getConnection();
			System.out.println("getConnection()");
			System.out.println("getListCount(): " + sql);

			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				x = rs.getInt(1);
			}
			
		} catch (Exception ex) {
			System.out.println("DAO getListCount 에러: " + ex);
			
		} finally {
			if (rs != null) try { rs.close(); } catch (SQLException ex) {}
			if (pstmt != null) try { pstmt.close(); } catch (SQLException ex) {}
			if (con != null) try { con.close(); } catch (SQLException ex) {}
		}
		return x;
		
	}

	
	// 리스트 - 글 목록 보기
	public List getBoardList(int page, int limit, String cond) {
		String board_list_sql = "select * from (select rownum rnum, n_num, m_id, n_sub, n_content, n_file, n_readcount, n_date from notice order by n_num DESC) where rnum >= ? and rnum <= ? ";

		String board_list_sql_fmt = "select * from (select rownum rnum, n_num, m_id, n_sub, n_content, n_file, n_readcount, n_date from (select * from notice where %s)) where rnum >= ? and rnum <= ? ";

		if (cond != null && !cond.equals("")) {
			board_list_sql = String.format(board_list_sql_fmt, cond);
		}

		List list = new ArrayList();

		int startrow = (page - 1) * 10 + 1;
		int endrow = startrow + limit - 1;

		try {
			con = ds.getConnection();

			// for debug
			System.out.println("getBoardList(): " + board_list_sql);

			pstmt = con.prepareStatement(board_list_sql);
			pstmt.setInt(1, startrow);
			pstmt.setInt(2, endrow);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				NoticeBean board = new NoticeBean();
				board.setN_NUM(rs.getInt("N_NUM"));
				board.setM_ID(rs.getString("M_ID"));
				board.setN_SUB(rs.getString("N_SUB"));
				board.setN_CONTENT(rs.getString("N_CONTENT"));
				board.setN_FILE(rs.getString("N_FILE"));
				board.setN_READCOUNT(rs.getInt("N_READCOUNT"));
				board.setN_DATE(rs.getDate("N_DATE"));
				list.add(board);
			}
			return list;
			
		} catch (Exception ex) {
			System.out.println("DAO getBoardList() 에러: " + ex);
			System.out.println("DAO getBoardList() 에러: " + board_list_sql);
			
		} finally {
			if (rs != null) try { rs.close(); } catch (SQLException ex) {}
			if (pstmt != null) try { pstmt.close(); } catch (SQLException ex) {}
			if (con != null) try { con.close(); } catch (SQLException ex) {}
		}
		return null;
		
	}
	
	
	// 본문 - 조회수 업데이트
	public void setReadCountUpdate(int num) {
		
		String sql = "update notice set n_readcount = n_readcount + 1 where n_num = ?";

		try {
			con = ds.getConnection();
			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.executeUpdate();

		} catch (Exception ex) {
			System.out.println("DAO setReadCount() 에러: " + ex);
			
		} finally {
			if (rs != null) try { rs.close(); } catch (SQLException ex) {}
			if (pstmt != null) try { pstmt.close(); } catch (SQLException ex) {}
			if (con != null) try { con.close(); } catch (SQLException ex) {}
		}
		
	}

	
	// 본문 - 확인
	public NoticeBean getDetail(int num) {
		
		NoticeBean board = null;

		try {
			con = ds.getConnection();

			pstmt = con.prepareStatement("select * from notice where n_num = ?");
			pstmt.setInt(1, num);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				board = new NoticeBean();

				board.setN_NUM(rs.getInt("N_NUM"));
				board.setM_ID(rs.getString("M_ID"));
				board.setN_SUB(rs.getString("N_SUB"));
				board.setN_CONTENT(rs.getString("N_CONTENT"));
				board.setN_FILE(rs.getString("N_FILE"));
				board.setN_READCOUNT(rs.getInt("N_READCOUNT"));
				board.setN_DATE(rs.getDate("N_DATE"));
			}
			return board;
			
		} catch (Exception ex) {
			System.out.println("DAO getDetail() 에러: " + ex);
			
		} finally {
			if (rs != null) try { rs.close(); } catch (SQLException ex) {}
			if (pstmt != null) try { pstmt.close(); } catch (SQLException ex) {}
			if (con != null) try { con.close(); } catch (SQLException ex) {}
			
		}
		return null;
		
	}

	
	// 본문 - 수정
	public boolean boardModify(NoticeBean modifyBoard) {

		String	sql = "update notice set n_sub = ?, n_content = ? where n_num = ?";
		
		try {
			con = ds.getConnection();
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, modifyBoard.getN_SUB());
			pstmt.setString(2, modifyBoard.getN_CONTENT());
			pstmt.setInt(3, modifyBoard.getN_NUM());
			pstmt.executeUpdate();
			
			return true;
			
		} catch (Exception ex) {
			System.out.println("DAO boardModify() 에러: " + ex);
			
		} finally {
			if (rs != null) try { rs.close(); } catch (SQLException ex) {}
			if (pstmt != null) try { pstmt.close(); } catch (SQLException ex) {}
			if (con != null) try { con.close(); } catch (SQLException ex) {}
			
		}
		return false;
		
   }

	public boolean boardDelete(int num) {
		
		String sql_delete_sql = "delete from notice where n_num = ?";
		int result = 0;
		
		try {
			con = ds.getConnection();
			
			pstmt = con.prepareStatement(sql_delete_sql);
			pstmt.setInt(1, num);
			result = pstmt.executeUpdate();

			if (result == 0)
				return false;
			
			return true;
			
		} catch (Exception ex) {
			System.out.println("DAO boardDelete() 에러: " + ex);
			
		} finally {
			if (pstmt != null) try { pstmt.close(); } catch (SQLException ex) {}
			if (con != null) try { con.close(); } catch (SQLException ex) {}
			
		}
		return false;
		
	}

}