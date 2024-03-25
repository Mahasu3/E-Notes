<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
UserDetails user2 = (UserDetails) session.getAttribute("userD");

if (user2 == null) {
	response.sendRedirect("Login.jsp");
	session.setAttribute("login-error", "please login..");
}
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="all_component/allcss.jsp"%>
</head>
<body>


	<div class="container-fluid p-0">
		<%@include file="all_component/navbar.jsp"%>
		<div class="card mt-3 py-4">
			<div class="card-body text-center">
				<img alt="" src="image/enotetakenote.jpg" class="img-fluid mx-auto"
					style="max-width: 280px;">
				<h3>Start taking your Notes</h3>
				<a href="addNotes.jsp" class="btn btn-primary">Start Here</a>
			</div>
		</div>
	</div>



	<%@include file="all_component/footer.jsp"%>

</body>
</html>