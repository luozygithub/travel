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
    
    <title>订单查询</title>
    
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
    			String username=(String)application.getAttribute("username");
				
		    	Dbutil dbutil = new Dbutil();
				String sql = "select * from dingpiao where username='"+username+"'";
				Connection connection = dbutil.getCon();
				Statement statement = (Statement) connection.createStatement();
				ResultSet rs= statement.executeQuery(sql);
				rs.last();
	%>
	<center>

		<h2><a href="main.jsp">返回主页面</a></h2>
		<font size=5>你要查询的票数共有<%=rs.getRow() %>种</font>
		<table border="1" width=600  bgcolor="white" style="padding: 5px 10px;
font-size: 12px;
font-family: Verdana;
font-weight: bold;">
			<tr align="center" >
				<th>车次</th>
				<th>起点</th>
				<th>终点</th>
				<th>时间</th>
				<th>退票</th>
			</tr>
			<%
				rs.beforeFirst();
				
			 %>
			<%
				while(rs.next()){
			 %>
			<tr align="center">
		
				<th><%=rs.getString("traffic") %></th>
				<th><%=rs.getString("begain") %></th>
				<th><%=rs.getString("end") %></th>
				<th><%=rs.getString("time") %></th>
				<td><input type="button" name="tuipiao" class=btn value="退票" onclick="window.location.href='tuipiao.jsp?id=<%=rs.getString("id")%>'"/></td>
			</tr>
			<%
				
			}
				
			 %>
		</table>
	</center>
	<% 

			connection.close();
			rs.close();
			statement.close();
			
	%>
  </body>
</html>
