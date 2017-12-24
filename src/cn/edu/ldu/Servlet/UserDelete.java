package cn.edu.ldu.Servlet;

import java.sql.*;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
public class UserDelete extends HttpServlet {

	public UserDelete() {
		super();
	}

	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("this is deleteServlet");
		String username = request.getParameter("username");

		try {
			Class.forName("com.mysql.jdbc.Driver");

			// String url="jdbc:mysql://localhost:3306;databasename=User";
			String url = "jdbc:mysql://localhost:3307/travel";
			Connection conn;

			conn = DriverManager.getConnection(url, "root", "root");

			Statement stmt;

			stmt = conn.createStatement();

			String sql = "delete from user where username='" + username + "'";

			stmt.executeUpdate(sql);

			stmt.close();

			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		response.sendRedirect("userManagement.jsp");
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		this.doGet(request, response);
	}

	public void init() throws ServletException {
		// Put your code here
		System.out.println("this is deleteServlet");
	}

}
