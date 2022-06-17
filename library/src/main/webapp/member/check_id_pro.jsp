<%@page import="member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

String id = request.getParameter("id");
MemberDAO memberDAO = new MemberDAO();

boolean isDuplicate = memberDAO.checkId(id);

response.sendRedirect("check_id.jsp?id="+id+"&duplicate="+isDuplicate);

%>