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
    
    <title>修改订票</title>
    
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
  
  <body background="images/003.jpg" style="background-size:100% 100%; background-repeat;">
    	<br>
    	 <% 
   		 		Dbutil dbutil = new Dbutil();
				String sql = "select * from dingpiao";
				Connection connection = dbutil.getCon();
				Statement statement = (Statement) connection.createStatement();
				ResultSet rs= statement.executeQuery(sql);
	%>
	<center>

		<h2><a href="main2.jsp">返回主页面</a></h2>
		 <form action="changeDeal.jsp">
		<table border="2" width=600 >
			<tr bgcolor="#E0FFFF" align="center">
			
				<th>车次</th>
				<th>名字</th>
				<th>起点</th>
				<th>终点</th>
				<th>日期</th>
				<th>时间</th>
		
			</tr>
			
			<%
				if(rs.next()){
			 %>
			<tr bgcolor="CCCCCC" align="center">
			    <th><input type="text" name="traffic" value="<%=rs.getString("traffic") %>"></th>
				<th><input type="text" name="username" value="<%=rs.getString("username") %>"></th>				
				<th><input type="text" name="begain" value="<%=rs.getString("begain") %>"></th>
				<th><input type="text" name="end" value="<%=rs.getString("end") %>"></th>
				<th><input type="text" name="date" value="<%=rs.getString("date") %>"></th>
				<th><input type="text" name="time" value="<%=rs.getString("time") %>"></th>
				<th><input type="hidden" name="id" value="<%=rs.getString("id") %>"></th>
			</tr>
			<%
				
			}
				
			 %>
		</table>
		  <input type="submit" value="修改"/>
		  </form>
	</center>
	<% 

			connection.close();
			rs.close();
			statement.close();
			
	%>
  </body>
</html>
