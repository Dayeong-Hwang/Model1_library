<%@page import="board.BoardDAO"%>
<%@page import="board.BoardBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
   <%
   	 request.setCharacterEncoding("utf-8");
	
	BoardBean board = new BoardBean();
	
	
	board.setName(request.getParameter("name"));
	board.setPass(request.getParameter("pass"));
	board.setSubject(request.getParameter("subject"));
	board.setContent(request.getParameter("content"));

	
	BoardDAO boardDAO = new BoardDAO();
	int insertCount = boardDAO.insertBoard(board);
	
	
	if(insertCount > 0) {
		response.sendRedirect("notice.jsp");
	} else {
		%>
		<script>
			alert("글쓰기 실패!");
			history.back();
		</script>
		<%
	}

   
   %>
    
    
 

 
