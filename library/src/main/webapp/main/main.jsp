<%@page import="question.QuestionDAO"%>
<%@page import="question.QuestionBean"%>
<%@page import="board.BoardBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>IT 도서관</title>
<link href="../css/default.css" rel="stylesheet" type="text/css">
<link href="../css/front.css" rel="stylesheet" type="text/css">

<script type="text/javascript">
	function pop() {
		window.open("pop.jsp","","resizable=no, status=no, toolbar=no, menubar=no, width=500, height=540,left=150, top=100, scrollbars=no");
	}
</script>
</head>

<body onload="pop()">
	<div id="wrap">
		<!-- 헤더 들어가는곳 -->
		<jsp:include page="../inc/top.jsp"/>
		<!-- 헤더 들어가는곳 -->
		  
		<div class="clear"></div>   
		<!-- 본문들어가는 곳 -->
		<!-- 메인 이미지 -->
		<div id="main_img"><img src="../images/main_img.png"></div>
		<!-- 본문 내용 -->
		<article id="front">
		  	<div id="solution">
		  		<!-- <div id="hosting">
		  			<h3>Web Hosting Solution</h3>
					<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
		  		</div>
		  		<div id="security">
		  		  	<h3>Web Security Solution</h3>
					<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
		  		</div>
		  		<div id="payment">
		  			<h3>Web Payment Solution</h3>
					<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
		  		</div> -->
		  	</div>
		  	<div class="clear"></div>
			<div id="news_notice">
				<h3 >  &nbsp; &nbsp; 공지사항 <!-- <span class="orange">Security</span> News --></h3>
				<table>
					<%
				
					BoardDAO boardDAO = new BoardDAO();
					ArrayList<BoardBean> boardList = boardDAO.selectRecentBoardList();
					
					for( BoardBean board : boardList){	%>
						<tr>
							<td width="320" class="contxt"  onclick="location.href='../center/notice_content.jsp?num=<%=board.getNum()%>&page=1'"><%=board.getSubject() %> </td>
							<td width="80"><%=board.getName() %></td>
							<td width="80"><%=board.getDate() %></td>
						</tr>
					<%}%>
				
				
				</table>
			</div>
		
			<div id="news_notice">
		  		<h3 class="brown">&nbsp;자주하는 질문&nbsp;</h3>
				<table>
				
				
				<%
					QuestionDAO questionDAO = new QuestionDAO();
					ArrayList<QuestionBean> questionList = questionDAO.selectRecentquestionList();
					
					for(QuestionBean question : questionList){ %>
						
						<tr>
							<td width="320" class="contxt"  onclick="location.href='../question/question_content.jsp?num=<%=question.getNum()%>&page=1'"><%=question.getSubject() %></td>
							<td width="80"><%=question.getName() %></td>
							<td width="80"><%=question.getDate() %></td>
						</tr>
					
					<%}%>
				</table>
		  	</div>
	  	</article>
		  
		<div class="clear"></div>  
		<!-- 푸터 들어가는곳 -->
		<jsp:include page="../inc/bottom.jsp"/>
		<!-- 푸터 들어가는곳 -->
	</div>
</body>
</html>


