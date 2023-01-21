<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 페이지</title>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="./login.css">
    
<link href="loginCss.css" rel="stylesheet" type="text/css">
</head>
<body>
   <h1>
      <img src="heart.png" width="100" height="auto">
   </h1>
   <form id="login" action="main.jsp">
   <h3>log-in</h3>
      <div class="textbox">
         <ul>
            <li><label for="id">ID</label> <input id="id" name="id"
               type="text" placeholder="아이디" required autofocus></li>
            <li><label for="pass">PASSWORD</label> <input id="pass" name="pass"
               placeholder="비밀번호" type="password" required>
            <div class="login_etc">
                      <div class="checkbox">
                      <input type="checkbox" name="check" id="check"> 아이디 기억하기
                      </div>
                      <div class="Sign Up">
                      <a href="joinForm.jsp">회원가입하기</a>
                  </div>
              </div>
               
               </li>
         </ul>
      </div>
      <div class="submit">
         <button type="submit" id="button">로그인</button>
      </div>
   </form>
</body>
</html>