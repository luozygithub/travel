<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="java.sql.*" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'changedeal.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	

  </head>
  
  <body>
     <%
        	String username = request.getParameter("username");
        	String password = new String( request.getParameter("password").getBytes("UTF-8"),"UTF-8");
        	String realname = new String( request.getParameter("realname").getBytes("UTF-8"),"UTF-8");
        	String gender = new String( request.getParameter("gender").getBytes("UTF-8"),"UTF-8");
        	String tel = new String( request.getParameter("tel").getBytes("UTF-8"),"UTF-8");
        	String email = request.getParameter("email");
        	Class.forName("com.mysql.jdbc.Driver");
    	   	//String url="jdbc:mysql://localhost:3306;databasename=User";
    	   	String url="jdbc:mysql://localhost:3307/travel";
    	   	Connection conn=DriverManager.getConnection(url,"root","root");
    	   	Statement stmt=conn.createStatement();
    		String sql="update user set password='"+password+"',repassword='"+password+"',realname='"+realname+"' ,gender='"+gender+"' ,tel='"+tel+"',email='"+email+"' where username='"+username+"'";	   	
    	    stmt.executeUpdate(sql);
    	    stmt.close();
    	    conn.close();
    	    response.sendRedirect("userManagement.jsp");
        %>
  </body>
</html>
