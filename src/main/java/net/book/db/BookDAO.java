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

public class BookDAO {
	Connection con;
	PreparedStatement pstmt;
	ResultSet rs;
	DataSource ds;
	
	public BookDAO() {
		try {
			Context init = new InitialContext();
			ds = (DataSource)init.lookup("java:comp/env/jdbc/OracleDB");
		}catch(Exception e) {
			System.out.println("DB연결 오류 : "+e);
			return;
		}
	}
	
//예약추가하는 메서드
	public int  bookInsert(BookBean bookdata) {
		int num =0;
		String sql ="";
		int result =0;
		 
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement("select max(k_num) from book");
			rs = pstmt.executeQuery();
			
			if(rs.next()) 
				num = rs.getInt(1)+	1;//k_num값이 1씩 증가됨
			else
				num =1;
			sql ="insert into book(k_num, r_num, k_in, k_out, k_dog, k_dogname, "
		               + "k_age, k_kg, k_small,k_medium, k_big, k_total,k_course, k_content,m_id)"
		               + " values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		      
		         pstmt = con.prepareStatement(sql);
		         pstmt.setInt(1,num);
		         pstmt.setInt(2, bookdata.getR_NUM());
		         pstmt.setString(3,bookdata.getK_IN());
		         pstmt.setString(4,bookdata.getK_OUT());
		         pstmt.setString(5,bookdata.getK_DOG());
		         pstmt.setString(6,bookdata.getK_DOGNAME());
		         pstmt.setString(7,bookdata.getK_AGE());
		         pstmt.setInt(8,bookdata.getK_KG());
		         pstmt.setInt(9,bookdata.getK_SMALL());
		         pstmt.setInt(10,bookdata.getK_MEDIUM());
		         pstmt.setInt(11,bookdata.getK_BIG());
		         pstmt.setInt(12,bookdata.getK_TOTAL());
		         pstmt.setString(13, bookdata.getK_COURSE());
		         pstmt.setString(14, bookdata.getK_CONTENT());
		         pstmt.setString(15 , bookdata.getM_ID());
		         System.out.println(sql);
		         System.out.println(pstmt);
		         result = pstmt.executeUpdate();
			
		
			if(result == 1) 
				return result;
		}catch(Exception e) {
			System.out.println("BookDAO 에러"+e);
		}finally {
			if(rs != null) try {rs.close();} catch(SQLException e) {}
			if(pstmt != null) try {pstmt.close();} catch(SQLException e) {}
			if(con != null) try {con.close();} catch(SQLException e) {}
		}
		
		return result;
	}
	

	   // 나의 예약 정보 조회 
	   public List getbooklist(String id) {

	      List<BookBean> booklist = new ArrayList<>();
	      
	      String sql = "select * from book where m_id = ?";
	      try {
	         con = ds.getConnection();
	         pstmt = con.prepareStatement(sql);
	         pstmt.setString(1, id);
	         rs = pstmt.executeQuery();
	         
	         while(rs.next()) {
	            
	            BookBean book = new BookBean();
	             
	            book.setK_TOTAL(rs.getInt("K_TOTAL"));
	            book.setK_DOG(rs.getString("K_DOG"));
	            book.setR_NUM(rs.getInt("R_NUM"));
	             book.setK_IN(rs.getString("K_IN"));
	             book.setK_OUT(rs.getString("K_OUT"));
	             book.setK_DOGNAME(rs.getString("K_DOGNAME"));
	             book.setK_AGE(rs.getString("K_AGE"));
	             book.setK_KG(rs.getInt("K_KG"));
	             book.setK_COURSE(rs.getString("K_COURSE"));
	            book.setK_CONTENT(rs.getString("K_CONTENT"));
	            book.setK_NUM(rs.getInt("K_NUM"));
	            
	            booklist.add(book);
	            
	            
	         }
	         
	         return booklist;
	         
	         
	         
	         
	      } catch (Exception e) {
	         
	         System.out.println("getbooklist() 에러 : " + e) ;
	         
	         
	      } finally {
	         try {
	            if (rs != null)
	               rs.close();

	            if (pstmt != null)
	               pstmt.close();
	            if (con != null)
	               con.close();
	         } catch (Exception e) {
	            e.printStackTrace();
	         }
	      }
	      
	      return null;
	   }

	   public int bookdel(int k_NUM) {
		      
		      String sql = "delete from book where k_num = ? ";
		      
		       try {
		          int result = 0;
		          con = ds.getConnection();
		            pstmt = con.prepareStatement(sql);
		            pstmt.setInt(1, k_NUM);
		            result = pstmt.executeUpdate();
		            return result ; 
		            
		            
		      } catch (Exception e) {
		         System.out.println("BookDAO_bookdel 에러"+e);
		      }finally {
		          try {
		                  if (rs != null)
		                     rs.close();

		                  if (pstmt != null)
		                     pstmt.close();
		                  if (con != null)
		                     con.close();
		               } catch (Exception e) {
		                  e.printStackTrace();
		               }
		         
		      }
		      
		      
		      return 0;
		   }

	   public List getAllbooklist() {
	         List<BookBean> booklist = new ArrayList<>();
	            System.out.println("dao admin");
	            String sql = "select * from book ";
	            try {
	               con = ds.getConnection();
	               pstmt = con.prepareStatement(sql);
	               rs = pstmt.executeQuery();
	               
	               while(rs.next()) {
	                  
	                  BookBean book = new BookBean();
	                   
	                  book.setK_TOTAL(rs.getInt("K_TOTAL"));
	                 
	                  book.setK_DOG(rs.getString("K_DOG"));
	                  book.setR_NUM(rs.getInt("R_NUM"));
	                   book.setK_IN(rs.getString("K_IN"));
	                   book.setK_OUT(rs.getString("K_OUT"));
	                   book.setK_DOGNAME(rs.getString("K_DOGNAME"));
	                   book.setK_AGE(rs.getString("K_AGE"));
	                   book.setK_KG(rs.getInt("K_KG"));
	                   book.setK_COURSE(rs.getString("K_COURSE"));
	                  book.setK_CONTENT(rs.getString("K_CONTENT"));
	                  book.setK_NUM(rs.getInt("K_NUM"));
	                  book.setM_ID(rs.getString("M_ID"));
	                  booklist.add(book);
	                  
	                  
	               }
	               
	               return booklist;
	               
	               
	               
	               
	            } catch (Exception e) {
	               
	               System.out.println("getbooklist() 에러 : " + e) ;
	               
	               
	            } finally {
	               try {
	                  if (rs != null)
	                     rs.close();

	                  if (pstmt != null)
	                     pstmt.close();
	                  if (con != null)
	                     con.close();
	               } catch (Exception e) {
	                  e.printStackTrace();
	               }
	            }
	            
	            return null;
	   }
	
	//1.
	
	
}
