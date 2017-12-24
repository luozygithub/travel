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
    
    <title>修改订票后台处理</title>
    
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
   		<br>
   		<%
   				 String id=(String)request.getParameter("id");
   				 String username=(String)request.getParameter("username");
   				 String traffic= (String)request.getParameter("traffic");
   				 String begain=(String)request.getParameter("begain");
   				 String end=(String)request.getParameter("end");
   				 String date=(String)request.getParameter("date");
   				 String time=new String( request.getParameter("time").getBytes("ISO-8859-1"),"UTF-8");
   				 Dbutil dbutil = new Dbutil();
		         String sql="update dingpiao set username='"+username+"',traffic='"+traffic+"',begain='"+begain+"',end='"+end+"',date='"+date+"',time='"+time+"' where id='"+id+"'";	   	
				Connection connection = dbutil.getCon();
				Statement statement = (Statement) connection.createStatement();
				statement.executeUpdate(sql);
				dbutil.closeCon( connection);
				statement.close();
				response.sendRedirect("changeTicket.jsp");
   		 %>
  </body>
</html>
