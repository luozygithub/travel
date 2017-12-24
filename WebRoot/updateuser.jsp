<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'change.jsp' starting page</title>
    
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
      <form action="UserChange" style="padding-top:180px">
  	<table align="center" border="1" width="70%" height=120px>
  <tr>
  <td>姓名</td>
  <td>密码</td>
  <td>真实姓名</td>
  <td>性别</td>
    <td>手机号</td>
      <td>邮箱</td>
    <%
		    String name = request.getParameter("name");
		    Class.forName("com.mysql.jdbc.Driver");
		   	//String url="jdbc:mysql://localhost:3306;databasename=User";
		   	String url="jdbc:mysql://localhost:3307/travel";
		   	Connection conn=DriverManager.getConnection(url,"root","root");
		   	Statement stmt=conn.createStatement();
		   	String sql1 = "select * from user where username='"+name+"'";
		   	ResultSet rs1 = stmt.executeQuery(sql1);
		   	if( rs1.next() )
		   	{
		   	%>
   	<tr>
   		<td><input type="text" name="username" value="<%= rs1.getString("username") %>"/></td>
   		<td><input type="text" name="password" value="<%= rs1.getString("password") %>"/></td>
   		<td><input type="text" name="realname" value="<%= rs1.getString("realname") %>"/></td>
   		<td><input type="text" name="gender" value="<%= rs1.getString("gender") %>"/></td>
   		<td><input type="text" name="tel" value="<%= rs1.getString("tel") %>"/></td>
   		<td><input type="text" name="email" value="<%= rs1.getString("email") %>"/></td>
   	</tr>
   	<%	
   	}
   	stmt.close();
   	conn.close();
    %>
    </table>
      <center><div><input align="top" type="submit" value="修改"/></div> </center>
    </form>
	
	<br><center><h2><a href="main2.jsp">返回主页面</a></h2></center>
  </body>
</html>
