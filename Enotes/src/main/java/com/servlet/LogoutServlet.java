package com.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/LogoutServlet")
public class LogoutServlet extends HttpServlet {

	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		try {
			HttpSession session = req.getSession();
			session.removeAttribute("userD");
			session.setAttribute("logout-message", "Logout Sucessfull..");
			res.sendRedirect("Login.jsp");

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
