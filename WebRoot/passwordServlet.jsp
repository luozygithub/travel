<%@page import="cn.edu.ldu.util.Dbutil"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>修改密码后台处理</title>
    
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
<br/>
    <%
    
    

    	String password=(String) request.getParameter("password");   	
		String name=(String)application.getAttribute("username");

  	  	Dbutil dbutil = new Dbutil();
		String sql = "update user set password='"+password+"' where username='"+name+"' ";
		Connection connection = dbutil.getCon();
		Statement statement = (Statement) connection.createStatement();
		int result = statement.executeUpdate(sql);
		out.println("修改成功");
		dbutil.closeCon( connection);
		statement.close();
		
	%>
  </body>
</html>
