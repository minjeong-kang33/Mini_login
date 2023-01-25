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
<title>회원 정보 조회</title>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&display=swap"
	rel="stylesheet">
<link rel="stylesheet" href="./login.css">

<link href="listCss.css" rel="stylesheet" type="text/css">
</head>
<body>
<body>
	<h1>
		<img src="heart.png" width="100" height="auto">
	</h1>
	<%
	request.setCharacterEncoding("utf-8");
	String id = request.getParameter("id");
	String name = request.getParameter("name");
	String nickname = request.getParameter("nickname");
	Timestamp date = new Timestamp(System.currentTimeMillis());

	Class.forName("com.mysql.cj.jdbc.Driver");
	String dbUrl = "jdbc:mysql://localhost:3306/loginProject";
	String dbUser = "root";
	String dbPass = "alswjd3462";
	Connection con = DriverManager.getConnection(dbUrl, dbUser, dbPass);

	String sql = "select * from members";
	PreparedStatement pstmt = con.prepareStatement(sql);
	ResultSet rs = pstmt.executeQuery();
	%>

	<form id="list" action="main.jsp" method="post">
		<fieldset>
			<h3>Members List</h3>
			<div class="list">
				<table>
					<tr>
						<th>아이디</th>
						<th>이름</th>
						<th>닉네임</th>
						<th>가입일</th>
					</tr>
					<%
					while (rs.next()) {
					%>
					<tr>
						<td><%=rs.getString("id")%></td>
						<td><%=rs.getString("name")%></td>
						<td><%=rs.getString("nickname")%></td>
						<td><%=rs.getTimestamp("joindate")%></td>
					</tr>
					<%
					}
					%>
				</table>
			</div>
			<br>

			<div class="submit">
				<button type="submit" onclick="location.href = 'main.jsp' ">이전으로
					돌아가기</button>
			</div>
		</fieldset>
	</form>
</body>
</html>