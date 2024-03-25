<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Register page</title>
<style>
body {
	background-image: linear-gradient(to right top, #654256, #6b5168, #716079, #766f88,
		#7c7e96, #79839b, #77899e, #758ea1, #698b9b, #5e8893, #558589, #50817e
		);
}
</style>
<%@include file="all_component/allcss.jsp"%>
</head>
<body>
	<%@include file="all_component/navbar.jsp"%>


	<div class="container-fluid">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card mt-2 mb-2">
					<div class="card-header text-center text-white bg-custom">
						<i class="fa fa-user-plus fa-2x" aria-hidden="true"></i>
						<h4>Registration</h4>
					</div>



					<%
					String regmsg = (String) session.getAttribute("reg-sucess");

					if (regmsg != null) {
					%>

					<div class="alert alert-sucess" role="alert">
						<%=regmsg%>to Login<a href="Login.jsp">click here</a>
					</div>

					<%
					}
					%>


					<%
					String failmsg = (String) session.getAttribute("reg-fail");

					if (failmsg != null) {
					%>

					<div class="alert alert-danger" role="alert"><%=failmsg%></div>

					<%
					}
					%>



					<div class="card-body">
						<form action="Userservlet" method="post">
							<div class="form-group">
								<label for="exampleInputEmail1">Name</label> <input type="text"
									class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" name="fname"
									placeholder="Enter name">

							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Email address</label> <input
									type="email" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" name="uemail"
									placeholder="Enter email">

							</div>
							<div class="form-group">
								<label for="exampleInputPassword1"> Password</label> <input
									type="password" class="form-control" id="exampleInputPassword1"
									placeholder="Password" name="upassword">
							</div>

							<button type="submit"
								class="btn btn-primary badge-pill btn-block">Register</button>
						</form>

					</div>
				</div>
			</div>
		</div>
	</div>

	<%@include file="all_component/footer.jsp"%>
</body>
</html>