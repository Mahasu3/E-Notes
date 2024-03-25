<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@page import="java.sql.Connection" %>
		<%@page import="com.db.DBconnection" %>
	
<!DOCTYPE html>
<html>
<head>


<meta charset="UTF-8">
<title>home page</title>
<%@include file="all_component/allcss.jsp"%>
<style type="text/css">
.back-img {
	background-image: url("image/Enotesprojectbgimage.jpg");
	height: 80vh;
	width: 100%;
	background-repeat: no-repeat;
	background-size: cover;
}
</style>
</head>
<body>

	<%@include file="all_component/navbar.jsp"%>
	
	

	<div class="container-fluid back-img">
		<div class="text-center">
			<h2 class="text-white">
				<i class="fa fa-book" aria-hidden="true"></i>E-Notes-Save Your Notes
			</h2>
			<a href="Login.jsp" class="btn btn-light"><i
				class="fa fa-sign-in" aria-hidden="true"></i>Login</a>
		 <a
				href="Register.jsp" class="btn btn-light"><i
				class="fa fa-user-plus" aria-hidden="true"></i>Register</a>

		</div>
	</div>

	<%@include file="all_component/footer.jsp"%>
</body>
</html>