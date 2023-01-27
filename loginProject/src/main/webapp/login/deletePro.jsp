<%@page import="member.MemberDTO"%>
<%@page import="member.MemberDAO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
String id = request.getParameter("id");
String pass = request.getParameter("pass");

MemberDAO dao = new MemberDAO();
//받은 id, pass값이 일치한지 확인
MemberDTO dto = dao.userCheck(id, pass);

//일치하여서 반환받은 dto가 null이 아닌 경우
if (dto != null) {
//id값을 사용하여 deleteMember()메서드로 데이터 삭제 진행
dao.deleteMember(id);
//모든 세션 삭제한 후 로그인 화면으로 이동
session.invalidate();
response.sendRedirect("loginForm.jsp");

} else {
%>
<script type="text/javascript">
	alert("비밀번호가 일치하지 않습니다.");
	location.href = "delete.jsp"
</script>
<%
}
%>
