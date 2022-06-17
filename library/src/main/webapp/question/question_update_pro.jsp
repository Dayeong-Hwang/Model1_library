<%@page import="question.QuestionDAO"%>
<%@page import="question.QuestionBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
<%

	request.setCharacterEncoding("utf-8");

	String pageNum = request.getParameter("page");
	int num = Integer.parseInt(request.getParameter("num"));


	String name = request.getParameter("name");
	String pass = request.getParameter("pass");
	String subject = request.getParameter("subject");
	String content = request.getParameter("content");
	QuestionBean question = new QuestionBean(num,name,pass,subject,content);
	
	
	QuestionDAO questionDAO =new QuestionDAO();
	int updateCount = questionDAO.updateQuestion(question);

	
	if(updateCount > 0){
		response.sendRedirect("question_content.jsp?num="+num+"&page="+pageNum);
		
	} else {%>
		<script>
			alert("수정실패");
			history.back();
			
		</script>
	
	<%}

%>