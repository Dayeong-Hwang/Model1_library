package book;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import static db.JdbcUtil.*;


public class BookDAO {

	Connection con;
	PreparedStatement pstmt;
	PreparedStatement pstmt2;
	ResultSet rs;
	
	//검색 결과에 해당하는 자료 내역 출력
	
	public ArrayList<BookBean> searchList(String bookname, String num, String name,String publisher){
		ArrayList<BookBean> bookSearchList =null;
	 		
		try {
			con = getConnection();

				String sql = "SELECT * FROM book WHERE bookname like ? OR num like ? OR name like ? OR publisher like ? ORDER BY bookname ASC";
				
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, bookname.equals("") ? "++" : "%"+bookname+"%");
				pstmt.setString(2, num.equals("") ? "++" : "%"+num+"%");
				pstmt.setString(3, name.equals("") ? "++" : "%"+name+"%");
				pstmt.setString(4, publisher.equals("") ? "++" : "%"+publisher+"%");

				rs =pstmt.executeQuery();
				
				//System.out.println("검색문구"+bookname+num+name+publisher);
				
				
				
			bookSearchList = new ArrayList<BookBean>();
			
			
			while (rs.next()) {
				BookBean bookList = new BookBean();
				
				bookList.setBookname(rs.getString("bookname"));
				bookList.setNum(rs.getString("num"));
				bookList.setName(rs.getString("name"));
				bookList.setPublisher(rs.getString("publisher"));
				bookList.setRental(rs.getString("rental"));
				
				bookSearchList.add(bookList);
			}
			
			//System.out.println(bookSearchList);
			
			
			
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("오류");
		} finally {
			close(rs);
			close(pstmt);
			close(con);
		}
		return bookSearchList;
	}
	
}
