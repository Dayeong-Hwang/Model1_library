<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>IT 도서관 찾아오시는 길</title>
<link href="../css/default.css" rel="stylesheet" type="text/css">
<link href="../css/subpage.css" rel="stylesheet" type="text/css">
<link href="../css/map.css" rel="stylesheet" type="text/css">

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
				<li><a href="map.jsp">찾아오시는 길</a></li>

			</ul>
		</nav>
		<!-- 본문 내용 -->
		<article>
		
			<div>
				<p class="map_title">▣ IT 도서관 찾아오시는 길</p>
				<div>
				
						<!-- * 카카오맵 - 지도퍼가기 -->
						<!-- 1. 지도 노드 -->
						<div id="daumRoughmapContainer1648969035427" class="root_daum_roughmap root_daum_roughmap_landing"></div>
						
						<!--
							2. 설치 스크립트
							* 지도 퍼가기 서비스를 2개 이상 넣을 경우, 설치 스크립트는 하나만 삽입합니다.
						-->
						<script charset="UTF-8" class="daum_roughmap_loader_script" src="https://ssl.daumcdn.net/dmaps/map_js_init/roughmapLoader.js"></script>
						
						<!-- 3. 실행 스크립트 -->
						<script charset="UTF-8">
							new daum.roughmap.Lander({
								"timestamp" : "1648969035427",
								"key" : "29pen",
								"mapWidth" : "640",
								"mapHeight" : "360"
							}).render();
						</script>
				</div>
			</div>
			
		</article>


		<div class="clear"></div>
		<!-- 푸터 들어가는곳 -->
		<jsp:include page="../inc/bottom.jsp"/>
		<!-- 푸터 들어가는곳 -->
	</div>
</body>
</html>


