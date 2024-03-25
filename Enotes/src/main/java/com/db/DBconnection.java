package com.db;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBconnection {

	private static Connection conn;

	public static Connection getConn() {

		try {

			if (conn == null) {

				Class.forName("com.mysql.cj.jdbc.Driver");
				conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/enotes", "root", "root");

				System.out.println("conn suceesful");
			}

		} catch (Exception e) {

			e.printStackTrace();
		}

		return conn;
	}

}
