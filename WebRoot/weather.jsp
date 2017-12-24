<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<title>天气</title>
<meta name="description" content="天气预报插件" />
<link href="css/style.css" rel="stylesheet" type="text/css" />
</head>
<style type="text/css">
	*{margin:0;padding:0;list-style-type:none;}
	a,img{border:0;}
	body{font:12px/180% Arial, Helvetica, sans-serif, "新宋体";}
	
	/* demo */
	.demo{width:800px;margin:0 auto;}
	.demo div{margin:40px 0 0 0;}
</style>
<body>


		<h2><a href="main.jsp">返回主页面</a></h2>
<br/>
	<div class="demo">
	
		<div>
			<iframe name="weather_inc" src="http://i.tianqi.com/index.php?c=code&id=2&num=5" width="650" height="70" frameborder="0" marginwidth="0" marginheight="0" scrolling="no"></iframe>
		</div>
		
		<div>
			<iframe name="weather_inc" src="http://i.tianqi.com/index.php?c=code&id=7" style="border:solid 1px #7ec8ea" width="225" height="90" frameborder="0" marginwidth="0" marginheight="0" scrolling="no"></iframe>
		</div>
		
		<div>
			<iframe name="weather_inc" src="http://i.tianqi.com/index.php?c=code&id=9" width="800" height="60" frameborder="0" marginwidth="0" marginheight="0" scrolling="no"></iframe>
		</div>
		
		<div>
			<iframe name="weather_inc" src="http://i.tianqi.com/index.php?c=code&id=11" width="500" height="15" frameborder="0"></iframe>
		</div>
		
		<div>
			<iframe name="weather_inc" src="http://i.tianqi.com/index.php?c=code&id=13" width="650" height="221" frameborder="0" marginwidth="0" marginheight="0" scrolling="no"></iframe>
		</div>
		
		<div>
			<iframe name="weather_inc" src="http://i.tianqi.com/index.php?c=code&id=19" width="800" height="120" frameborder="0" marginwidth="0" marginheight="0" scrolling="no"></iframe>
		</div>
		
	</div>
<br /><br />

</body>
</html>