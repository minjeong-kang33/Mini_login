<%@page import="member.MemberDTO"%>
<%@page import="member.MemberDAO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
request.setCharacterEncoding("utf-8");
String id=request.getParameter("id");
String pass=request.getParameter("pass");

//MemberDAO로 객체 생성
MemberDAO dao = new MemberDAO();
//MemberDAO의 usercheck()메서드를 사용하는 객체 dto 생성
MemberDTO dto=dao.userCheck(id, pass);

//존재하는 계정일 경우 id값을 받아와 main.jsp에 연결
if (dto != null){
	session.setAttribute("id", id);
	response.sendRedirect("main.jsp");
}else{
%>
	<script type="text/javascript">
	alert("아이디 혹은 비밀번호가 일치하지 않습니다.");
	history.back();
	</script>
	<%
}
	%>
