<%@page import="question.QuestionDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

 <%
 	
 String pageNum = request.getParameter("page");
 int num = Integer.parseInt(request.getParameter("num"));
 
 String pass = request.getParameter("pass");

 
 QuestionDAO questionDAO = new QuestionDAO();
 int deleteCount = questionDAO.deleteQuestion(num, pass);
 
 if(deleteCount > 0){
	 response.sendRedirect("question.jsp?page="+pageNum);
 } else{
	 %>
	 	<script>
	 		alert("삭제실패!");
	 		history.back();
	 	</script>
	 	
	 
	 <%
 }
 
 %>