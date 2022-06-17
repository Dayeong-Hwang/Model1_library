<%@page import="question.QuestionDAO"%>
<%@page import="question.QuestionBean"%>
<%@page import="board.BoardBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>



<%
request.setCharacterEncoding("UTF-8");

String search = request.getParameter("search");
String searchType = request.getParameter("searchType");

//=============================페이징처리
int pageNum = 1;
if(request.getParameter("page") !=null){
	pageNum = Integer.parseInt(request.getParameter("page"));
}

int listLimt = 5;
int pageLimt = 5;


// 게시물 전체 갯수
QuestionDAO questionDAO = new QuestionDAO();
int listCount = questionDAO.selectSearchListCount(search, searchType);


int maxPage = (int)Math.ceil((double) listCount/ listLimt);
int startPage = ((int)((double)pageNum / pageLimt + 0.9)-1) * pageLimt + 1;
int endPage = startPage + pageLimt -1;

if(endPage > maxPage){
	endPage = maxPage;
}


//=======================================
ArrayList<QuestionBean> questionSearchList = questionDAO.selectSearchQuestionList(pageNum, listLimt, search, searchType);

//========================================


%>




<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>IT 도서관 자주하는 질문</title>
<link href="../css/default.css" rel="stylesheet" type="text/css">
<link href="../css/subpage.css" rel="stylesheet" type="text/css">
</head>
<body>
<%-- 
<%=search %> --%>
	<div id="wrap">
		<!-- 헤더 들어가는곳 -->
		<jsp:include page="../inc/top.jsp" />
		<!-- 헤더 들어가는곳 -->

		<!-- 본문들어가는 곳 -->
		<!-- 본문 메인 이미지 -->
		<div id="sub_img_center"></div>
		<!-- 왼쪽 메뉴 -->
		<nav id="sub_menu">
			<ul>
				<li><a href="../center/notice.jsp">공지사항</a></li>
				<li><a href="../question/question.jsp">자주하는 질문</a></li>
			</ul>
		</nav>
		<!-- 본문 내용 -->
		<article>
			<h1>question</h1>
			<table id="notice">
				<tr>
					<th class="tno">No.</th>
					<th class="ttitle">Title</th>
					<th class="twrite">Write</th>
					<th class="tdate">Date</th>
					<th class="tread">Read</th>
				</tr>
				
				
				<%for(QuestionBean question : questionSearchList){%>
							
							<tr onclick="location.href='question_content.jsp?num=<%=question.getNum()%>&page=<%=pageNum%>'">
								<td><%=question.getNum() %></td>
								<td class="left"><%=question.getSubject() %></td>
								<td><%=question.getName() %></td>
								<td><%=question.getDate() %></td>
								<td><%=question.getReadcount() %></td>
								
							</tr> 
				
						
					<%}%>
				
			</table>
			<div id="table_search">
				<input type="button" value="글쓰기" class="btn" onclick="location.href='question_write.jsp'">
			</div>
			<div id="table_search">
				<form action="question_search.jsp" method="get">
					<select name="searchType">
						<option value="subject" >제목</option>
						<option value="name" <%if(searchType.equals("name")) {%> selected="selected" <%} %>>작성자</option>
					</select>
					<input type="text" name="search" class="input_box" value="<%=search%>">
					<input type="submit" value="Search" class="btn">
				</form>
			</div>

			<div class="clear"></div>
			<div id="page_control">
			
						
				
				<%if(pageNum > 1) { %>
				<a href="question.jsppage=<%=pageNum - 1%>">이전</a>
				<%} else { %>
					이전&nbsp;
				<%} %>
			
			
				<%for(int i = startPage; i <= endPage; i++) { %>
					<%if(pageNum == i) { %>
						&nbsp;&nbsp;<%=i %>&nbsp;&nbsp;
					<%} else { %>
						<a href="question.jsppage=<%=i%>"><%=i %></a>
					<%} %>
				<%} %>
				
				
				
				
				<%if(pageNum < maxPage) { %>
					<a href="question.jsppage=<%=pageNum + 1%>">다음</a>
				<%} else { %>
					&nbsp;다음
				<%} %>
				
				
			</div>
		</article>

		<div class="clear"></div>
		<!-- 푸터 들어가는곳 -->
		<jsp:include page="../inc/bottom.jsp" />
		<!-- 푸터 들어가는곳 -->
	</div>
</body>
</html>


