<%@page import="cn.edu.ldu.util.Dbutil"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
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
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link href="css/style.css" rel="stylesheet" type="text/css" />
	<link href="css/fystyle.css" rel="stylesheet" type="text/css" />
	<link href="css/fystyle2.css" rel="stylesheet" type="text/css" />
  </head>
  
  <body>
    	<br>
    	<%
    			String username=(String)application.getAttribute("username");
    			String id = (String) request.getParameter("id");
   				
				String traffic="";
				String time="";
				String begain="";
				String end="";
				String price="";
				String date="";
				
		    	Dbutil dbutil = new Dbutil();
				String sql = "select * from ticketinfo where id='"+id+"'";
				Connection connection = dbutil.getCon();
				Statement statement = (Statement) connection.createStatement();
				ResultSet rs= statement.executeQuery(sql);
					
	%>
	<center>
		<p><a href="main.jsp">返回主页面</a></p>
		<table border="2" width=600 >
			<tr bgcolor="CCCCCC" align="center">
				<th>车次</th>
				<th>起点</th>
				<th>终点</th>
				<th>时间</th>
				<th>票价</th>
			</tr>
			<%
				while(rs.next()){
			 %>
			<tr bgcolor="#E0FFFF" align="center">
				<th><%=rs.getString("traffic") %></th>
				<th><%=rs.getString("begin") %></th>
				<th><%=rs.getString("end") %></th>
				<th><%=rs.getString("time") %></th>
				<th><%=rs.getString("price") %></th>
			</tr>
			<%
				traffic=rs.getString("traffic");
				time=rs.getString("time");
				begain=rs.getString("begin");
				end= rs.getString("end");
				date=rs.getString("date");
				
				String be=(String)application.getAttribute("qidian");
				if(be==null)
					application.setAttribute("qidian", begain);
				String next=(String)application.getAttribute("zhongdian");
				if(next==null)
					application.setAttribute("zhongdian", end);
				else {
					String disan=(String)application.getAttribute("disan");
						if(disan==null)
						application.setAttribute("zhongdian", disan);	
				}
			}
				
			 %>
		</table>
	</center>
	<% 
			/* session.setAttribute("", traffic);
			session.setAttribute("", begin);
			session.setAttribute("", end);
			session.setAttribute("", traffic);
			session.setAttribute("", traffic);*/
			connection.close();
			rs.close();
			statement.close();
			
	%>
	<%	
		try{
		//response.sendRedirect("buyticketServlet.jsp");
			if(username!=null){
			 	Dbutil dbutil2 = new Dbutil();
		
			  	String sql2 = "insert into dingpiao values('" + traffic + "','" + begain + "','" + end + "','"
						+ date + "','" + time + "','" + id + "','"+username+"')";   
				Connection connection2 = dbutil2.getCon();
				Statement statement2 = (Statement) connection2.createStatement();
				statement2.execute(sql2); 
				dbutil2.closeCon(connection2);
				statement2.close();  
			}
		}catch(Exception e){out.println("<center><h1>请不要重复订票</h1></center>");}
	 %>
  </body>
</html>
