package com.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.postDAO;
import com.db.DBconnection;

@WebServlet("/AddNotesServlet")
public class AddNotesServlet extends HttpServlet {

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		int uid = Integer.parseInt(req.getParameter("uid"));
		String title = req.getParameter("title");
		String content = req.getParameter("content");

		postDAO podao = new postDAO(DBconnection.getConn());
		boolean flag = podao.AddNotes(title, content, uid);

		if (flag) {
			System.out.println("notes inserted sucessfully");
			res.sendRedirect("showNotes.jsp");
		} else {
			System.out.println("notes not inserted");
		}

	}

}
