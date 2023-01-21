<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&display=swap"
	rel="stylesheet">
<link rel="stylesheet" href="./login.css">
<link href="joinCss.css" rel="stylesheet" type="text/css">
</head>
<body>
	<h1>
		<img src="heart.png" width="100" height="auto">
	</h1>

	<form id="join" action="joinPro.jsp" method="post">
		<fieldset>
			<h3>join</h3>
			<ul>
				<li><label for="userid"> 아이디 </label> <input type="text"
					id="id" name="id" placeholder="ID를 입력하세요" required autofocus>
				</li>

				<li><label for="pass"> 비밀번호 </label> <input type="password"
					id="pass" name="pass" placeholder="비밀번호를 입력하세요" required></li>

				<li><label for="name"> 이름 </label> <input type="text" id="name"
					name="name" required></li>

				<li><label for="nickname"> 닉네임 </label> <input type="text"
					id="nickname" name="nickname" required></li>

				<li><label for="birth"> 생일 </label> <input type="text"
					id="birth" name="birth"></li>
				<li><label for="gender"> 성별 </label> <input type="radio"
					name="gender" id="남"> 남 <input type="radio" name="gender"
					id="여"> 여 <br></li>

				<li><label for="address"> 주소 </label> <input type="text"
					id="address" name="address" readonly><br> <label
					for="address_detail">상세주소</label> <input type="text"
					id="address_detail" name="address_detail"></li>

			</ul>
			<div class="submit">
				<button type="submit">회원가입</button>
			</div>
		</fieldset>
	</form>
</body>
</html>