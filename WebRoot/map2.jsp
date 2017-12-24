<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>旅行路线</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<script type="text/javascript" src="http://api.map.baidu.com/api?v=1.2"></script>
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

</head>
<body background="images/003.jpg"
	style="background-size:100% 100%; background-repeat;">

	输入起点:
	<input type="text"
		value=<%=(String) application.getAttribute("qidian")%> id="first">
	<br> 输入终点：
	<input type="text"
		value=<%=(String) application.getAttribute("zhongdian")%> id="second">
	<br>

	<p>
		<input type='button' value='开始' onclick='searchByStationName();' />
	</p>
	<div style="width:820px;height:500px;border:1px solid gray"
		id="container"></div>
</body>
<script type="text/javascript">
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
				myP1 = new BMap.Point(point.lng, point.lat);

			}
		});
		myGeo.getPoint(second, function(point) {
			if (point) {
				myP2 = new BMap.Point(point.lng, point.lat);

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


	}
</script>
</html>
