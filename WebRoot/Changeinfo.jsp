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

<title>个人信息</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

</head>

<body background="images/003.jpg"
	style="background-size:100% 100%; background-repeat;">
	<br>
	<%
		String username = (String) application.getAttribute("username");
	%>
	<%
		Dbutil dbutil = new Dbutil();
		String sql = "select * from userinfo where name='" + username + "'";
		Connection connection = dbutil.getCon();
		Statement statement = (Statement) connection.createStatement();
		ResultSet rs = statement.executeQuery(sql);
	%>

	<center>
	 <form action="ChangeUserInfo" style="padding-top:180px">
		<font size="5" color="blue" style="color:white">个人信息</font>
		<table border="15" width="500" bgcolor="#5B5B5B">
			<%
				if (rs.next()) {
			%>
			<tr align="right">
				<th style="color:white">昵称</th>
				<td><input type="text" name="name" value="<%= rs.getString("name")%>"/></td>
			</tr>
			<tr align="right">
				<th style="color:white">介绍</th>
				
				<td><input type="text" name="info" value="<%=rs.getString("info")%>"/></td>
			</tr>
			<tr align="right">
				<th style="color:white">性别</th>
				<td><input type="text" name="sex" value="<%=rs.getString("sex")%>"/></td>
			</tr>
			<tr align="right">
				<th style="color:white">生日</th>
				<td><input type="text" name="date" value="<%=rs.getString("date")%>"/></td>
				
			</tr>
			<tr align="right">
				<th style="color:white">省市</th>
				<td><input type="text" name="provinces" value="<%=rs.getString("provinces")%>"/></td>
			</tr>
			<tr align="right">
				<th style="color:white">头像</th>
				<th><img width="50px" height="50px"
					src="<%=rs.getString("head")%>" /></th>
			</tr>
		</table>
      <center><div><input  type="submit" value="修改"/></div> </center>
</form>
	</center>
	<%
		}
		dbutil.closeCon(connection);
		statement.close();
	%>
	<script>
		function viewImage(file) {
			var preview = document.getElementById('preview');
			if (file.files && file.files[0]) {
				//火狐下
				preview.style.display = "block";
				preview.style.width = "300px";
				preview.style.height = "120px";
				preview.src = window.URL.createObjectURL(file.files[0]);
			} else {
				//ie下，使用滤镜
				file.select();
				var imgSrc = document.selection.createRange().text;
				var localImagId = document.getElementById("localImag");
				//必须设置初始大小 
				localImagId.style.width = "250px";
				localImagId.style.height = "200px";
				try {
					localImagId.style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale)";
					locem("DXImageTransform.Microsoft.AlphaImageLoader").src = imgSrc;
				} catch (e) {
					alert("您上传的图片格式不正确，请重新选择!");
					return false;
				}
				preview.style.display = 'none';
				document.selection.empty();
			}
			return true;
		}
	</script>
</head>

<body>
	<center>
		<div id="localImag">
			<img id="preview" width=-1 height=-1 style="diplay:none" />
		</div>
		<h2>更换头像</h2>
		<form method="post" action="changeHead.jsp"
			enctype="multipart/form-data">
			<table width="315" border="0">
	
				<tr>
					<td width="309" align="center"><label class="btn btn-primary">
							<input type="file" style="display: none" class="form-control"
							id="caseImage" name="caseImage" onchange="viewImage(this)" />选择图片
					</label></td>
				</tr>

				<tr>
					<td align="center"><input type="submit" name="Submit"
						value="更换"></td>
				</tr>
			</table>
		</form>
	</center>
</body>
</html>
