package question;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;


import static db.JdbcUtil.*;

public class QuestionDAO {
	
	Connection con;
	PreparedStatement pstmt;
	PreparedStatement pstmt2;
	ResultSet rs;
	
	
	//글쓰기작업
	public int insertQuestion(QuestionBean question) {
		int insertCount = 0;
		int num = 0;
		
		try {
			con = getConnection();
			
			String sql = "SELECT MAX(num) FROM question";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				num = rs.getInt(1)+1;
			}

			
			sql = "INSERT INTO question VALUES(?,?,?,?,?,now(),0)";
			pstmt2 = con.prepareStatement(sql);
			
			pstmt2.setInt(1, num);
			pstmt2.setString(2, question.getName());
			pstmt2.setString(3, question.getPass());
			pstmt2.setString(4, question.getSubject());
			pstmt2.setString(5, question.getContent());
			
			insertCount = pstmt2.executeUpdate();
			
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt2);
			close(pstmt);
			close(con);
		}
		
		return insertCount;
		
	}
	
	//게시물 갯수조회
	public int selectListcount() {
		int listCount = 0;
		
		try {
			con = getConnection();
			String sql = "SELECT COUNT(num) FROM question";
			pstmt = con.prepareStatement(sql);
			
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

	//게시물 목록 세트 
	public ArrayList<QuestionBean> selectQuestionList(int pageNum, int listLimt) {
		ArrayList<QuestionBean> questionList =null;
		
		try {
			con = getConnection();
			
			int startRow = (pageNum -1) * listLimt;
			
			String sql = "SELECT * FROM question ORDER BY num DESC LIMIT ?,?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, listLimt);
			
			rs = pstmt.executeQuery();
			
			questionList = new ArrayList<QuestionBean>();
			
			
			while (rs.next()) {
			QuestionBean question= new QuestionBean();
			
			question.setNum(rs.getInt("num"));
			question.setName(rs.getString("name"));
			question.setPass(rs.getString("pass"));
			question.setSubject(rs.getString("subject"));
			question.setContent(rs.getString("content"));
			question.setDate(rs.getDate("date"));
			question.setReadcount(rs.getInt("readcount"));
			
			questionList.add(question);
			}
			

		} catch (SQLException e) {
			System.out.println("오류");
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
			close(con);
		}
		
		return questionList;
	}
	
	//게시물 상세내용 조회
	public QuestionBean selectQuestion(int num) {
		QuestionBean question = null;
		
		try {
			con =getConnection();
			String sql = "SELECT * FROM question WHERE num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				
				question= new QuestionBean();
				
				question.setNum(rs.getInt("num"));
				question.setName(rs.getString("name"));
				question.setPass(rs.getString("pass"));
				question.setSubject(rs.getString("subject"));
				question.setContent(rs.getString("content"));
				question.setDate(rs.getDate("date"));
				question.setReadcount(rs.getInt("readcount"));
				
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
			close(con);
		}
		
		return question;
	}
	
	//게시물 수정
	public int updateQuestion(QuestionBean question) {
		int updateCount = 0;
		
		con = getConnection();
		
		try {
			String sql = "SELECT pass FROM question WHERE num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, question.getNum());
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				if(rs.getString("pass").equals(question.getPass())) {
					sql = "UPDATE question SET name=?, subject=?, content=? WHERE num=?";
					pstmt2 = con.prepareStatement(sql);
					pstmt2.setString(1, question.getName());
					pstmt2.setString(2, question.getSubject());
					pstmt2.setString(3, question.getContent());
					pstmt2.setInt(4, question.getNum());
					
				}
				
				updateCount = pstmt2.executeUpdate();
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(pstmt2);
			close(con);
		}
		
		return updateCount;
	}

	//조회수
	public void updateReadcount(int num) {

		
		
		try {
			con = getConnection();
			String sql = "UPDATE question SET readcount = readcount+1 WHERE num=?";
			
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

	//게시물 삭제
	public int deleteQuestion(int num, String pass) {
		
		int deleteCount = 0;
		
		try {
			con =getConnection();
			String sql = "SELECT * FROM question WHERE num=? AND pass=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.setString(2, pass);
			
			
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				sql = "DELETE FROM question WHERE num=?";
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

	//검색어에 해당하는 게시물 갯수 조회
	public int selectSearchListCount(String search, String searchType) {
		int listCount = 0;
		
		con =getConnection();
		
		try {
			String sql = "SELECT COUNT(num) FROM question WHERE " + searchType + " LIKE ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, "%"+search+"%");
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				listCount = rs.getInt(1);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
			close(con);
		}
		return listCount;
	}

	
	//검색어에 해당하는 게시물 목록세트
	public ArrayList<QuestionBean> selectSearchQuestionList(int pageNum, int listLimt, String search, String searchType) {
		ArrayList<QuestionBean> questionSearchList = null;

		try {
			con = getConnection();	
			
			int startRow = (pageNum -1) * listLimt;
			
			String sql = "SELECT * FROM question  WHERE " + searchType + " LIKE ? ORDER BY num DESC LIMIT ?,?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, "%"+search+"%");
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, listLimt);
			
			rs = pstmt.executeQuery();
			
			questionSearchList = new ArrayList<QuestionBean>();
			
			while (rs.next()) {
				QuestionBean question= new QuestionBean();
				
				question.setNum(rs.getInt("num"));
				question.setName(rs.getString("name"));
				question.setPass(rs.getString("pass"));
				question.setSubject(rs.getString("subject"));
				question.setContent(rs.getString("content"));
				question.setDate(rs.getDate("date"));
				question.setReadcount(rs.getInt("readcount"));
				
				questionSearchList.add(question);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
			close(con);
			
		}
		
		return questionSearchList;
	}
	
	
	//최근게시물 조회
	public ArrayList<QuestionBean> selectRecentquestionList() {
		
		ArrayList<QuestionBean> questionList = null;
		try {
			con = getConnection();
			
			String sql = "SELECT * FROM question ORDER BY num DESC LIMIT ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, 5);
			
			
			rs =pstmt.executeQuery();
			
			questionList = new ArrayList<QuestionBean>();
			
			while (rs.next()) {
				QuestionBean question = new QuestionBean();
				
				question.setNum(rs.getInt("num"));
				question.setName(rs.getString("name"));
				question.setPass(rs.getString("pass"));
				question.setSubject(rs.getString("subject"));
				question.setContent(rs.getString("content"));
				question.setDate(rs.getDate("date"));
				question.setReadcount(rs.getInt("readcount"));
				
				questionList.add(question);
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
			close(con);
		}

		
		
		
		return questionList;
	}
	
	
}
