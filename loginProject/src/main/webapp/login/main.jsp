<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인</title>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&display=swap"
	rel="stylesheet">
<link href="mainCss.css" rel="stylesheet" type="text/css">
</head>
<body>
	<h1>
		<img src="heart.png" width="100" height="auto">
	</h1>
	<%
	String id = (String) session.getAttribute("id");

	if (id == null) {
		response.sendRedirect("login.jsp");
	}
	%>
	<form id="main" action="myPage.jsp">
		<div class="submit">
			<h4>
				<%=id%>님,<br> 환영합니다 !
			</h4>
			<br>

			<div class="button_div">
				<button type="submit">마이페이지</button>
				<br>
				<button type="submit">로그아웃</button>
				<br>
				<%
				if (id != null) {
					if (id.equals("admin")) {
				%>
				<button type="submit" onclick="location.href = 'list.jsp' ">회원목록</button>
				<%
				}
				}
				%>
			</div>
		</div>
	</form>
</body>
</html>