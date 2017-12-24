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
public class ChangeUserInfo extends HttpServlet {

	public ChangeUserInfo() {
		super();
	}


	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}


	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String name = request.getParameter("name");
    	String info = new String( request.getParameter("info").getBytes("UTF-8"),"UTF-8");
    	String sex = new String( request.getParameter("sex").getBytes("UTF-8"),"UTF-8");
    	String date = new String( request.getParameter("date").getBytes("UTF-8"),"UTF-8");
    	String provinces = new String( request.getParameter("provinces").getBytes("UTF-8"),"UTF-8");
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
		String sql="update userinfo set name='"+name+"',info='"+info+"',sex='"+sex+"' ,date='"+date+"' ,provinces='"+provinces+"'  where name='"+name+"'";	   	
	    stmt.executeUpdate(sql);
	    stmt.close();
	    conn.close();
	   }catch (Exception e) {
			// TODO: handle exception
		}
		    response.sendRedirect("Changeinfo.jsp");
		
		}


	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.doGet(request, response);

	}

	public void init() throws ServletException {
		// Put your code here
	}

}
