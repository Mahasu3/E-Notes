<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home Page</title>
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
						<i class="fa fa-sign-in" aria-hidden="true"></i>
						<h4>Login</h4>
					</div>


					<%
					String failmsg = (String) session.getAttribute("login-fail");

					if (failmsg != null) {
					%>

					<div class="alert alert-danger" role="alert"><%=failmsg%></div>

					<%
					session.removeAttribute("login-fail");

					}
					%>



					<%
					String withoutlogin = (String) session.getAttribute("login-error");
					if (withoutlogin != null) {
					%>

					<div class="alert alert-danger" role="alert"><%=withoutlogin%>
					</div>

					<%
					session.removeAttribute("login-error");

					}
					%>


					<%
					String logoutmsg = (String) session.getAttribute("logout-message");
					if (logoutmsg != null) {
					%>
					<div class="alert alert-success" role="alert"><%=logoutmsg%>


						<%
						session.removeAttribute("logout-message");

						}
						%>

						<div class="card-body">
							<form action="LoginServlet" method="post">

								<div class="form-group">
									<label for="exampleInputEmail1">Email</label> <input
										type="email" class="form-control" id="exampleInputEmail1"
										aria-describedby="emailHelp" placeholder="Enter email"
										name="uemail">

								</div>
								<div class="form-group">
									<label for="exampleInputPassword1">Password</label> <input
										type="password" class="form-control"
										id="exampleInputPassword1" placeholder="Password"
										name="upassword">
								</div>

								<button type="submit"
									class="btn btn-primary badge-pill btn-block">Login</button>
							</form>

						</div>
					</div>
				</div>
			</div>
		</div>

		<%@include file="all_component/footer.jsp"%>
</body>
</html>