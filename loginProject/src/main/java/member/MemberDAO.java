package member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class MemberDAO {
	//JDBC 연결용(context.xml에서 로그인)
	public Connection getConnection() throws Exception{
		Context init=new InitialContext();
		DataSource ds=(DataSource)init.lookup("java:comp/env/jdbc/MysqlDB");
		Connection con=ds.getConnection();
		return con;
	}
	// id와 pass를 매개체로 하는 userCheck()메서드 정의 
	public MemberDTO userCheck(String id, String pass) {
		MemberDTO dto=null;
		Connection con =null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		try {
			con = getConnection();
			// members테이블에서 id와 pass가 모두 일치하는 데이터를 찾음 
			String sql="select * from members where id=? and pass=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pass);
			
			rs=pstmt.executeQuery();
			if(rs.next()){
				dto=new MemberDTO();
				dto.setId(rs.getString("id"));
				dto.setPass(rs.getString("pass"));
				dto.setJoindate(rs.getTimestamp("date"));
			}else{
			}	
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(rs!=null) try { rs.close();} catch (Exception e2) {}
			if(pstmt!=null) try { pstmt.close();} catch (Exception e2) {}
			if(con!=null) try { con.close();} catch (Exception e2) {}
		}
		return dto;
	}//userCheck()
	
	public void insertMember(MemberDTO dto) {
		Connection con=null;
		PreparedStatement pstmt=null;
		
		try {
			con=getConnection();
			
			String sql = "insert into members(id,pass,name,nickname,birth,"
					+ "gender,address,address_detail,joindate) values(?,?,?,?,?,?,?,?,?)";
			pstmt=con.prepareStatement(sql);
			
			pstmt.setString(1, dto.getId());
			pstmt.setString(2, dto.getPass());
			pstmt.setString(3, dto.getName());
			pstmt.setString(4, dto.getNickname());
			pstmt.setString(5, dto.getBirth());
			pstmt.setString(6, dto.getGender());
			pstmt.setString(7, dto.getAddress());
			pstmt.setString(8, dto.getAddress_detail());
			pstmt.setTimestamp(9, dto.getJoindate());
			
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(pstmt!=null) try { pstmt.close();} catch (Exception e2) {}
			if(con!=null) try { con.close();} catch (Exception e2) {}
		}
		return;
	}//insertMember()
	
	public MemberDTO getMember(String id) {
		MemberDTO dto=null;
		Connection con =null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		try {
			con=getConnection();
			
			String sql="select * from members where id=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, id);

			rs=pstmt.executeQuery();
			
			if(rs.next()){
				dto=new MemberDTO();
				
				dto.setId(rs.getString("id"));
				dto.setPass(rs.getString("pass"));
				dto.setName(rs.getString("name"));
				dto.setNickname(rs.getString("nickname"));
				dto.setBirth(rs.getString("birth"));
				dto.setGender(rs.getString("gender"));
				dto.setAddress(rs.getString("address"));
				dto.setAddress_detail(rs.getString("address_detail"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(rs!=null) try { rs.close();} catch (Exception e2) {}
			if(pstmt!=null) try { pstmt.close();} catch (Exception e2) {}
			if(con!=null) try { con.close();} catch (Exception e2) {}
		}
		return dto;
	}//getMember()
	
	public void updateMember(MemberDTO updateDto) {
		Connection con =null;
		PreparedStatement pstmt2=null;
		try {
			con=getConnection();
			
			String sql2 = "update members set nickname=?, address=?, address_detail=? where id=?";
			
			pstmt2=con.prepareStatement(sql2);
			pstmt2.setString(1, updateDto.getNickname()); 
			pstmt2.setString(2, updateDto.getAddress());
			pstmt2.setString(3, updateDto.getAddress_detail());
			pstmt2.setString(4, updateDto.getId());
			
			pstmt2.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(pstmt2!=null) try { pstmt2.close();} catch (Exception e2) {}
			if(con!=null) try { con.close();} catch (Exception e2) {}
		}
	}//updateMember()
	
	public void deleteMember(String id) {
		Connection con =null;
		PreparedStatement pstmt2=null;
		try {
			con=getConnection();
			
			String sql2="select * from members where id=?";
			pstmt2=con.prepareStatement(sql2);
			pstmt2.setString(1, id);  
			
			pstmt2.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(pstmt2!=null) try { pstmt2.close();} catch (Exception e2) {}
			if(con!=null) try { con.close();} catch (Exception e2) {}
		}
	}//deleteMember()
	
	public ArrayList<MemberDTO> getMemberList(){
		ArrayList<MemberDTO> memberList=new ArrayList<MemberDTO>();
		Connection con =null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		try {
			con=getConnection();
			
			String sql="select * from members";
			pstmt=con.prepareStatement(sql);
			rs=pstmt.executeQuery();	
			
			while(rs.next()) {
				MemberDTO dto=new MemberDTO();
				dto.setId(rs.getString("id"));
				dto.setName(rs.getString("name"));
				dto.setNickname(rs.getString("nickname"));
				dto.setJoindate(rs.getTimestamp("joindate"));
				memberList.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(rs!=null) try { rs.close();} catch (Exception e2) {}
			if(pstmt!=null) try { pstmt.close();} catch (Exception e2) {}
			if(con!=null) try { con.close();} catch (Exception e2) {}
		}
		return memberList;
	}//getMemberList()
	
}
