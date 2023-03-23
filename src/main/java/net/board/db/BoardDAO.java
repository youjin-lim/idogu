package net.board.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class BoardDAO {
	
	Connection con;
	PreparedStatement pstmt;
	ResultSet rs;
	DataSource ds;
	
	public BoardDAO() { // 생성자
		try {
			Context init = new InitialContext();
			ds =(DataSource)init.lookup("java:comp/env/jdbc/OracleDB");
		}catch(Exception e) {
			System.out.println("DB 연결에 실패했습니다. " + e);
			return;
		}
	}
	
	// 게시글 총 개수 반환하는 메소드
	public int getListCount() {
		int x = 0;
		
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement("select count(*) from board");
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				x = rs.getInt(1);
			}
			
		}catch(Exception e) {
			System.out.println("getListCount 실패 : " + e);
		}finally {
			if(rs != null) try {rs.close();} catch(SQLException e) {}
			if(pstmt != null) try {pstmt.close();} catch(SQLException e) {}
			if(con != null) try {con.close();} catch(SQLException e) {}
		}
		
		return x;
	} 

	
	// 게시글 추가하는 메소드
	public boolean boardInsert(BoardBean board) {
		int num = 0;
		String sql = "";
		int result = 0;
		
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement("select max(b_num) from board");
			rs = pstmt.executeQuery();
			
			if(rs.next())
				num = rs.getInt(1) + 1; // 게시글들의 board_num 값이 1씩 증가됨
			else
				num = 1;
			
			sql = "insert into board (b_num, b_sub, b_content, b_date, b_readcount, b_pw, b_id, b_re_ref, b_re_lev, b_re_seq) "
					+ " values(?, ?, ?, sysdate, ?, ?, ?, ?, ?, ?)";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.setString(2, board.getB_SUB());
			pstmt.setString(3, board.getB_CONTENT());
			pstmt.setInt(4, 0);
			pstmt.setString(5, board.getB_PW());
			pstmt.setString(6, board.getB_ID());
			pstmt.setInt(7, num);
			pstmt.setInt(8, 0);
			pstmt.setInt(9, 0);
			
			result = pstmt.executeUpdate();
			if(result == 0) {
				return false;
			}
			
			return true;
			
		}catch (Exception e) {
			System.out.println("boardInsert 등록 실패: 333" + e);
		}finally {
			if(rs != null) try {rs.close();} catch(SQLException e) {}
			if(pstmt != null) try {pstmt.close();} catch(SQLException e) {}
			if(con != null) try {con.close();} catch(SQLException e) {}
		}
		
		return false;
	} 
	
	// 조회수 늘리는 메소드(글 내용 확인하는 순간 호출된다.)
	public void setReadCountUpdate(int num) throws Exception{
		String sql = "update board set b_readcount = "
				+ "b_readcount + 1 where b_num = " + num;
		
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.executeUpdate();
			
		}catch(SQLException e) {
			System.out.println("setReadCountUpdate 글 읽은 개수 수정 실패: " + e);
		}finally {
			try {
				if(pstmt != null) try {pstmt.close();} catch(SQLException e) {}
				if(con != null) try {con.close();} catch(SQLException e) {}
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
	}
	
	// num에 해당하는 게시글 객체를 반환하는 메소드
	public BoardBean getDetail(int num) throws Exception{
		BoardBean board = null;
		
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement("select * from board where b_num = ?");
			pstmt.setInt(1, num);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				board = new BoardBean();
				board.setB_NUM(rs.getInt("B_NUM"));
				board.setB_SUB(rs.getString("B_SUB"));
				board.setB_CONTENT(rs.getString("B_CONTENT"));
				board.setB_DATE(rs.getDate("B_DATE"));
				board.setB_READCOUNT(rs.getInt("B_READCOUNT"));
				board.setB_PW(rs.getString("B_PW"));
				board.setB_ID(rs.getString("B_ID"));
				board.setB_RE_REF(rs.getInt("B_RE_REF"));
				board.setB_RE_LEV(rs.getInt("B_RE_LEV"));
				board.setB_RE_SEQ(rs.getInt("B_RE_SEQ"));
			}
			return board;
		}catch(Exception e) {
			System.out.println("getDetail 내용보기 실패: " + e);
		}finally {
			if(rs != null) try {rs.close();} catch(SQLException e) {}
			if(pstmt != null) try {pstmt.close();} catch(SQLException e) {}
			if(con != null) try {con.close();} catch(SQLException e) {}
		}
		return null;
		
	}
	
	// 답변게시글 다는 메소드
	public int boardReply(BoardBean board) {
		String board_max_sql = "select max(b_num) from board";
		String sql = "";
		int num = 0;
		int result = 0;
				
		int re_ref = board.getB_RE_REF(); // 원본글 번호
		int re_lev = board.getB_RE_LEV(); // 답변글 깊이
		int re_seq = board.getB_RE_SEQ(); // 답변글 순서
			
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(board_max_sql);
			rs = pstmt.executeQuery();
			if(rs.next()) num = rs.getInt(1) + 1;
			else num = 1;
				
			sql = "update board set b_re_seq = b_re_seq + 1 ";
			sql += "where b_re_ref = ? and b_re_seq > ?";
				
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, re_ref);
			pstmt.setInt(2, re_seq);
			result = pstmt.executeUpdate();
			
			re_seq = re_seq + 1;
			re_lev = re_lev + 1;
				
			sql = "insert into board (b_num, b_sub, b_content, b_date, b_readcount, b_pw, b_id, b_re_ref, b_re_lev, b_re_seq) "
					+ "values(?, ?, ?, sysdate, ?, ?, ?, ?, ?, ?)";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.setString(2, board.getB_SUB());
			pstmt.setString(3, board.getB_CONTENT());
			pstmt.setInt(4, 0); // 조회수
			pstmt.setString(5, board.getB_PW());
			pstmt.setString(6, board.getB_ID());
			pstmt.setInt(7, re_ref);
			pstmt.setInt(8, re_lev);
			pstmt.setInt(9, re_seq);
			pstmt.executeUpdate();
				
			return num; // 추가한 답변게시글의 num(번호)을 리턴
		}catch(SQLException e) {
			System.out.println("boardReply 답변 실패 : " + e);
		}finally {
			if(rs != null) try {rs.close();} catch(SQLException e) {}
			if(pstmt != null) try {pstmt.close();} catch(SQLException e) {}
			if(con != null) try {con.close();} catch(SQLException e) {}
		}
			
		return 0; // 답변 게시글을 추가하지 못했다면 0을 리턴
	}

	// 비공개 게시글 비밀번호를 확인하는 메소드
	public String isPassword(int num) {
		String x = "";
		
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement("select B_PW from board where B_NUM = ?");
			pstmt.setInt(1, num);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) { 
				x = rs.getString(1); // x에 비밀번호 담김
			}
			
			return x; 
			
		}catch(Exception e) {
			System.out.println("isPassword 상세보기 비밀번호 실패: " + e);
		}finally {
			if(rs != null) try {rs.close();} catch(SQLException e) {}
			if(pstmt != null) try {pstmt.close();} catch(SQLException e) {}
			if(con != null) try {con.close();} catch(SQLException e) {}
		}
		return x;
		
	}

	// 게시글(답변게시글 포함) 수정하는 메소드
	public boolean boardModify(BoardBean board) {
		String sql = "update board set b_sub = ?, ";
		sql += "b_content = ?, b_pw = ? where b_num = ?";
			
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, board.getB_SUB());
			pstmt.setString(2, board.getB_CONTENT());
			pstmt.setString(3, board.getB_PW());
			pstmt.setInt(4, board.getB_NUM());
			pstmt.executeUpdate();
			return true;
		}catch(Exception e) {
			System.out.println("boardModify 수정 실패 : " + e);
		}finally {
			if(rs != null) try {rs.close();} catch(SQLException e) {}
			if(pstmt != null) try {pstmt.close();} catch(SQLException e) {}
			if(con != null) try {con.close();} catch(SQLException e) {}
		}
		return false;
	}

	// 게시글 삭제 메소드
	
        public boolean boardDelete(int num, int re_ref) {

		String sql = "";
		
		if(num == re_ref) { // 원글 삭제하면 답변글까지 삭제
			sql += "delete from board where b_re_ref = ?";
		}else{ // 답변글만 삭제
			sql += "delete from board where b_num = ?"; 
		}
		
        int result = 0;

        try {
           con = ds.getConnection();
           pstmt = con.prepareStatement(sql);
           pstmt.setInt(1, num);
           result = pstmt.executeUpdate();

           if (result == 0)
              return false;

           return true;

        } catch (Exception ex) {
           System.out.println("boardDelete 삭제 실패 666 : " + ex);
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
	}

	// 게시글 최대 10개 반환하는 메소드
	public List<BoardBean> getBoardList(int page, int limit, String cond){
		String board_list_sql = "select * from "
				+ "(select rownum rnum, b_num, b_sub, b_content, b_date, b_readcount, b_pw, b_id, "
				+ "b_re_ref, b_re_lev, b_re_seq "
				+ "from (select * from board order by b_re_ref desc, b_re_seq asc)) "
				+ "where rnum >= ? and rnum <= ?";
		
		String board_list_sql_fmt = "select * from "
				+ "(select rownum rnum, b_num, b_sub, b_content, b_date, b_readcount, b_pw, b_id, "
				+ "b_re_ref, b_re_lev, b_re_seq "
				+ " from (select * from board where %s order by b_re_ref desc, b_re_seq asc)) "
				+ " where rnum >= ? and rnum <= ? ";
		
		if(cond != null && !cond.equals("")) { // 만약 검색어를 입력했을 때는
			board_list_sql = String.format(board_list_sql_fmt, cond);			
			// String.format(String, Object): 문자열에 있는 하나 이상의 형식 항목을 지정된 개체의 문자열 표현으로 바꾼다.
			// 서식 문자열의 앞에 %를 붙여 문자열에 사용하면 그 위치에 변수의 값을 형식화하여 대입 가능하다.
		}
		
		List<BoardBean> list = new ArrayList<BoardBean>(); // 게시글들 저장할 List 생성
		
		int startrow = (page - 1) * 10 + 1; // 읽기 시작할 row 번호
		// ex) qna_board_list.java에서 [2]을 눌렀으면 변수 page에 2가 저장
		// ex) page가 2라면([2]) 변수 startrow에는 (2-1)*10+1=11이 저장됨
		int endrow = startrow + limit - 1; // 읽을 마지막 row 번호
		// ex) startrow가 11이라면 limit는 10(고정)이기때문에 변수 endrow에는 11+10-1=20가 저장됨
		
		try {
			con = ds.getConnection();
			
			System.out.println("getBoardList(): " + board_list_sql);
			
			pstmt = con.prepareStatement(board_list_sql);
			pstmt.setInt(1, startrow); 
			pstmt.setInt(2, endrow);
			// 쿼리문 where rnum >= ? and rnum <= ? 부분에
			// ex) where rnum >= 11 and rnum <= 20      => 10개만 출력함
			
			rs = pstmt.executeQuery(); // 10개행(게시글)을 rs에 담음
			
			while(rs.next()) { // 10번 반복
				BoardBean board = new BoardBean();
				board.setB_NUM(rs.getInt("B_NUM"));
				board.setB_SUB(rs.getString("B_SUB"));
				board.setB_CONTENT(rs.getString("B_CONTENT"));
				board.setB_DATE(rs.getDate("B_DATE"));
				board.setB_READCOUNT(rs.getInt("B_READCOUNT"));
				board.setB_PW(rs.getString("B_PW"));
				board.setB_ID(rs.getString("B_ID"));
				board.setB_RE_REF(rs.getInt("B_RE_REF"));
				board.setB_RE_LEV(rs.getInt("B_RE_LEV"));
				board.setB_RE_SEQ(rs.getInt("B_RE_SEQ"));
				list.add(board);
				// 위에서 만든 List에 게시글 각각 저장(인덱스 9까지 있음)
				
			}
			
			return list; // 게시글 10개 저장한 List 반환
		}catch(Exception e) {
			System.out.println("getBoardList() 에러: " + e);
			System.out.println("getBoardList() 에러: " + board_list_sql);
		}finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(con != null) con.close();
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		return list;
		
	}
	
	
	
}

