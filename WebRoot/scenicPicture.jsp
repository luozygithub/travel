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

<title>My JSP 'scenicPicture.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<link href="css/fystyle2.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/jquery2.min.js"></script>
<script type="text/javascript">
$(function(){   
		  
	var interval;
	$(".container img").click(function cover(){
			$(this).addClass("zoom").fadeOut(700,append);		
			function append(){
			$(this).removeClass("zoom").appendTo(".container").show();
			var name = $(".container").children("img").first().attr("alt");
			 $(".name p").text("No "+name);
			}	
	  
	})
	
	function auto(){
			var play = $(".container").children("img").first();
			play.addClass("zoom").fadeOut(700,append);		
			function append(){
			$(this).removeClass("zoom").appendTo(".container").show();
			var name = $(this).parent().children("img").first().attr("alt");
			 $(".name p").text("No "+name);
			}
			interval = setTimeout(auto,5000);
	}
	
	$(".container img").hover(function(){
			stopPlay();
	},function(){
			interval = setTimeout(auto,5000);
	})
	
	function stopPlay(){
		clearTimeout(interval)
	}
	auto();
					
})
</script>
</head>

<body>

	<br>

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
			<a href="main.jsp">返回主页面</a>
		</h2>
		<font size=5>共有<%=rs.getRow()%>张</font>
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
					src="<%=rs.getString("图片路径")%>"></th>
			</tr>
			<%
				}
			%>
<%
		connection.close();
		rs.close();
		statement.close();
	%>
		</table>

	
	


</body>
</html>
