<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
	
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
				<input type="text" name="bookname" id ="sbook">
			</label>
			<br>
			
			<label> 청구기호
				<input type="text" name="num" id ="snum" >
			</label>
			
			<br>	
			
			<label> 저자명
				<input type="text" name="name"  id ="sname">
			</label>
			<br>
			
			<label> 발행처
				<input type="text" name="publisher" id ="spublisher" >
			</label>
			<br>
			
			<input type="submit" value="검색하기" class="btn">
			
		</form>


	<h2>찾으시는 자료가 없습니다.</h2>
		
		
		<div class="clear"></div>
		<!-- 푸터 들어가는곳 -->
		<jsp:include page="../inc/bottom.jsp"/>
		<!-- 푸터 들어가는곳 -->
	</div>
</body>
</html>

