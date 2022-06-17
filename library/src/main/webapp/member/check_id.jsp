<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
  <%
  	String id = request.getParameter("id");
	String isDuplicate = request.getParameter("duplicate");
  %> 
  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript">

	function useId(id) {
		window.opener.document.fr.id.value = id;
		window.opener.checkIdResult = true;
		window.close();
	}
	
	
	
	function checkId() {
		var divCheckIdResult = document.getElementById("checkIdResult");
		var id = document.getElementById("id").value;
		
		var regex = /^[A-Za-z0-9]{4,16}$/;
		
		if(!regex.exec(id)) { 
			divCheckIdResult.innerHTML = "4 ~ 16자리 영문자,숫자 조합!";
			divCheckIdResult.style.color = "RED";
			return false; 
		} else {
			divCheckIdResult.innerHTML = "";
			return true; 
		}
	}
	
	
</script>
</head>
<body>

<h1>아이디 중복 체크</h1>
	<form action="check_id_pro.jsp" onsubmit="return checkId()">
		<input type="text" name="id" id="id" required="required" placeholder="영문,숫자 4~16 글자" <%if(id !=null){%> value="<%=id %>" <%} %>>
		<input type="submit" value="중복확인">
	</form>
	<div id="checkIdResult">
	
	<%if(isDuplicate != null && isDuplicate.equals("true")){%>
		<br> 이미 사용 중인 아이디 입니다.
		<%} else if (isDuplicate != null && isDuplicate.equals("false")) {%> 
		<br>사용 가능한 아이디 입니다.<br>
		<input type="button" value="아이디 사용" onclick="useId('<%=id%>')">
		<%} %>
	</div>

</body>
</html>