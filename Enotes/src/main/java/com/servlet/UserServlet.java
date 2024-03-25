package com.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.UserDAO;
import com.user.UserDetails;
import com.db.*;

@WebServlet("/Userservlet")
public class UserServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String name = req.getParameter("fname");
		String email = req.getParameter("uemail");
		String password = req.getParameter("upassword");

		UserDetails us = new UserDetails();

		us.setName(name);
		us.setEmail(email);
		us.setPassword(password);

		UserDAO dao = new UserDAO(DBconnection.getConn());
		boolean flag = dao.addUser(us);

		HttpSession session;

		if (flag) {

			session = req.getSession();
			session.setAttribute("reg-sucess", "Registration Sucessfull..");
			resp.sendRedirect("Register.jsp");
		} else {

			session = req.getSession();
			session.setAttribute("reg-fail", "Registration Failed..");
			resp.sendRedirect("Register.jsp");

		}

	}

}
