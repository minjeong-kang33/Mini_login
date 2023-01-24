<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>joinPro.jsp</title>
</head>
<body>
<%
request.setCharacterEncoding("utf-8");
String id=request.getParameter("id");
String pass=request.getParameter("pass");
String name=request.getParameter("name");
String nickname=request.getParameter("nickname");
String birth=request.getParameter("birth");
String gender=request.getParameter("gender");
String address=request.getParameter("address");
String address_detail=request.getParameter("address_detail");
Timestamp joindate=new Timestamp(System.currentTimeMillis());

Class.forName("com.mysql.cj.jdbc.Driver");
String dbUrl="jdbc:mysql://localhost:3306/loginProject";
String dbUser="root";
String dbPass="alswjd3462";
Connection con = DriverManager.getConnection(dbUrl, dbUser, dbPass);
String sql = "insert into members(id,pass,name,nickname,birth,"
		+ "gender,address,address_detail,joindate) values(?,?,?,?,?,?,?,?,?)";
PreparedStatement pstmt = con.prepareStatement(sql);
pstmt.setString(1, id);
pstmt.setString(2, pass);
pstmt.setString(3, name);
pstmt.setString(4, nickname);
pstmt.setString(5, birth);
pstmt.setString(6, gender);
pstmt.setString(7, address);
pstmt.setString(8, address_detail);
pstmt.setTimestamp(9, joindate);
pstmt.executeUpdate();

response.sendRedirect("loginForm.jsp");
%>
</body>
</html>