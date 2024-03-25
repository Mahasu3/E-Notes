<%@page import="com.db.DBconnection"%>
<%@page import="com.dao.postDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.dao.postDAO"%>
<%@page import="com.user.Post"%>

<%@page import="java.util.List"%>



<%
UserDetails user3 = (UserDetails) session.getAttribute("userD");

if (user3 == null) {
	response.sendRedirect("Login.jsp");
	session.setAttribute("login-error", "please login..");
}
%>




<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Show Notes</title>
<%@include file="all_component/allcss.jsp"%>

</head>
<body>


	<%@include file="all_component/navbar.jsp"%>

	<%
	String updmsg = (String) session.getAttribute("deletemessage");
	if (updmsg != null) {
	%>

	<div class="alert alert-success" role="alert"><%=updmsg%></div>

	<%
	session.removeAttribute("updatemessage");
	}
	%>


	<%
	String upderrormsg = (String) session.getAttribute("deleteerror");
	if (upderrormsg != null) {
	%>

	<div class="alert alert-danger" role="alert"><%=upderrormsg%></div>

	<%
	session.removeAttribute("deleteerror");
	}
	%>
	

	<div class="container">
		<h4 class="text-center">All Notes:</h4>



		<div class="row">
			<div class="col-md-12">

				<%
				if (user3 != null) {
					postDAO ob = new postDAO(DBconnection.getConn());

					List<Post> post = ob.getData(user3.getId());

					for (Post p : post) {
				%>


				<div class="card mt-3">
					<img alt="" src="image/no.jpg" class="card-img-top mt-2 mx-auto"
						style="max-width: 100px;">
					<div class="card-body p-3">


						<h4 class="card-title "><%=p.getTitle()%></h4>
						<p><%=p.getContent()%></p>

						<p>
							<b class="text-sucess">Name:<%=user3.getName()%></b><br /> <b
								class="text-primary"> </b>
						</p>



						<p></p>

						<p>

							<b class="text-success">Date:<%=p.getPdate()%></b><br /> <b
								class="text-success"></b>


						</p>




						<div class="container text-center mt-2">
							<a href="deleteServlet?note_id=<%=p.getId()%>"
								class="btn btn-danger">Delete</a> <a
								href="edit.jsp?note_id=<%=p.getId()%>" class="btn btn-primary">Edit</a>

						</div>





					</div>
				</div>





				<%
				}
				}
				%>




			</div>






		</div>
	</div>

	<%@include file="all_component/footer.jsp"%>
</body>
</html>