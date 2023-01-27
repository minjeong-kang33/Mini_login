<%@page import="member.MemberDAO"%>
<%@page import="member.MemberDTO"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
request.setCharacterEncoding("utf-8");
String id=request.getParameter("id");
String pass=request.getParameter("pass");
String name=request.getParameter("name");
String nickname=request.getParameter("nickname");
String birth=request.getParameter("birth");
String gender=request.getParameter("gender");
String address=request.getParameter("address");
String address_detail=request.getParameter("address_detail");
Timestamp joindate=new Timestamp(System.currentTimeMillis());

//MemberDTO로 객체 생성 후 각각에 입력받은 값을 받음(set)
MemberDTO dto=new MemberDTO();
dto.setId(id);
dto.setPass(pass);
dto.setName(name);
dto.setNickname(nickname);
dto.setBirth(birth);
dto.setGender(gender);
dto.setAddress(address);
dto.setAddress_detail(address_detail);
dto.setJoindate(joindate);

//MemberDAO의 insertMember()메서드를 이용해 
//받은 값을 sql문에 넣어 insert 진행
MemberDAO dao=new MemberDAO();
dao.insertMember(dto);

response.sendRedirect("loginForm.jsp");
%>
