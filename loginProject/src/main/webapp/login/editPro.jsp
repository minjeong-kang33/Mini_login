<%@page import="member.MemberDAO"%>
<%@page import="member.MemberDTO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
request.setCharacterEncoding("utf-8");
String id = request.getParameter("id");
String pass = request.getParameter("pass");
String name = request.getParameter("name");
String nickname = request.getParameter("nickname");
String address = request.getParameter("address");
String address_detail = request.getParameter("address_detail");

MemberDTO updateDto = new MemberDTO();
updateDto.setId(id);
updateDto.setName(name);
updateDto.setNickname(nickname);
updateDto.setAddress(address);
updateDto.setAddress_detail(address_detail);

MemberDAO dao=new MemberDAO();
MemberDTO dto=dao.userCheck(id, pass);

if(dto!=null){
	dao.updateMember(updateDto);
	response.sendRedirect("myPage.jsp");
	} else{
	
%>
	<script type="text/javascript">
	alert("비밀번호가 일치하지 않습니다.");
	history.back();
	</script>
<% 
}
%>
