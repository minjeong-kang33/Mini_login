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
<title>내 정보 수정</title>
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&display=swap" rel="stylesheet">
	<link href="editCss.css" rel="stylesheet" type="text/css">
<script type="text/javascript">
	function check() {
		if(document.edit.pass.value == ""){
			alert("비밀번호를 입력해주세요.");
			document.edit.pass.focus();
			return false;
		}
	}

</script>
</head>
<body>
	<h1>
		<img src="heart.png" width="100" height="auto">
	</h1>
<%
String id = (String)session.getAttribute("id");

if(id == null){
	response.sendRedirect("login.jsp");
}

Class.forName("com.mysql.cj.jdbc.Driver");
String dbUrl = "jdbc:mysql://localhost:3306/loginProject";
String dbUser = "root";
String dbPass = "alswjd3462";
Connection con = DriverManager.getConnection(dbUrl, dbUser, dbPass);

String sql="select * from members where id=?";
PreparedStatement pstmt=con.prepareStatement(sql);
pstmt.setString(1, id);

ResultSet rs = pstmt.executeQuery();
while(rs.next()){
%>
	<form id="edit" action="main.jsp" method="post" onsubmit="return check();">
		<fieldset>

			<h3>Edit Information</h3>
			<ul>
				<li><label for="userid"> 아이디 </label> <input type="text"
					id="id" name="id" readonly style="border: 0 solid black"
					value="<%= rs.getString("id")%>"></li>

				<li><label for="pass"> 비밀번호 </label> <input type="password"
					id="pass" name="pass" required placeholder="확인을 위해 비밀번호를 입력하세요"></li>

				<li><label for="name"> 이름 </label> <input type="text" id="name"
					name="name" readonly style="border: 0 solid black"
					value="<%= rs.getString("name")%>"></li>

				<li><label for="nickname"> 닉네임 </label> <input type="text"
					id="nickname" name="nickname" value="<%= rs.getString("nickname")%>"
					></li>

				<li><label for="birth"> 생일 </label> <input type="text"
					id="birth" name="birth" readonly style="border: 0 solid black"
					value="<%= rs.getString("birth")%>"></li>

				<li><label for="gender"> 성별 </label> <input type="text"
					name="gender" readonly style="border: 0 solid black"
					value="<%= rs.getString("gender")%>"></li>

				<li><label for="address"> 주소 </label> <input type="text"
					id="address" name="address" value="<%= rs.getString("address")%>"><br> <label
					for="address_detail">상세주소</label> <input type="text"
					id="address_detail" name="address_detail" value="<%= rs.getString("address_detail")%>"></li>
			</ul>
			<div class="submit">
				<button type="submit">수정</button>
				<button type="submit" onclick="location.href = 'myPage.jsp' ">이전으로
					돌아가기</button>
			</div>
		</fieldset>
	</form>
	<%
}
%>
</body>
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