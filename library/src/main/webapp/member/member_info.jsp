<%@page import="member.MemberBean"%>
<%@page import="member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%

	String id = (String)session.getAttribute("sId");

	MemberDAO memberDAO = new MemberDAO();
	MemberBean member = memberDAO.selectMemberInfo(id);
	
	String[] arrAdress = member.getAddress().split("_");

%>




<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보</title>
<link href="../css/default.css" rel="stylesheet" type="text/css">
<link href="../css/subpage.css" rel="stylesheet" type="text/css">
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"  ></script>
<script src="../js/jquery-3.6.0.js"></script>
<script type="text/javascript">

function openCheckPostWindow() {
	
	new daum.Postcode({
       oncomplete: function(data) {
 		
       	
       	var addr = ''; // 주소변수
       	var extraAddr = ''; //참고항목 변수
       	
       	
       	// 사용자가 선택한 주소 타입에 따라서 주소값 가져오기
       	
     		  if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                  addr = data.roadAddress;
              } else { // 사용자가 지번 주소를 선택했을 경우(J)
                  addr = data.jibunAddress;
              }
       	
     		 // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
               if(data.userSelectedType === 'R'){
             // 법정동명이 있을 경우 추가한다. (법정리는 제외)
            // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
       	
               	if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                       extraAddr += data.bname;
                   }
                   // 건물명이 있고, 공동주택일 경우 추가한다.
                   if(data.buildingName !== '' && data.apartment === 'Y'){
                       extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                   }
                   // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                   if(extraAddr !== ''){
                       extraAddr = ' (' + extraAddr + ')';
                   }	             
	                // 조합된 참고항목을 해당 필드에 넣는다.
	                   document.getElementById("address2").value = extraAddr;
	               
	               } else {
	                   document.getElementById("address2").value = '';
	               }
	            
	               // 우편번호와 주소 정보를 해당 필드에 넣는다.
	               document.getElementById('post_code').value = data.zonecode;
	               document.getElementById("address1").value = addr;
	               // 커서를 상세주소 필드로 이동한다.
	               document.getElementById("address2").focus();
	        }
	
	    }).open();
}
	

//========================================================================
function checkEmail(email) {
	var regex = /^[A-Za-z0-9-_.]+@[A-Za-z0-9-]+\.[A-Za-z0-9-]+(\.[A-Za-z0-9-]+)*$/;
	var emailId = document.getElementById("email");
	if(!regex.exec(email)) {
		alert(email + " : 이메일 양식을 확인해주세요");
		emailId.value = null; // 자바스크립트
	} 
}

function checkPhone(phone) {
	var regex = /^(02|051|053|032|062|042|052|044|031|033|043|041|063|061|054|055|064)-?[0-9]{3,4}-?[0-9]{4}$/;
	var phoneId = document.getElementById("phone");
	if(!regex.exec(phone)) {
		alert("정확한 전화번호를 입력해주세요");
	
		$('#phone').val(''); //제이쿼리로 처리
		
	} else {
		var NaNRegex = /\D/g; 
		phoneId.value = phone.replace(NaNRegex, ""); 
	}
	
}

function checkMobile(mobile) {
	var regex = /^(010|011|016)-?[0-9]{3,4}-?[0-9]{4}$/;
	var mobileId = document.getElementById("mobile");
	if(!regex.exec(mobile)) {
		alert("정확한 휴대폰번호를 입력해주세요");
		$('#mobile').val('');	

	} else {
		var NaNRegex = /\D/g; 
		mobileId.value = mobile.replace(NaNRegex, "");
	}
	
}


</script>
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
		  		<li><a href="../member/member_info.jsp">회원정보</a></li>
<!-- 		  		<li><a href="#">아이디찾기</a></li>
		  		<li><a href="#">비밀번호찾기</a></li> -->
		  	</ul>
		  </nav>
		  <!-- 본문 내용 -->
		  <article>
		  	<h1>Member Info</h1>
		  	<form action="member_update.jsp" method="post" id="join" name="fr" onsubmit="return checkSubmit()">
		  		<fieldset>
		  			<legend></legend>
					<label>아이디</label>
		  			<input type="text" name="id" class="id" id="id" value="<%=id %>" readonly="readonly" >
		  			<br>
		  			
		  			<label>비밀번호</label>
		  			<input type="password" name="pass" id="pass" placeholder="변경할 비밀번호"><br> 			
		  			
		  			<label>비밀번호 확인</label>
		  			<input type="password" name="pass2" onkeyup="checkRetypePass(this.value)">
		  			<span id="checkRetypePassResult"></span><br>
		  			
		  			
		  			<label>이름</label>
		  			<input type="text" name="name" id="name" value="<%=member.getName() %>" ><br>
		  			
		  			<label>E-Mail</label>
		  			<input type="email" name="email" id="email" value="<%=member.getEmail() %>" onblur="checkEmail(this.value)"><br>
		  		</fieldset>
		  		
				<fieldset>
		  			<legend>추가정보</legend>
		  			<label>우편번호</label>
		  			<input type="text" name="post_code" id="post_code" readonly="readonly" value="<%=arrAdress[0] %>">
		  			<input type="button" value="검색" class="dup" onclick="openCheckPostWindow()"><br>
		  			<label>주소</label>
		  			<input type="text" name="address1" id="address1" value="<%=arrAdress[1] %>">
		  			<input type="text" name="address2" id="address2" value="<%=arrAdress[2] %>"><br>
		  			<label>전화번호</label>
		  			<input type="text" name="phone" value="<%=member.getPhone() %>"  id="phone" onblur="checkPhone(this.value)"><br>
		  			<label>휴대폰번호</label>
		  			<input type="text" name="mobile" value="<%=member.getMobile() %>" id="mobile" onblur="checkMobile(this.value)" ><br>
		  		</fieldset>
		  		<div class="clear"></div>
		  		<div id="buttons">
		  			<input type="submit" value="수정하기" class="submit">
		  			<input type="reset" value="취소하기" class="cancel">
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


