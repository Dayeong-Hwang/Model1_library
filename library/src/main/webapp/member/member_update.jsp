<%@page import="member.MemberDAO"%>
<%@page import="member.MemberBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");

MemberBean member = new MemberBean();


member.setId(request.getParameter("id"));
member.setPass(request.getParameter("pass"));
member.setName(request.getParameter("name"));
member.setEmail(request.getParameter("email"));
member.setAddress(request.getParameter("post_code") +"_"+ request.getParameter("address1")+"_"+request.getParameter("address2"));
member.setPhone(request.getParameter("phone"));
member.setMobile(request.getParameter("mobile"));


MemberDAO memberDAO = new MemberDAO();
int updateCount = memberDAO.updateMember(member);


if(updateCount > 0) {
	%>
	<script>
		alert("수정 완료!");
		location.href = "member_info.jsp";
	</script>
	<%
} else {
	%>
	<script>
		alert("정보 수정 실패!");
		history.back();
	</script>
	<%
}
%>



