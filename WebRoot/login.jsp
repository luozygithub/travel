<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">

		<title>用户登录</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
<link href="css/style.css" rel="stylesheet" type="text/css" />
		<script type="text/javascript">
			function od() {
				var f = document.form1;
				if (f.name.value == "") {
					alert("用户名未输入");
					f.name.focus();
					f.name.select();
					return;
				}
				if (f.password.value == "") {
					alert("密码未输入");
					f.password.focus();
					f.password.select();
					return;
				}
			}
		</script>
	</head>

	<body background="images/003.jpg" style="background-size:100% 100%; background-repeat;" >
		<center>
			<p align="center" class="style1">
				欢迎进入旅途挚友订票系统
			</p>
			<hr>
			
			<form method="post" name="form1" action="loginservlet.jsp" style="margin-top:16%;background-color: transparent; "
				onSubmit="return od()" >
				<select name="select" >
					 <option  selected="selected"  value="yh">用户</option>
 					 <option value="gl">管理员</option>
				</select>
				<table width="300" border="1" align="center" cellpadding="0" background="images/002.jpg"
					cellspacing="0">
					
					<tr>
						<td width="80" height="60">
							<div align="center">
								<font size="4"  face="微软雅黑">用户名:</font>
							</div>
						</td>
						<td width="100">
							<div align="center">
								<input name="userName" type="text" id="name" size="20">
							</div>
						</td>
					</tr>
					<tr>
						<td height="80">
							<div align="center">
								<font size="4"  face="微软雅黑">密 &nbsp;码:</font>
							</div>
						</td>
						<td>
							<div align="center">
								<input name="password" type="password" id="password" size="20">
							</div>
						</td>
					</tr>
				</table>
				<p align="center">
					<input name="Sub1" type="submit" value="提交" class=btn>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input name="reset" type="reset" value="重置" class=btn>
				</p>
			</form>
	
			<a href="register.jsp" ><img src="images/zc.png"  width="160px" height="80px"></a>
		</center>
		<%
			if(session.getAttribute("dr-mm")!=null){
			boolean dr=(boolean)session.getAttribute("dr-mm");
			if(dr==false)
		 %>
		<script type="text/javascript">
		
			alert("密码错误");
		</script>
		<%
			}
		 %>
	</body>
</html>

