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
				<tr>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
			</table>
			</div>
			<div class="submit">
				<button type="submit" onclick="location.href = 'main.jsp' ">이전으로
					돌아가기</button>
			</div>
		</fieldset>
	</form>
</body>
</html>