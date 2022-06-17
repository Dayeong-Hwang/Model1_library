<%@page import="java.util.ArrayList"%>
<%@page import="book.BookDAO"%>
<%@page import="book.BookBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%
request.setCharacterEncoding("utf-8");

String bookname =request.getParameter("bookname");
String num =request.getParameter("num");
String name =request.getParameter("name");
String publisher =request.getParameter("publisher");

%>


<!DOCTYPE html>
<html>
<head> 
<meta charset="UTF-8">
<title>IT 도서관 도서 검색</title>
<link href="../css/default.css" rel="stylesheet" type="text/css">
<link href="../css/subpage.css" rel="stylesheet" type="text/css">
<link href="../css/subpage_search.css" rel="stylesheet" type="text/css">
<script src="../js/jquery-3.6.0.js"></script>
<script type="text/javascript">
	

</script>
</head>
<body>

	<div id="wrap">
		<!-- 헤더 들어가는곳 -->
		<jsp:include page="../inc/top.jsp"/>
		<!-- 헤더 들어가는곳 -->

		<!-- 본문들어가는 곳 -->
		<!-- 본문 메인 이미지 -->
		<div id="sub_img"></div>
		<!-- 왼쪽 메뉴 -->
		<nav id="sub_menu">
			<ul>
				<li><a href="bookSearch.jsp">도서검색</a></li>
<!-- 				<li><a href="#">Newsroom</a></li>
				<li><a href="#">Public Policy</a></li> -->
			</ul>
		</nav>
		<!-- 본문 내용 -->
		
	
		<h1>도서 <span id="ssearch">검색</span>하기&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</h1>	

		<form action="bookSearch_pro.jsp" method="post" id="fr">
		
		
			<label> 도서명
				<input type="text" name="bookname" id ="sbook" value="<%=bookname%>">
			</label>
			<br>
			
			<label> 청구기호
				<input type="text" name="num" id ="snum" value="<%=num%>">
			</label>
			
			<br>	
			
			<label> 저자명
				<input type="text" name="name"  id ="sname" value="<%=name%>">
			</label>
			<br>
			
			<label> 발행처
				<input type="text" name="publisher"  id ="spublisher" value="<%=publisher%>">
			</label>
			<br>
			
			<input type="submit" value="검색하기" class="btn">
			
		</form>


		<table id="bookSearch">

		<%
	
		BookDAO bookDAO = new BookDAO();
		ArrayList<BookBean> bookSearchList = bookDAO.searchList(bookname, num, name, publisher);
		
		if(!bookSearchList.isEmpty()){%>
		
				<tr>
					<th>청구기호</th>
					<th>도서명</th>
					<th>저자명</th>
					<th>발행처</th>
					<th>대여상태</th>
				</tr>
				
				<%for(BookBean bookList: bookSearchList){%>
					<tr>
						<td><%=bookList.getNum() %></td>
						<td><%=bookList.getBookname() %></td>
						<td><%=bookList.getName() %></td>
						<td><%=bookList.getPublisher() %></td>
						<td><%=bookList.getRental() %></td>
					</tr>

			
				<%
					}
				} else {%>	
				
				<tr id="stable" >
					<td>
						<h2>찾으시는 자료가 없습니다.</h2>
					</td>
				</tr>
				
				<%}%>		
			
			</table>
		
		
		<div class="clear"></div>
		<!-- 푸터 들어가는곳 -->
		<jsp:include page="../inc/bottom.jsp"/>
		<!-- 푸터 들어가는곳 -->
	</div>
</body>
</html>


