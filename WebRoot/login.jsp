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

		<title>�û���¼</title>

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
					alert("�û���δ����");
					f.name.focus();
					f.name.select();
					return;
				}
				if (f.password.value == "") {
					alert("����δ����");
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
				��ӭ������;ֿ�Ѷ�Ʊϵͳ
			</p>
			<hr>
			
			<form method="post" name="form1" action="loginservlet.jsp" style="margin-top:16%;background-color: transparent; "
				onSubmit="return od()" >
				<select name="select" >
					 <option  selected="selected"  value="yh">�û�</option>
 					 <option value="gl">����Ա</option>
				</select>
				<table width="300" border="1" align="center" cellpadding="0" background="images/002.jpg"
					cellspacing="0">
					
					<tr>
						<td width="80" height="60">
							<div align="center">
								<font size="4"  face="΢���ź�">�û���:</font>
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
								<font size="4"  face="΢���ź�">�� &nbsp;��:</font>
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
					<input name="Sub1" type="submit" value="�ύ" class=btn>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input name="reset" type="reset" value="����" class=btn>
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
		
			alert("�������");
		</script>
		<%
			}
		 %>
	</body>
</html>

