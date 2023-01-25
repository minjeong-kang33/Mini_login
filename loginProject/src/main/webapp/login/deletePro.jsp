<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>deletePro.jsp</h1>
<%
request.setCharacterEncoding("utf-8");
String id = request.getParameter("id");
String pass = request.getParameter("pass");
String name = request.getParameter("name");

Class.forName("com.mysql.cj.jdbc.Driver");
String dbUrl="jdbc:mysql://localhost:3306/loginProject";
String dbUser="root";
String dbPass="alswjd3462";
Connection con=DriverManager.getConnection(dbUrl, dbUser, dbPass);

String sql="select * from members where id=? and pass=?";
PreparedStatement pstmt=con.prepareStatement(sql);
pstmt.setString(1, id);
pstmt.setString(2, pass);

ResultSet rs = pstmt.executeQuery();

if(rs.next()){
	String sql2 = "delete from members where id=?";
	PreparedStatement pstmt2=con.prepareStatement(sql2);
	pstmt2.setString(1, id);
	
	pstmt2.executeUpdate();
	
	session.invalidate();
	response.sendRedirect("loginForm.jsp");		
}
else {
%>
	<script type="text/javascript">
	alert("비밀번호가 일치하지 않습니다.");
	location.href="main.jsp"
	</script>
<% 
}
%>
</body>
</html>