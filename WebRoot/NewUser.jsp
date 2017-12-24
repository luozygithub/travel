<%@page import="cn.edu.ldu.util.Dbutil"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="java.sql.*"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>注册后台处理</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">


</head>

<body>
	<br>
	<%
		String username = (String) request.getParameter("userName");

		String password = (String) request.getParameter("password");
		String repassword = (String) request.getParameter("repassword");
		String realName = new String( request.getParameter("realName").getBytes("ISO-8859-1"),"UTF-8");
		String tel = (String) request.getParameter("tel");
		String email = (String) request.getParameter("email");
		String gender = "0";
		gender = request.getParameter("gender");

		if (gender.equals("1")) {
			gender = "男";
		} else {
			gender = "女";
		}
		Dbutil dbutil = new Dbutil();
		String sql = "insert into user values('" + username + "','" + password + "','" + repassword + "','"
				+ realName + "','" + gender + "','" + tel + "','" + email + "')";
		Connection connection = dbutil.getCon();
		Statement statement = (Statement) connection.createStatement();
		int result = statement.executeUpdate(sql);
		dbutil.closeCon( connection);
		statement.close();
		
	%>
	<center>
		<p>注册成功</p>
		<form action=login.jsp method="post">
			<input type="submit" value="登录">
		</form>
	</center>
</body>
</html>
