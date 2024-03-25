<%@page import="com.dao.postDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@page import="com.dao.postDAO"%>
<%@page import="com.user.Post"%>

<%@page import="java.util.List"%>
<%@page import="com.db.DBconnection"%>



<%
UserDetails user4 = (UserDetails) session.getAttribute("userD");

if (user4 == null) {
	response.sendRedirect("Login.jsp");
	session.setAttribute("login-error", "please login..");
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit</title>
<%@include file="all_component/allcss.jsp"%>

</head>
<body>

	<%
	Integer noteid = Integer.parseInt(request.getParameter("note_id"));

	postDAO post = new postDAO(DBconnection.getConn());

	Post p = post.getDataById(noteid);
	%>


	<%@include file="all_component/navbar.jsp"%>




	<div class="container-fluid">
		<h4 class="text-center">Edit Your Notes</h4>

		<div class="container">

			<div class="row">
				<div class="col-md-12">


					<form action="NoteEditServlet" method="post">

						<input type="hidden" value=<%=noteid%> name="noteid">
						<div class="form-group">



							<label for="exampleInputEmail1">Edit Title</label> <input
								type="text" class="form-control" id="exampleInputEmail1"
								aria-describedby="emailHelp" name="title" required="required"
								value="<%=p.getTitle()%>">
						</div>


						<div class="form-group">
							<label for="exampleInputEmail1">Edit Note</label>
							<textarea rows="6" cols="" class="form-control" name="content"
								required="required"><%=p.getContent()%></textarea>

						</div>

						<div class="container text-center">
							<button type="submit" class="btn btn-primary">Add Notes</button>

						</div>

					</form>




				</div>

			</div>

		</div>

	</div>
	<%@include file="all_component/footer.jsp"%>




</body>
</html>