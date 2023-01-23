<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원탈퇴</title>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&display=swap"
	rel="stylesheet">
<link href="deleteCss.css" rel="stylesheet" type="text/css">
</head>
<body>
	<h1>
		<img src="heart.png" width="100" height="auto">
	</h1>

	<form id="delete" action="login.jsp" method="post">
		<fieldset>
			<h3>Delete Account</h3>
			<ul>
				<li><label for="userid"> 아이디 </label> <input type="text"
					id="id" name="id" readonly style="border: 0 solid black"></li>

				<li><label for="pass"> 비밀번호 </label> <input type="password"
					id="pass" name="pass" required placeholder="확인을 위해 비밀번호를 입력하세요"></li>

				<li><label for="name"> 이름 </label> <input type="text" id="name"
					name="name" readonly style="border: 0 solid black"></li>


			</ul>
			<div class="submit">
				<button type="submit" onclick="location.href = 'main.jsp' ">이전으로
					돌아가기</button>
				<button type="submit" onclick="location.href = 'login.jsp' ">탈퇴하기</button>

			</div>
		</fieldset>
	</form>
</body>
</html>