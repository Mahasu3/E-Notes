package com.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.postDAO;
import com.db.DBconnection;

@WebServlet("/deleteServlet")
public class deleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		int noteid = Integer.parseInt(req.getParameter("note_id"));

		postDAO postdao = new postDAO(DBconnection.getConn());

		boolean flag = postdao.deleteNotes(noteid);
		HttpSession session = null;

		if (flag) {

			session = req.getSession();

			session.setAttribute("deletemessage", "Notes deleted sucessfully..");

			res.sendRedirect("showNotes.jsp");
		} else {
			session = req.getSession();
			session.setAttribute("deleteerror", "Notes not deleted some error ocurred");
			res.sendRedirect("showNotes.jsp");
		}

	}

}
