<%@page import="question.QuestionDAO"%>
<%@page import="question.QuestionBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
  <%
  	request.setCharacterEncoding("utf-8");
   	String name = request.getParameter("name");
   	String pass = request.getParameter("pass");
   	String subject = request.getParameter("subject");
   	String content = request.getParameter("content");

   	
   	QuestionBean question = new QuestionBean(name, pass, subject, content);
   	QuestionDAO	questionDAO = new QuestionDAO();
   	
   	int insertCount = questionDAO.insertQuestion(question);
   	
   	if(insertCount > 0){
   		response.sendRedirect("question.jsp");
   		
   	} else{ %>
   	
   		<script>
   			alert("글쓰기 실패");
   			history.back();
   		</script>
   	
   	<%}%>
  
  
<%--   값 확인

  <%=name %>
  <%=pass %>
  <%=subject %>
  <%=content %> --%>