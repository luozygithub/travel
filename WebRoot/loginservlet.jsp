<%@page import="java.awt.Window"%>
<%@page import="java.awt.event.WindowStateListener"%>
<%@page import="java.security.interfaces.RSAKey"%>
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

<title>登入处理</title>

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
		String username = (String) request.getParameter("userName");
		application.setAttribute("username", username);
		String password = (String) request.getParameter("password");
		out.println(username+"\n"+password);
	
		Dbutil dbutil = new Dbutil();
		ResultSet result=null;
		Connection connection = dbutil.getCon();
		Statement statement = (Statement) connection.createStatement();
	%>

	<%
		//管理員
		String s=request.getParameter("select");
		if(s.equals("gl")){
		
			String gsql = "select * from admini where username='"+username+"'";
			
			
			result = statement.executeQuery(gsql);
			if(result.next()){
				String gsql2="select * from admini where password='"+password+"'";
				result=statement.executeQuery(gsql2);
				if(result.next()){
					response.sendRedirect("main2.jsp");
					
				}
				else{
				
					session.setAttribute("dr-mm", false);
					//response.write("<script>alert('登入失败');</script>");
					response.sendRedirect("login.jsp");
				}
			}else{
	
				session.setAttribute("dr-yh", false);
				response.sendRedirect("login.jsp");
	
			}
			
			dbutil.closeCon( connection);	
		
		}else{

	 %>


	<% 
		
			String sql = "select * from user where username='"+username+"'";
			
			
			result = statement.executeQuery(sql);
			if(result.next()){
				String sql2="select * from user where password='"+password+"'";
				result=statement.executeQuery(sql2);
				if(result.next()){
					response.sendRedirect("main.jsp");
					
				}
				else{
				
					session.setAttribute("dr-mm", false);
					//response.write("<script>alert('登入失败');</script>");
					response.sendRedirect("login.jsp");
				}
			}else{
	
				session.setAttribute("dr-yh", false);
				response.sendRedirect("login.jsp");
	
			}
			
			dbutil.closeCon( connection);	
		}
	%>




	<% 
		
	%>
</body>
</html>
