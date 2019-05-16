<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>协议支付</title>
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
  
		<div >
			<h2 align="center">协议支付 （测试前请先修改手机号）</h2>
			
	<table width="500" border="1" style="border-collapse: collapse" bordercolor="green" align="center">
	<tr>
			<td align="center"><font color="red">签约接口</font></td>					
		</tr>
		<tr>
			<td align="center">
				<a href="CARD/ind_auth/ind_auth.jsp"  style="text-decoration:none" target="_blank">签约申请接口</a>
    	</td>					
		</tr>
		<tr>
			<td align="center">
				<a href="CARD/ind_auth_verify/ind_auth_verify.jsp"  style="text-decoration:none" target="_blank">签约短信验证接口</a>
    	</td>					
		</tr>
		<tr>
			<td align="center" ><font color="red">支付接口</font></td>					
		</tr>
		<tr>
           	<td align="center">
				<a href="CNP/QPay02/QPay.jsp"  style="text-decoration:none" target="_blank">协议支付接口</a>				
		</tr>
		<tr>
			<td align="center" ><font color="red">查询接口</font></td>					
		</tr>
		<tr>
		<tr>
           	<td align="center">
				<a href="CNP/query_txn/query_txn.jsp"  style="text-decoration:none" target="_blank">查询交易流水接口</a>				
		</tr>
		<tr>
			<td align="center">
				<a href="CARD/query_cardinfo/query_cardinfo.jsp"  style="text-decoration:none" target="_blank">银行卡信息查询接口</a>
    	</td>					
		</tr>
		<tr>
			<td align="center">
				<a href="PCI/pci_query/pci_query.jsp"  style="text-decoration:none" target="_blank">协议查询接口</a>
    	</td>					
		</tr>
		<tr>
			<td align="center">
				<a href="PCI/pci_del/pci_del.jsp"  style="text-decoration:none" target="_blank">协议解绑接口</a>
    	</td>					
		</tr>



	  </table>     
    </div>
  </body>
</html>
