<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<link href="../css/default.css" rel="stylesheet" type="text/css">
<link href="../css/subpage.css" rel="stylesheet" type="text/css">
</head>
<body>
	<div id="wrap">
		<!-- 헤더 들어가는곳 -->
		<jsp:include page="../inc/top.jsp"/>
		<!-- 헤더 들어가는곳 -->
		  
		<!-- 본문들어가는 곳 -->
		  <!-- 본문 메인 이미지 -->
		  <div id="sub_img_member"></div>
		  <!-- 왼쪽 메뉴 -->
		  <nav id="sub_menu">
		  	<ul>
		  		<li><a href="../member/login.jsp">로그인</a></li>
	<!-- 	  		<li><a href="#">아이디찾기</a></li>
		  		<li><a href="#">비밀번호찾기</a></li> -->
		  	</ul>
		  </nav>
		  <!-- 본문 내용 -->
		  <article>
		  	<h1>Login</h1>
		  	<form action="loginPro.jsp" method="post" id="join">
		  		<fieldset>
		  			<legend></legend>
		  			<label>아이디</label>
		  			<input type="text" name="id"><br>
		  			
		  			<label>비밀번호</label>
		  			<input type="password" name="pass"><br>
		  		</fieldset>
		
		  		<div class="clear"></div>
		  		<div id="buttons">
		  			<input type="submit" value="로그인" class="submit">
		  			<input type="reset" value="취소" class="cancel">
		  		</div>
		  	</form>
		  </article>
		  
		  
		<div class="clear"></div>  
		<!-- 푸터 들어가는곳 -->
		<jsp:include page="../inc/bottom.jsp"/>
		<!-- 푸터 들어가는곳 -->
	</div>
</body>
</html>


