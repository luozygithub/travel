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
<link href="css/fystyle2.css" rel="stylesheet" type="text/css" />
<title>上传界面</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
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
		<h2>上传图片</h2>
		<form method="post" action="uploaddeal.jsp"
			enctype="multipart/form-data">
			<table width="315" border="0">
				<tr align="center">
					<th>城市</th>

				</tr>
				<tr>
					<th><input type="text" name="picname" value="烟台"></th>
				</tr>
				<tr>
					<td width="309" align="center"><label class="btn btn-primary">
							<input type="file" style="display: none" class="form-control"
							id="caseImage" name="caseImage" onchange="viewImage(this)" />选择图片
					</label></td>
				</tr>

				<tr>
					<td align="center"><input type="submit" name="Submit"
						value="上传"></td>
				</tr>
			</table>
		</form>
	</center>
	<%
		Dbutil dbutil = new Dbutil();
		String sql = "select * from scenicpicture";
		Connection connection = dbutil.getCon();
		Statement statement = (Statement) connection.createStatement();
		ResultSet rs = statement.executeQuery(sql);
		rs.last();
	%>
	<center>

		<h2>
			<a href="main2.jsp">返回主页面</a>
		</h2>
		<font size=5>共有<%=rs.getRow()%></font>
		<table border="0" width=800>
			<%
				rs.beforeFirst();
			%>
			<%
				while (rs.next()) {
			%>

			<tr align="center">
				<th><%=rs.getString("城市")%></th>
				<th><img width=200px; height=200px
					src="/picture/<%=rs.getString("图片路径")%>"></th>
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
<!-- 来必力City版安装代码 -->
<div id="lv-container" data-id="city" data-uid="MTAyMC8zMjY0OC85MjA5">
<script type="text/javascript">
   (function(d, s) {
       var j, e = d.getElementsByTagName(s)[0];

       if (typeof LivereTower === 'function') { return; }

       j = d.createElement(s);
       j.src = 'https://cdn-city.livere.com/js/embed.dist.js';
       j.async = true;

       e.parentNode.insertBefore(j, e);
   })(document, 'script');
</script>
<noscript>为正常使用来必力评论功能请激活JavaScript</noscript>
</div>
<!-- City版安装代码已完成 -->
</body>
</html>
