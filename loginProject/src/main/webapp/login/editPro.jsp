<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>editPro.jsp</title>
</head>
<body>
<h1>editPro.jsp</h1>
<%
request.setCharacterEncoding("utf-8");
String id = request.getParameter("id");
String pass = request.getParameter("pass");
String nickname = request.getParameter("nickname");
String address = request.getParameter("address");
String address_detail = request.getParameter("address_detail");

Class.forName("com.mysql.cj.jdbc.Driver");
String dbUrl = "jdbc:mysql://localhost:3306/loginProject";
String dbUser = "root";
String dbPass = "alswjd3462";
Connection con = DriverManager.getConnection(dbUrl, dbUser, dbPass);

String sql="select * from members where id=? and pass=?";
PreparedStatement pstmt=con.prepareStatement(sql);
pstmt.setString(1, id);
pstmt.setString(2, pass);

ResultSet rs = pstmt.executeQuery();

if(rs.next()){
	String sql2 = "update members set nickname=?, address=?, address_detail=? where id=?";
	PreparedStatement pstmt2=con.prepareStatement(sql2);
	pstmt2.setString(1, nickname);
	pstmt2.setString(2, address);
	pstmt2.setString(3, address_detail);
	pstmt2.setString(4, id);
	pstmt2.executeUpdate();
	response.sendRedirect("main.jsp");		
}
else {
%>
	<script type="text/javascript">
	alert("비밀번호가 일치하지 않습니다.");
	location.href="edit.jsp"
	</script>
<% 
}
%>

</body>
</html>