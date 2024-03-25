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

@WebServlet("/NoteEditServlet")
public class NoteEditServlet extends HttpServlet {

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		try {
			Integer noteid = Integer.parseInt(req.getParameter("noteid"));

			String title = req.getParameter("title");

			String content = req.getParameter("content");

			postDAO dao = new postDAO(DBconnection.getConn());

			boolean flag = dao.postUpdate(noteid, title, content);

			if (flag) {
				System.out.println("data updated sucessfully");

				HttpSession session = req.getSession();

				session.setAttribute("updatemessage", "Notes updates Suscessfully..");
				res.sendRedirect("showNotes.jsp");
			} else {
				System.out.println("error occurred in data updating");

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
