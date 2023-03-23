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
				System.out.println("01");
					result = 1; //일치
				}
				else {
					System.out.println("02");
					result = 0; //불일치
				}
			}
			else {
				System.out.println("03");
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
				mb.setM_TEL(rs.getString("M_TEL"));
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
				pstmt.setString(2, modifyMember.getM_TEL());
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


		//아이디 중복 확인
		public int isDuplicateId(String id) {
	
		int result = 0;
		
		try {
			con = ds.getConnection();
			String sql = "SELECT M_ID FROM mem WHERE M_ID=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				result = 0;
			}
			else {
				result = 1;
			}
			pstmt.close();
			con.close();
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	//아이디 찾기
	public String findID(String name, String email) {
		
		//이름과 이메일값을 가지고 아이디값 가져오기
		String sql = "SELECT M_ID FROM mem WHERE M_NAME=? AND M_EMAIL=?";
		String id = "";
		
		System.out.println(name);
		System.out.println(email);
		
		
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, name);
			pstmt.setString(2, email);
			rs = pstmt.executeQuery();
			
			rs.next();
			
			id = rs.getString(1);
			
			System.out.println(id);
		}
		catch(Exception e) {
			System.out.println("findID() 에러 : " + e);
		}
		finally {
			if(rs != null) {try {rs.close();}catch(SQLException e) {}}
			if(pstmt != null) {try {pstmt.close();}catch(SQLException e) {}}
			if(con != null) {try {con.close();}catch(SQLException e) {}}
		}
		return id;
	}

	public String findPW(String id, String name, String email) {

		String sql = "SELECT M_PW FROM mem WHERE M_ID=? AND M_NAME=? AND M_EMAIL=?";
		String pw = "";
		
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, name);
			pstmt.setString(3, email);
			rs = pstmt.executeQuery();
			
			rs.next();
			
			pw = rs.getString("M_PW");
		}
		catch(Exception e) {
			System.out.println("findPW() 에러 : " + e);
		}
		finally {
			if(rs != null) {try {rs.close();}catch(SQLException e) {}}
			if(pstmt != null) {try {pstmt.close();}catch(SQLException e) {}}
			if(con != null) {try {con.close();}catch(SQLException e) {}}
		}
		return pw;
	}
	
public Boolean admin_delete(String id) {
		
		String sql = "delete from mem where m_id = ?";
		int result = 0;
		
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			result = pstmt.executeUpdate();
			
			if (result == 0)
	              return false;

	        return true;

	        } catch (Exception ex) {
	           System.out.println("admin_delete 삭제 실패 : " + ex);
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

//관리자가 회원 list 조회 
public List<MemberBean> getAdminview(int page, int limit) {
   List<MemberBean> memberlist = new ArrayList<>();
   
   String sql = "select m_id, m_name from (select rownum rnum, M_ID, M_NAME from mem) where rnum >= ? and rnum <= ?"; 
   
   int startrow = (page - 1) * 10 + 1;
   int endrow = startrow + limit - 1;
  
   try {
      con = ds.getConnection();
      System.out.println("getAdminview(): " + sql);
      
      pstmt = con.prepareStatement(sql);
      pstmt.setInt(1, startrow);
      pstmt.setInt(2, endrow);
      
      rs = pstmt.executeQuery();

      while (rs.next()) {
         MemberBean member = new MemberBean();

         member.setM_ID(rs.getString(1));
         member.setM_NAME(rs.getString(2));

         memberlist.add(member);
      }

      return memberlist;

   } catch (Exception ex) {
      System.out.println("getAdminview 에러 : " + ex);
   } finally {
      if (rs != null)
         try {
            rs.close();
         } catch (SQLException ex) {
         }
      if (pstmt != null)
         try {
            pstmt.close();
         } catch (SQLException ex) {
         }
      if (con != null)
         try {
            con.close();
         } catch (SQLException ex) {
         }
   }

   return null;

}

public int getListCount() {
	int x = 0;
	
	try {
		con = ds.getConnection();
		pstmt = con.prepareStatement("select count(*) from mem");
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
	
	

}
