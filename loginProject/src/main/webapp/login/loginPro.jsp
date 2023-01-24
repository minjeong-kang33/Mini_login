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
<title>loginPro.jsp</title>
</head>
<body>
<%
request.setCharacterEncoding("utf-8");
String id=request.getParameter("id");
String pass=request.getParameter("pass");

Class.forName("com.mysql.cj.jdbc.Driver");
String dbUrl="jdbc:mysql://localhost:3306/loginProject";
String dbUser="root";
String dbPass="alswjd3462";
Connection con = DriverManager.getConnection(dbUrl, dbUser, dbPass);

String sql = "select * from members where id=? and pass=?";
PreparedStatement pstmt = con.prepareStatement(sql);
pstmt.setString(1,id);
pstmt.setString(2,pass);

ResultSet rs = pstmt.executeQuery();
if (rs.next()){
	session.setAttribute("id", id);
	response.sendRedirect("main.jsp");
}else{
%>
	<script type="text/javascript">
	alert("아이디 혹은 비밀번호가 일치하지 않습니다.");
	history.back();
	</script>
	<%
}
	%>
</body>
</html>