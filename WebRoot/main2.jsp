<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>管理员主页面</title>

<link href="css/style.css" rel="stylesheet" type="text/css" />
<script language="javascript" type="text/javascript"
	src="js/javascript.js">
	</script>
<link rel="stylesheet" type="text/css"
	href="js/bootstrap-3.3.7-dist/css/bootstrap.min.css" />
<script
	src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
<script src="js/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
</head>
<script language="javascript" type="text/javascript" src="js/zimu.js">
	</script>
<script language="javascript">
	function check() {
		var f = document.form1;
		if (f.begin.value == f.end.value) {
			alert("起点和终点不能相同！");
			return false;
		} else
			return true;
	}
</script>

<body background="images/003.jpg" style="background-size:100% 100%; background-repeat;">
	<%
		String username=(String)application.getAttribute("username");
	 %>
	<nav class="navbar navbar-default" role="navigation">

	<div class="container-fluid">
		<div  class="navbar-header" style="font-family:SimSun;"  >
			<img src="images/tb.jpg" style="height:50px;weight:50px;">
			<a class="navbar-brand" href="#" style="align:right; text-color:black;">旅途挚友</a>
		</div>
		<div>
			<ul class="nav navbar-nav">
				<li><a href="userManagement.jsp">用户管理</a></li>
				<li><a href="upload.jsp">上传景点图片</a></li>
				<li><a href="passwordmodify.jsp">修改密码</a></li>
				<li><a href="quit.jsp">退出登录</a></li>
				<li><a href="changeTicket.jsp">修改票</a></li>
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown"> 个人行程 <b class="caret"></b>
				</a>
					<ul class="dropdown-menu">
						<li ><a href="#">修改个人信息</a></li>
						<li><a href="Checkinfo.jsp">查看个人信息</a></li>
					
						<li><a href="#"></a></li>
					
						<li class="divider"></li>
						<li><a href="scenicSpot.jsp">旅途景点</a></li>
						<li><a href="weather.jsp">天气查询</a></li>
						<li class="divider"></li>					
						<li><a href="quit.jsp">退出登录</a></li>
					</ul>
			</ul>
		</div>
	</div>
	</nav>


	<div class="clear"></div>


	<div id="sub2">
		<hr/>

				
		<iframe name="weather_inc" src="http://i.tianqi.com/index.php?c=code&id=12"  width="300px" height="200px" frameborder="0" marginwidth="0" marginheight="0" scrolling="no" align="right"></iframe>
		<p style="padding-left:10px;color:black;" align="right"></p> <div align="right" class="mybtn14_3"> <a href="http://m.weather.com.cn" >详情</a></div>
		<p align="center">
			<font size="6" color="black"> 欢迎您进入本系统 </font>
		</p>
		<p align="center">
			<font size="4" color="purple"> 尊敬的<%=username %></font>
		</p>
		<hr/>
		
		<br/><br/><br/><br/><br/>
		<h2 align="center">查询火车票信息</h2>
		<form name="form1" method="post" action="ticket.jsp" class="mainform"
			onSubmit="return check()">
			<table width="280" cellpadding="1" cellspacing="1" border="3" background="images/002.jpg"
				align="center">
				<tr>
					<td width="100" height="12" align="center">时间</td>
					<td>
						<div align="center">
							<select name="date">
								<option value="今天">
														今天
													</option>
								<option value="明天">
														明天
													</option>
								<option value="后天">
														后天
													</option>
							</select>
						</div>
					</td>
				</tr>
				<tr>
					<td width="100" height="12" align="center">起点</td>
					<td>
						<div align="center">
							<select name="begin">
								<option value="烟台">
														烟台
													</option>
								<option value="济南">
														济南
													</option>
								<option value="广州">
														广州
													</option>
								<option value="上海">
														上海
													</option>
								<option value="郑州">
														郑州
													</option>
								<option value="北京">
														北京
													</option>
								<option value="成都">
														成都
													</option>
							</select>
						</div>
					</td>
				</tr>
				<tr>
					<td width="100" height="12" align="center">终点</td>
					<td>
						<div align="center">
							<select name="end">
								<option value="烟台">
														烟台
													</option>
								<option value="济南">
														济南
													</option>
								<option value="广州">
														广州
													</option>
								<option value="上海">
														上海
													</option>
								<option value="郑州">
														郑州
													</option>
								<option value="北京">
														北京
													</option>
								<option value="成都">
														成都
													</option>
							</select>
						</div>
					</td>
				</tr>
			</table>
			<p align="center">
				<input name="chaxun" type="submit" id="chaxun" value="查询"  style="  
      height:34px;
    width:80px;
     border:1px solid #858fa6;
    background:#4a5775;
    /* CSS3 Styling */
    background:-moz-linear-gradient(top, #606c88, #3f4c6b);
    background:-webkit-gradient(linear, left top, left bottom, from(#606c88), to(#3f4c6b));
    -moz-border-radius:5px;
    -webkit-border-radius:5px;
    border-radius:5px;
    -moz-box-shadow:0px 0px 5px #000;
    -webkit-box-shadow:0px 0px 5px #000;
    box-shadow:0px 0px 5px #000;
    /* Text Styling */
    font-family:'AirstreamRegular', Georgia, 'Times New Roman', serif;
    color:#e5edff;
    text-shadow:0px 0px 5px rgba(0, 0, 0, 0.75);
    font-size:12px;"/>
			</p>
		</form>

	</div>
	

	
	<div id="footer" class="footer" style=" position:fixed;bottom: 0; width:100%;text-align:center; opacity: 0.9" >
		<ul>
           
                <li><a href="http://dujia.qunar.com/pq/list_%E4%B9%9D%E5%AF%A8%E6%B2%9F">九寨沟旅游</a> | </li>
                <li><a href="http://dujia.qunar.com/pq/list_%E8%8B%8F%E5%B7%9E">苏州旅游</a> | </li>
                <li><a href="http://dujia.qunar.com/pq/list_%E9%9F%A9%E5%9B%BD">韩国旅游</a> | </li>
                <li><a href="http://dujia.qunar.com/pq/list_%E9%BC%93%E6%B5%AA%E5%B1%BF">鼓浪屿旅游</a> | </li>
                <li><a href="http://dujia.qunar.com/pq/list_%E5%8E%A6%E9%97%A8">厦门旅游</a> | </li>
                <li><a href="http://dujia.qunar.com/pq/list_%E5%8C%97%E4%BA%AC">北京旅游</a> | </li>
                <li><a href="http://dujia.qunar.com/pq/list_%E5%8D%97%E4%BA%AC">南京旅游</a> | </li>
                <li><a href="http://dujia.qunar.com/pq/list_%E5%8D%83%E5%B2%9B%E6%B9%96">千岛湖旅游</a> | </li>
                <li><a href="http://dujia.qunar.com/pq/list_%E8%A5%BF%E5%A1%98">西塘旅游</a> | </li>
                <li><a href="http://dujia.qunar.com/pq/list_%E9%9D%92%E5%B2%9B">青岛旅游</a> | </li>
                <li><a href="http://dujia.qunar.com/pq/list_%E6%AD%A6%E6%B1%89">武汉旅游</a> | </li>
                <li><a href="http://dujia.qunar.com/pq/list_%E8%A5%BF%E8%97%8F">西藏旅游</a> | </li>
                <li><a href="http://dujia.qunar.com/pq/list_%E6%9D%AD%E5%B7%9E">杭州旅游</a> | </li>
                <li><a href="http://dujia.qunar.com/pq/list_%E8%A5%BF%E5%AE%89">西安旅游</a> | </li>
                <li><a href="http://dujia.qunar.com/pq/list_%E5%8F%B0%E6%B9%BE">台湾旅游</a> | </li>
                <li><a href="http://dujia.qunar.com/pq/list_%E6%99%AE%E5%90%89%E5%B2%9B">普吉岛旅游</a> | </li>
                <li><a href="http://dujia.qunar.com/pq/list_%E9%A6%99%E6%B8%AF">香港旅游</a> | </li>
                <li><a href="http://dujia.qunar.com/pq/list_%E4%B8%8A%E6%B5%B7">上海旅游</a> | </li>
                <li><a href="http://dujia.qunar.com/pq/list_%E4%BA%91%E5%8D%97">云南旅游</a> | </li>
                <li><a href="http://dujia.qunar.com/pq/list_%E5%A9%BA%E6%BA%90">婺源旅游</a> | </li>
                <li><a href="http://dujia.qunar.com/pq/list_%E5%A4%A9%E6%B4%A5">天津旅游</a> | </li>
                <li><a href="http://dujia.qunar.com/pq/list_%E6%88%90%E9%83%BD">成都旅游</a> | </li>
                <li><a href="http://dujia.qunar.com/pq/list_%E4%B9%8C%E9%95%87">乌镇旅游</a> | </li>
                <li><a href="http://dujia.qunar.com/pq/list_%E4%B8%89%E4%BA%9A">三亚旅游</a> | </li>
                <li><a href="http://dujia.qunar.com/pq/list_%E5%BC%A0%E5%AE%B6%E7%95%8C">张家界旅游</a> | </li>
                <li><a href="http://dujia.qunar.com/pq/list_%E5%B7%B4%E5%8E%98%E5%B2%9B">巴厘岛旅游</a> | </li>
        </ul>
      
      <br/>
		<ul>
			
	
		
			<li><a href="#">联系我们</a></li>
			<li><a href="#">辅助功能</a></li>
			<li><a href="#">举报盗版</a></li>
			<li><a href="#">许可和商标</a></li>
			<li><a href="#">产品许可协议</a></li>
			<li><a href="#">发送反馈</a></li>
		</ul>
		
		<center>
			<h4><a  href="http://luozy.top/">作者信息</a></h4>
		</center>
	</div>
	

	
</body>
</html>

