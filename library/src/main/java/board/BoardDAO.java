package board;

import static db.JdbcUtil.*;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class BoardDAO {
	
	Connection con = null;
	PreparedStatement pstmt = null;
	PreparedStatement pstmt2 = null;
	ResultSet rs = null;
	
	
	public int insertBoard(BoardBean board) {
		int insertCount = 0;
		int num = 0;
		
		
		try {
			con = getConnection();
			String sql = "SELECT MAX(num) FROM board";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			
			if(rs.next()) {
				num = rs.getInt(1) + 1;
			}
			
			sql = "INSERT INTO board VALUES (?,?,?,?,?,now(),0)";
			pstmt2 = con.prepareStatement(sql);
			pstmt2.setInt(1, num);
			pstmt2.setString(2, board.getName());
			pstmt2.setString(3, board.getPass());
			pstmt2.setString(4, board.getSubject());
			pstmt2.setString(5, board.getContent());
		
			insertCount = pstmt2.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
			close(pstmt2);
			close(con);
		}
		return insertCount;
	}
	public int selectListCount() {
		int listCount = 0;
		
		try {
			con= getConnection();
			
			String sql = "SELECT COUNT(num) FROM board";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				listCount = rs.getInt(1);
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
			close(con);
		}
		
		return listCount;
	}
	public ArrayList<BoardBean> selectBoardList(int pageNum, int listLimit) {
		ArrayList<BoardBean> boardList = null;
		
		
		try {
			con = getConnection();
			int startRow = (pageNum - 1) * listLimit;
			
			
			String sql = "SELECT * FROM board ORDER BY num DESC LIMIT ?,?";
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, listLimit);
			
			rs = pstmt.executeQuery();
			
			boardList = new ArrayList<BoardBean>();
			
			while (rs.next()) {
				
				BoardBean board = new BoardBean();
				
				board.setNum(rs.getInt("num"));
				board.setName(rs.getString("name"));
				board.setPass(rs.getString("pass"));
				board.setSubject(rs.getString("subject"));
				board.setContent(rs.getString("content"));
				board.setDate(rs.getDate("date"));
				board.setReadcount(rs.getInt("readcount"));
				
				boardList.add(board);
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
			close(con);
		}
		
		return boardList;
	}
	public void updateReadcount(int num) {

		
		try {
			con = getConnection();
			String sql = "UPDATE board SET readcount=readcount+1 WHERE num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(con);
		}
		
	}
	public BoardBean selectBoard(int num) {
		BoardBean board = null;
	
		try {
			con = getConnection();
			
			String sql = "SELECT * FROM board WHERE num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				board = new BoardBean();
				
				board.setNum(rs.getInt("num"));
				board.setName(rs.getString("name"));
				board.setPass(rs.getString("pass"));
				board.setSubject(rs.getString("subject"));
				board.setContent(rs.getString("content"));
				board.setDate(rs.getDate("date"));
				board.setReadcount(rs.getInt("readcount"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
			close(con);
		}
		
		return board;
		
	}
	public int deleteBoard(int num, String pass) {
		int deleteCount = 0;
		
		con = getConnection();
		try {
			String sql = "SELECT * FROM board WHERE num=? AND pass=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.setString(2, pass);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				sql = "DELETE FROM board WHERE num=?";
				pstmt2 = con.prepareStatement(sql);
				pstmt2.setInt(1, num);
				deleteCount = pstmt2.executeUpdate();
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
			close(pstmt2);
			close(con);
		}
		
		return deleteCount;
	}
	public int updateBoard(BoardBean board) {
		int updateCount = 0;

		
		con = getConnection();
		try {
			String sql = "SELECT pass FROM board WHERE num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, board.getNum());
			
			rs=pstmt.executeQuery();
			
			
			if(rs.next()) {
				if(rs.getString("pass").equals(board.getPass())) {
					sql = "UPDATE board SET name=?,subject=?,content=? WHERE num=?";
					pstmt2 = con.prepareStatement(sql);
					pstmt2.setString(1, board.getName());
					pstmt2.setString(2, board.getSubject());
					pstmt2.setString(3, board.getContent());
					pstmt2.setInt(4, board.getNum());
					
					updateCount = pstmt2.executeUpdate();
				}
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(pstmt2);
			close(con);
		}
		return updateCount;
	}
	public ArrayList<BoardBean> selectRecentBoardList() {
		ArrayList<BoardBean> boardList = null;
		
		
		try {
			con = getConnection();
			String sql = "SELECT * FROM board ORDER BY num DESC LIMIT ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, 5);
			
			rs = pstmt.executeQuery();
			
			boardList = new ArrayList<BoardBean>();
			
			while (rs.next()) {
				BoardBean board = new BoardBean();
				
				board.setNum(rs.getInt("num"));
				board.setName(rs.getString("name"));
				board.setPass(rs.getString("pass"));
				board.setSubject(rs.getString("subject"));
				board.setContent(rs.getString("content"));
				board.setDate(rs.getDate("date"));
				board.setReadcount(rs.getInt("readcount"));
				
				boardList.add(board);
				
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
			close(con);
		}
		return boardList;
	}

	
	//=======================검색기능=============================================
	
	public int selectSearchListCount(String search, String searchType) {
		int listCount = 0;
		
		try {
			con = getConnection();
			
			String sql = "SELECT COUNT(num) FROM board WHERE " + searchType + " LIKE ?";
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, "%" + search + "%");
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				listCount = rs.getInt(1);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
			close(con);
		}
		return listCount;
	}
	
	public ArrayList<BoardBean> selectSearchBoardList(int pageNum, int listLimit, String search, String searchType){
		ArrayList<BoardBean> boardList = null;
		
		try {
			con = getConnection();
			int startRow = (pageNum - 1) * listLimit;
			
			
			String sql = "SELECT * FROM board "
					+ "WHERE " + searchType + " LIKE ? "
					+ "ORDER BY num DESC LIMIT ?,?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, "%" + search + "%");
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, listLimit);
			
			rs = pstmt.executeQuery();
			
			boardList = new ArrayList<BoardBean>();
			
			while(rs.next()) {
				BoardBean board = new BoardBean();
				board.setNum(rs.getInt("num"));
				board.setName(rs.getString("name"));
				board.setPass(rs.getString("pass"));
				board.setSubject(rs.getString("subject"));
				board.setContent(rs.getString("content"));
				board.setDate(rs.getDate("date"));
				board.setReadcount(rs.getInt("readcount"));
				
				boardList.add(board);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
			close(con);
		}
		return boardList;
	}
	
	
}
