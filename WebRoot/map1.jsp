<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'map.jsp' starting page</title>
    
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
<body>
输入起点:<input type="text" value="烟台" id="first"><br>
输入终点：<input type="text" value="济南" id="second"><br>

<p><input type='button' value='开始' onclick='searchByStationName();' /></p>
<div style="width:820px;height:500px;border:1px solid gray" id="container"></div>

</body>
<script type="text/javascript">
window.onload=function(){
searchByStationName();
}
window.onload=function(){
searchByStationName();
}
</script>
<script type="text/javascript">
var map = new BMap.Map("container");

map.addControl(new BMap.NavigationControl());               // 添加平移缩放控件
map.addControl(new BMap.ScaleControl());                    // 添加比例尺控件
map.addControl(new BMap.OverviewMapControl());              //添加缩略地图控件
map.enableScrollWheelZoom();//启用地图滚轮放大缩小  
map.enableDoubleClickZoom();//启用鼠标双击放大，默认启用(可不写)  
map.enableKeyboard();//启用键盘上下左右键移动地图  

var myP1 = new BMap.Point(115.907673,35.604761);    //起点-重庆
var myP2 = new BMap.Point(115.950895,35.60791);    //终点-西安



function searchByStationName(){
    var myGeo = new BMap.Geocoder();
    var first = document.getElementById("first").value;
    var second = document.getElementById("second").value;
		myGeo.getPoint(first, function(point){
			if (point) {
				  myP1 = new BMap.Point(point.lng,point.lat);    //起点-重庆
		
			}
		});
		myGeo.getPoint(second, function(point){
			if (point) {
				  myP2 = new BMap.Point(point.lng,point.lat);    //起点-重庆

		}
	
	
});
   
var point = new BMap.Point(115.907673,35.604761);  
	map.setCurrentCity("烟台"); // 设置地图显示的城市 此项是必须设置的 
	map.centerAndZoom(point,50);  
	map.enableScrollWheelZoom(true); 
}
</script>
</html>
