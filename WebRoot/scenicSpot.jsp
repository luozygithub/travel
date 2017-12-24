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
    
    <title >景点</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link href="css/style.css" rel="stylesheet" type="text/css" />

  </head>
  
    
  <body  background="images/003.jpg" style="background-size:100% 100%; background-repeat;">
    	<br>
    	<%
    			String username=(String)application.getAttribute("username");
    			String end ="";
   				
				
				
		    	Dbutil dbutil = new Dbutil();
				String sql = "select end from dingpiao";
				Connection connection = dbutil.getCon();
				Statement statement = (Statement) connection.createStatement();
				ResultSet rs= statement.executeQuery(sql);
					
	%>
	<center>

			<h1 style="color:white">旅途景点</h1>
			<%
				if(rs.next()){
			 %>
		
			
			<%
				end=rs.getString("end");
					
		
		//response.sendRedirect("buyticketServlet.jsp");
			
			 	Dbutil dbutil2 = new Dbutil();
		
			  	String sql2 = "select * from scenic_spot";
				Connection connection2 = dbutil2.getCon();
				Statement statement2 = (Statement) connection2.createStatement();
				 ResultSet rs2= statement.executeQuery(sql2);
	
	 	%>
	<center>
	
			<%
				while(rs2.next()){
			 %>
		
				<h2><a href="<%=rs2.getString("link") %>"><%=rs2.getString("place") %></a></h3>
			<%
				}
			 %>
	</center>
	<% 
			
				statement2.execute(sql2); 
				dbutil2.closeCon(connection2);
				statement2.close(); 
			
	%>
			<%} %>	
			
				
			 
	</center>
	<%
			connection.close();
			rs.close();
			statement.close();
	%>
		<center><h2><a style="color:gray"  href="main.jsp">返回主页面</a></h2></center>

  </body>
</html>
