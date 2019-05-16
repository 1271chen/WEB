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
        <font size=6>查询交易流水</font>
        <form action="CNP/query_txn/query_txn2.jsp" method="post">
		<table border="1">
		  <tr>
			<td>版本号（version）</td>
			<td><input type="text" name="version" value="1.0" /></td>
		  </tr>
		  <tr>
			<td>交易类型</td>
			<td><input type="text" name="txnType" value="PUR" /></td>
		  </tr>
		  <tr>
			<td>商户编号（merchantId）</td>
			<td><input type="text" name="merchantId" value="104110045112012" /></td>
		  </tr>
		  <tr>
			<td>终端编号（terminalId）</td>
			<td><input type="text" name="terminalId" value="00002012" /></td>
		  </tr>
		  <tr>
			<td>外部跟踪编号(externalRefNumber)</td>
			<td><input type="text" name="externalRefNumber" value="KQ20190121104831" /></td>
		  </tr>
		  <tr>
			<td>系统参考号(refNumber)</td>
			<td><input type="text" name="refNumber" value="" /></td>
		  </tr>
		  <tr>
			<td>交易状态(txnStatus)</td>
			<td><input type="text" name="txnStatus" value="" /></td>
		  </tr>


			<td align="center"><input type="submit" value="提交" /></td>
			<td align="center"><input type="reset" value="重置" /></td>
		  </tr>
		</table>
		</form>
	<br>
    </center><br>
  </body>
</html>