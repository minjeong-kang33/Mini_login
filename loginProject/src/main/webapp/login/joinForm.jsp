<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
   <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&display=swap" rel="stylesheet">
   <link href="joinCss.css" rel="stylesheet" type="text/css">
</head>
<body>
   <h1>
      <img src="heart.png" width="100" height="auto">
   </h1>

   <form id="join" action="joinPro.jsp" method="post">
      <fieldset>
         <h3>Join</h3>
         <ul>
            <li><label for="userid"> 아이디 </label> <input type="text"
               id="id" name="id" placeholder="ID를 입력하세요" required autofocus>
            </li>
            <li><label for="pass"> 비밀번호 </label> <input type="password"
               id="pass" name="pass" placeholder="비밀번호를 입력하세요" required>
            </li>
            <li><label for="name"> 이름 </label> <input type="text" id="name"
               name="name" required placeholder="이름을 입력하세요"></li>
            <li><label for="nickname"> 닉네임 </label> <input type="text"
               id="nickname" name="nickname" required placeholder="닉네임을 입력하세요"></li>
            <li><label for="birth"> 생일 </label> <input type="text"
               id="birth" name="birth" placeholder="생년월일 8자리를 입력하세요"></li>
            <li><label for="gender"> 성별 </label> <input type="radio"
               name="gender" value="남"> 남 <input type="radio" name="gender"
               value="여"> 여 <br></li>
            <li><label for="address"> 주소 </label> <input type="text"
               id="address" name="address" readonly placeholder="클릭하여 주소를 검색하세요"><br> <label
               for="address_detail">상세주소</label> <input type="text"
               id="address_detail" name="address_detail" placeholder="상세주소를 입력하세요"></li>
         </ul>
         <div class="submit">
         <button type="submit">회원가입</button>
         </div>
      </fieldset>
   </form>
</body>

<!-- 주소용 카카오 API -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
window.onload = function(){
    document.getElementById("address").addEventListener("click", function(){ 
        new daum.Postcode({
            oncomplete: function(data) { 
                document.getElementById("address").value = data.address; 
                document.querySelector("input[name=address_detail]").focus(); 
            }
        }).open();
    });
}
</script>
</html>