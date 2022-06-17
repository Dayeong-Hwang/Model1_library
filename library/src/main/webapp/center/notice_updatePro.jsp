<%@page import="board.BoardDAO"%>
<%@page import="board.BoardBean"%>
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


BoardBean board = new BoardBean(num,name,pass,subject,content);

BoardDAO boardDAO = new BoardDAO();
int updateCount = boardDAO.updateBoard(board);



if(updateCount > 0) {
	response.sendRedirect("notice_content.jsp?num=" + num + "&page=" + pageNum);
} else {
	%>
	<script>
		alert("글 수정 실패!");
		history.back(); 
	</script>
	<%
}
	
%>    
