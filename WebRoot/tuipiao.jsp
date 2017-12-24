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
    
    <title>退票</title>
    
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
   		 		String id= request.getParameter("id");
   	 			Dbutil dbutil = new Dbutil();
				String sql = "delete from dingpiao where id='"+id+"'";
				Connection connection = dbutil.getCon();
				Statement statement = (Statement) connection.createStatement();
				statement.executeUpdate(sql);
				connection.close();
				statement.close();
				response.sendRedirect("dingdanQuery.jsp");
				
   		 %>
		    	
  </body>
</html>
