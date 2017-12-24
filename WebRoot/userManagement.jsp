<%@page import="cn.edu.ldu.util.Dbutil"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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

<title>My JSP 'userManagement.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<link href="css/fystyle.css" rel="stylesheet" type="text/css" />
<link href="css/fystyle2.css" rel="stylesheet" type="text/css" />

</head>

<body>
	<%
		Dbutil dbutil = new Dbutil();
		String sql = "select * from user";
		Connection connection = dbutil.getCon();
		Statement statement = (Statement) connection.createStatement();
		ResultSet rs = statement.executeQuery(sql);
		rs.last();
	%>
	<center>
		<form action="buyticket.jsp" style="padding-top:180px">

			<font size=5>用户共有<%=rs.getRow()%>个
			</font>

			<table align="center" border="1" width="70%" height=120px>
				<tr align="center">
					<th>姓名</th>
					<th>密码</th>
					<th>真实姓名</th>
					<th>性别</th>
					<th>电话</th>
					<th>邮箱</th>
					<th>修改</th>
				</tr>
				<%
					rs.beforeFirst();
					while (rs.next()) {
				%>
				<tr bgcolor="CCCCCC" align="center">
					<th><%=rs.getString("Username")%></th>
					<th><%=rs.getString("password")%></th>
					<th><%=rs.getString("realname")%></th>
					<th><%=rs.getString("gender")%></th>
					<th><%=rs.getString("tel")%></th>
					<th><%=rs.getString("email")%></th>
					<th><div style="font-size:30px">
							<a style="font-size:30px"
								href='updateuser.jsp?name=<%out.println(rs.getString("Username"));%>' />修改</a>
						</div></th>
				</tr>
				<%
					}
				%>
			</table>

		</form>
	</center>
	<form name="form1" method="get" action="UserDelete">
		<table width="430" border="0" align="center">
			<tr>
				<td><font size="4">请输入你要删除的姓名：</font></td>
				<td><font size="4"><label> <input
							name="username" type="text" id="username">
					</label> </font></td>
			</tr>
			<tr>
				<td><label> <input type="submit" name="Submit"
						value="删除">

				</label></td>
				<td><label> <input type="reset" name="Submit2"
						value="重置">
				</label></td>
			</tr>
		</table>
	</form>
	<center>
		<h2>
			<a href="main2.jsp">返回主页面</a>
		</h2>
	</center>
</body>
</html>
