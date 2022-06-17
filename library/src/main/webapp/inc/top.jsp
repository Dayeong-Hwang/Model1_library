<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
String id = (String)session.getAttribute("sId");


%>   
    
<header>
  <!-- login join -->
  <div id="login">
  
  <% if(id == null) { %>
	  <a href="../member/login.jsp">로그인</a> | <a href="../member/join.jsp">회원가입</a>
  <%} else { %>
	  <a href="../member/member_info.jsp"><%=id %>님</a> | <a href="../member/logout.jsp">로그아웃</a>
  
  		<%if(id.equals("admin")) { %>
  			| <a href="../admin/admin.jsp">관리자페이지</a>
  		<%} %>
  	<%} %>

   </div>
  <div class="clear"></div>
  <!-- 로고들어가는 곳 -->
  <div id="logo"><a href="../main/main.jsp"><img src="../images/logo.png"></a></div>
  <!-- 메뉴들어가는 곳 -->
  <nav id="top_menu">
  	<ul>
  		<li><a href="../main/main.jsp">홈</a></li>
  		<li><a href="../company/introduce.jsp">도서관 소개</a></li>
  		<li><a href="../search/bookSearch.jsp">자료검색</a></li>
  		<li><a href="../center/notice.jsp">열린공간</a></li>
  		<li><a href="../map/map.jsp">찾아오시는 길</a></li>
  	</ul>
  </nav>
</header>