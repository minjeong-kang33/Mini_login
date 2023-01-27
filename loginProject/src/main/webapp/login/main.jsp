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

	//로그인되지 않은 상태(id가 확인되지 않는 상태)인 경우 로그인 페이지로 이동
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
				<button type="button" onclick="location.href = 'logout.jsp' ">로그아웃</button>
				<br>
				<!-- 일반회원에게는 마이페이지와 로그아웃 버튼까지만 보이게함  -->
				<!-- 아이디가 admin인 관리자만 제일 아래에 회원목록 버튼이 보이도록함 -->
				<%
				if (id != null) {
					if (id.equals("admin")) {
				%>
				<button type="button" onclick="location.href = 'list.jsp' ">회원목록</button>
				<%
				}
				}
				%>
			</div>
		</div>
	</form>
</body>
</html>