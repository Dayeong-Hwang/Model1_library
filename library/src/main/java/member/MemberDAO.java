package member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import db.JdbcUtil;

import static db.JdbcUtil.*;

public class MemberDAO {
	
	Connection con = null;
	PreparedStatement pstmt = null;
	PreparedStatement pstmt2 = null;
	ResultSet rs = null;
	
	
	
	public boolean checkId(String id) {
		boolean isDuplicate = false;
		
		try {
			con = getConnection();
			String sql = "SELECT * FROM member WHERE id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				isDuplicate = true;
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
			close(con);
		}
		return isDuplicate;
	}
	public int insertMember(MemberBean member) {
		int insertCount = 0;
		
		try {
			con = getConnection();
			
			String sql = "INSERT INTO member VALUES (?,?,?,?,now(),?,?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, member.getId());
			pstmt.setString(2, member.getPass());
			pstmt.setString(3, member.getName());
			pstmt.setString(4, member.getEmail());
			pstmt.setString(5, member.getAddress());
			pstmt.setString(6, member.getPhone());
			pstmt.setString(7, member.getMobile());
			
			insertCount =pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}	finally {
			close(pstmt);
			close(con);
		}
		
		return insertCount;
		
	}
	public boolean checkUser(MemberBean member) {
		boolean isLoginSuccess = false;
		
		try {
			con= getConnection();
			
			String sql = "SELECT * FROM member WHERE id=? AND pass=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, member.getId());
			pstmt.setString(2, member.getPass());
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				
				isLoginSuccess=true;
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(con);
		}
		
		return isLoginSuccess;
		
	}
	
	public MemberBean selectMemberInfo(String id) {
		
		MemberBean member = null;
		
		
		try {
			con = JdbcUtil.getConnection();
			String sql = "SELECT * FROM member WHERE id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				member = new MemberBean();
				
				member.setId(id);
				member.setPass(rs.getString("pass"));
				member.setName(rs.getString("name"));
				member.setEmail(rs.getString("email"));
				member.setDate(rs.getDate("date"));
				member.setAddress(rs.getString("address"));
				member.setPhone(rs.getString("phone"));
				member.setMobile(rs.getString("mobile"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
			close(con);
		}
		
		
		
		return member;
	}

	
	public int updateMember(MemberBean member) {
		int updateCount = 0;
		
		
		try {
			con = JdbcUtil.getConnection();
			
			if(member.getPass().equals("")) {
				String sql = "UPDATE member "
						+ "SET name=?, email=?, address=?, phone=?, mobile=? "
						+ "WHERE id=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, member.getName());
				pstmt.setString(2, member.getEmail());
				pstmt.setString(3, member.getAddress());
				pstmt.setString(4, member.getPhone());
				pstmt.setString(5, member.getMobile());
				pstmt.setString(6, member.getId());
				
				
			} else { 
				String sql = "UPDATE member "
						+ "SET pass=?, name=?, email=?, address=?, phone=?, mobile=? "
						+ "WHERE id=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, member.getPass());
				pstmt.setString(2, member.getName());
				pstmt.setString(3, member.getEmail());
				pstmt.setString(4, member.getAddress());
				pstmt.setString(5, member.getPhone());
				pstmt.setString(6, member.getMobile());
				pstmt.setString(7, member.getId());
			}
			
			updateCount = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(con);
		}
		
		return updateCount;
	}


}













