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

<title>购票</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<script type="text/javascript" src="http://api.map.baidu.com/api?v=1.2"></script>
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<link href="css/fystyle2.css" rel="stylesheet" type="text/css" />
</head>

<body>
	<%
		String date = new String(request.getParameter("date").getBytes("ISO-8859-1"), "UTF-8");
		String begin = new String(request.getParameter("begin").getBytes("ISO-8859-1"), "UTF-8");
		String end = new String(request.getParameter("end").getBytes("ISO-8859-1"), "UTF-8");

		Dbutil dbutil = new Dbutil();
		String sql = "select * from ticketinfo where date='" + date + "' and begin='" + begin + "' and end='" + end
				+ "'";
		Connection connection = dbutil.getCon();
		Statement statement = (Statement) connection.createStatement();
		ResultSet rs = statement.executeQuery(sql);
		rs.last();
	%>
	<center>
		<form action="buyticket.jsp">
			<font size=5>你要查询的票数共有<%=rs.getRow()%>种
			</font>
			<table border="2" width=600
				style="border-radius:10px;overflow:hidden;">
				<tr bgcolor="#E0FFFF" align="center">
					<th>车次</th>
					<th>起点</th>
					<th>终点</th>
					<th>时间</th>
					<th>票价</th>
					<th>购买</th>
				</tr>
				<%
					rs.beforeFirst();
					while (rs.next()) {
				%>
				<tr bgcolor="white" align="center">
					<th><%=rs.getString("traffic")%></th>
					<th><%=rs.getString("begin")%></th>
					<th><%=rs.getString("end")%></th>
					<th><%=rs.getString("time")%></th>
					<th><%=rs.getString("price")%></th>
					<td class="btn"><input type="button"
						style=" 
					  width: 80px;
	   height:36px;border:1px solid #494949;
    background:#404040;
    /* CSS3 Styling */
    background:-moz-radial-gradient(bottom, #656565, #404040 60%);
    background:-webkit-gradient(radial, center bottom, 0, center 230, 230, from(#656565), to(#404040));
    -moz-border-radius:3px;
    -webkit-border-radius:3px;
    border-radius:3px;
    -moz-box-shadow:0px 0px 3px #000;
    -webkit-box-shadow:0px 0px 3px #000;
    box-shadow:0px 0px 3px #000;
    /* Text Styling */
    color:#fff;
    text-shadow:0px 0px 5px rgba(255, 255,255, 0.5);
    font-family:'NotethisRegular', Verdana, Arial;
    font-size:15px;
    padding-top:1px;"
						name="buy" value="购买"
						onclick="window.location.href='buyticket.jsp?id=<%=rs.getString("id")%>'" /></td>
				</tr>
				<%
					}
				%>
			</table>
		</form>
	</center>

	<center>
		输入起点: <input type="text"
			value=<%=new String(request.getParameter("begin").getBytes("ISO-8859-1"), "UTF-8")%>
			id="first"> <br> 输入终点： <input type="text"
			value=<%=new String(request.getParameter("end").getBytes("ISO-8859-1"), "UTF-8")%>
			id="second"> <br>

		<p>
			<input type='button' value='开始' onclick='searchByStationName();' />
		</p>
		<div style="width:820px;height:500px;border:1px solid gray"
			id="container"></div>
	</center>
	<%
		dbutil.closeCon(connection);
		statement.close();
	%>
</body>
<script type="text/javascript">
	window.onload = function() {
		searchByStationName();
	}
	window.onload = function() {
		searchByStationName();
	}
</script>
<script type="text/javascript">
	var map = new BMap.Map("container");

	map.addControl(new BMap.NavigationControl()); // 添加平移缩放控件
	map.addControl(new BMap.ScaleControl()); // 添加比例尺控件
	map.addControl(new BMap.OverviewMapControl()); //添加缩略地图控件
	map.enableScrollWheelZoom(); //启用地图滚轮放大缩小  
	map.enableDoubleClickZoom(); //启用鼠标双击放大，默认启用(可不写)  
	map.enableKeyboard(); //启用键盘上下左右键移动地图  

	var myP1 = new BMap.Point(0, 0); //起点-重庆
	var myP2 = new BMap.Point(0, 0); //终点-西安



	function searchByStationName() {
		var myGeo = new BMap.Geocoder();
		var first = document.getElementById("first").value;
		var second = document.getElementById("second").value;
		myGeo.getPoint(first, function(point) {
			if (point) {
				myP1 = new BMap.Point(point.lng, point.lat); //起点-重庆

			}
		});
		myGeo.getPoint(second, function(point) {
			if (point) {
				myP2 = new BMap.Point(point.lng, point.lat); //起点-重庆

			}

		});
		map.clearOverlays(); //清除地图上所有的覆盖物
		var driving = new BMap.DrivingRoute(map); //创建驾车实例
		driving.search(myP1, myP2); //第一个驾车搜索
		driving.setSearchCompleteCallback(function() {
			var pts = driving.getResults().getPlan(0).getRoute(0).getPath(); //通过驾车实例，获得一系列点的数组

			var polyline = new BMap.Polyline(pts);
			map.addOverlay(polyline);

			var m1 = new BMap.Marker(myP1);
			var m2 = new BMap.Marker(myP2);
			map.addOverlay(m1);
			map.addOverlay(m2);

			var lab1 = new BMap.Label("起点", {
				position : myP1
			}); //创建3个label
			var lab2 = new BMap.Label("终点", {
				position : myP2
			});
			map.addOverlay(lab1);
			map.addOverlay(lab2);

			setTimeout(function() {
				map.setViewport([ myP1, myP2 ]); //调整到最佳视野
			}, 1000);

		});



		//获取两点距离



		var point = new BMap.Point(myP1);
		map.setCurrentCity("烟台"); // 设置地图显示的城市 此项是必须设置的 
		map.centerAndZoom(point, 19);
		map.enableScrollWheelZoom(true);
	}
</script>

</html>
