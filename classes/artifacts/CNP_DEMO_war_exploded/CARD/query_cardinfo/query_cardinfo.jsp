<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="java.text.SimpleDateFormat"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'index.jsp' starting page</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
  </head>
  
  <body>
    <center>
        <font size=6>银行卡信息查询</font>
        <form action="CARD/query_cardinfo/query_cardinfo2.jsp" method="post">
		<table border="1">
        	  <tr>
			<td>版本号（version）</td>
			<td><input type="text" name="version" value="1.0" /></td>
		  </tr>
			  <tr>
			<td>交易类型（txnType）</td>
			<td><input type="text" name="txnType" value="PUR" /></td>
		  </tr>
		  <tr>
			<td>卡号（cardNo）</td>
			<td><input type="text" name="cardNo" value="6214832506113617" /></td>
		  </tr>
		  <tr>
			<td><input type="reset" value="重置" /></td>
			<td><input type="submit" value="提交" /></td>
		  </tr>

		</table>
		</form>
	<br>
    </center><br>
  </body>
</html>