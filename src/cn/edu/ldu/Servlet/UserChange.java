package cn.edu.ldu.Servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
public class UserChange extends HttpServlet {

	
	public UserChange() {
		super();
	}


	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}


	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username = request.getParameter("username");
    	String password = new String( request.getParameter("password").getBytes("UTF-8"),"UTF-8");
    	String realname = new String( request.getParameter("realname").getBytes("UTF-8"),"UTF-8");
    	String gender = new String( request.getParameter("gender").getBytes("UTF-8"),"UTF-8");
    	String tel = new String( request.getParameter("tel").getBytes("UTF-8"),"UTF-8");
    	String email = request.getParameter("email");
    	try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
	   	//String url="jdbc:mysql://localhost:3306;databasename=User";
	   try{	
		   String url="jdbc:mysql://localhost:3307/travel";
	   	Connection conn=DriverManager.getConnection(url,"root","root");
	   	Statement stmt=conn.createStatement();
		String sql="update user set password='"+password+"',repassword='"+password+"',realname='"+realname+"' ,gender='"+gender+"' ,tel='"+tel+"',email='"+email+"' where username='"+username+"'";	   	
	    stmt.executeUpdate(sql);
	    stmt.close();
	    conn.close();
	   }catch (Exception e) {
		// TODO: handle exception
	}
	    response.sendRedirect("userManagement.jsp");
	
	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.doGet(request, response);
	}
	public void init() throws ServletException {
		// Put your code here
	}

}
