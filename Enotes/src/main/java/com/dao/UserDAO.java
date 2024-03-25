package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.user.UserDetails;

public class UserDAO {

	private Connection conn;

	public UserDAO(Connection conn) {

		this.conn = conn;

	}

	public boolean addUser(UserDetails u) {

		boolean flag = false;

		try {
			String query = "insert into user(name,email,password) values(?,?,?)";

			PreparedStatement ps = conn.prepareStatement(query);

			ps.setString(1, u.getName());
			ps.setString(2, u.getEmail());
			ps.setString(3, u.getPassword());

			int i = ps.executeUpdate();

			if (i == 1) {
				flag = true;

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return flag;

	}

	public UserDetails loginUser(UserDetails us) {

		UserDetails user = null;

		try {
			String query = "select * from user where email=? and password=?";

			PreparedStatement ps = conn.prepareStatement(query);
			ps.setString(1, us.getEmail());
			ps.setString(2, us.getPassword());
			ResultSet rs = ps.executeQuery();

			if (rs.next()) {

				user = new UserDetails();
				user.setId(rs.getInt("id"));
				user.setName(rs.getString("name"));
				user.setEmail(rs.getString("email"));
				user.setPassword("password");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return user;
	}

}
