<%@page import="board.BoardBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
	
<%
int pageNum = 1;

if(request.getParameter("page") != null){
	pageNum = Integer.parseInt(request.getParameter("page"));
}


int listLimit = 10; 
int pageLimit = 10; 

BoardDAO boardDAO = new BoardDAO();
int listCount = boardDAO.selectListCount();

int maxPage = (int)Math.ceil((double)listCount / listLimit);
int startPage = ((int)((double)pageNum / pageLimit + 0.9) - 1) * pageLimit + 1;
int endPage = startPage + pageLimit - 1;


if(endPage > maxPage) {
	endPage = maxPage;
}



ArrayList<BoardBean> boardList = boardDAO.selectBoardList(pageNum, listLimit);




%>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>IT 도서관 공지사항</title>
<link href="../css/default.css" rel="stylesheet" type="text/css">
<link href="../css/subpage.css" rel="stylesheet" type="text/css">
</head>
<body>
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
				<li><a href="notice.jsp">공지사항</a></li>
				<li><a href="../question/question.jsp">자주하는 질문</a></li>
			</ul>
		</nav>
		<!-- 본문 내용 -->
		<article>
			<h1>Notice</h1>
			<table id="notice">
				<tr>
					<th class="tno">No.</th>
					<th class="ttitle">Title</th>
					<th class="twrite">Write</th>
					<th class="tdate">Date</th>
					<th class="tread">Read</th>
				</tr>
				
				
				<%
					for(BoardBean board : boardList) {%>
							<tr onclick="location.href='notice_content.jsp?num=<%=board.getNum()%>&page=<%=pageNum%>'">
								<td><%=board.getNum() %></td>
								<td class="left"><%=board.getSubject() %></td>
								<td><%=board.getName() %></td>
								<td><%=board.getDate() %></td>
								<td><%=board.getReadcount() %></td>
							</tr> 
				<%}%>
				
				
			</table>
			<div id="table_search">
				<input type="button" value="글쓰기" class="btn" onclick="location.href='notice_write.jsp'">
			</div>
			<div id="table_search">
				<form action="notice_search.jsp" method="get">
					<select name="searchType">
						<option value="subject">제목</option>
						<option value="name">작성자</option>
					</select>
					<input type="text" name="search" class="input_box">
					<input type="submit" value="Search" class="btn">
				</form>
			</div>

			<div class="clear"></div>
			<div id="page_control">
			
			
				<%if(pageNum > 1) { %>
				<a href="notice.jsp?page=<%=pageNum - 1%>">이전</a>
				<%} else { %>
					이전&nbsp;
				<%} %>
			
			
				<%for(int i = startPage; i <= endPage; i++) { %>
					<%if(pageNum == i) { %>
						&nbsp;&nbsp;<%=i %>&nbsp;&nbsp;
					<%} else { %>
						<a href="notice.jsp?page=<%=i%>"><%=i %></a>
					<%} %>
				<%} %>
				
				
				
				
				<%if(pageNum < maxPage) { %>
					<a href="notice.jsp?page=<%=pageNum + 1%>">다음</a>
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


