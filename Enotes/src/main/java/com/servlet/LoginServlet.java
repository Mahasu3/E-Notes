package com.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.UserDAO;
import com.db.DBconnection;
import com.user.UserDetails;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		String email = req.getParameter("uemail");
		String password = req.getParameter("upassword");

		UserDetails us = new UserDetails();

		us.setEmail(email);
		us.setPassword(password);

		UserDAO ud = new UserDAO(DBconnection.getConn());

		UserDetails user = ud.loginUser(us);

		if (user != null) {
			HttpSession session = req.getSession();
			session.setAttribute("userD", user);
			res.sendRedirect("Home.jsp");

		} else {
			HttpSession session = req.getSession();
			session.setAttribute("login-fail", "Invalid Username and Password");
			res.sendRedirect("Login.jsp");
		}
	}

}
