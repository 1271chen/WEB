<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.bill99.mgw.entity.*"%>
<%@page import="com.bill99.mgw.util.*"%>
<%@page import="java.util.HashMap"%>
<%@page import="action.*"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<% 

    //设置请求信息字符编码
    request.setCharacterEncoding("UTF-8");
    TransInfo transInfo= new TransInfo();
 
//PUR：消费交易；INP：分期消费交易；PRE：预授权交易；CFM：预授权完成交易；VTX：撤销交易；RFD：退货交易
    String version = request.getParameter("version");    //版本号
    String txnType=request.getParameter("txnType");

//卡号
String cardNo=request.getParameter("cardNo");

    
    //设置消费交易的两个节点
   transInfo.setRecordeText_1("QryCardContent");
	transInfo.setRecordeText_2("ErrorMsgContent");
    
    //Tr1报文拼接
    String str1Xml = "";

   
        str1Xml += "<?xml version=\"1.0\" encoding=\"UTF-8\"?>";
        str1Xml += "<MasMessage xmlns=\"http://www.99bill.com/mas_cnp_merchant_interface\">";
        str1Xml += "<version>"+version+"</version>";
        
        str1Xml += "<QryCardContent>";
        str1Xml += "<txnType>" + txnType + "</txnType>";
        str1Xml += "<cardNo>" + cardNo + "</cardNo>";
        str1Xml += "</QryCardContent>";
        str1Xml += "</MasMessage>";      
    System.out.println("tr1报文  str1Xml = " + str1Xml);
    
    String url = "https://sandbox.99bill.com:9445/cnp/query_cardinfo";    //测试环境地址
    //String url = "https://mas.99bill.com/cnp/query_cardinfo";     //生产环境地址
    
    //TR2接收的数据
    HashMap respXml = Post.sendPost(url,str1Xml,transInfo);
   
    
	System.out.println("respXml = " + respXml);

%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'getDynTr2.jsp' starting page</title>
    
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
	<div align="center">
	<h1>银行卡信息查询结果</h1>
 		<table border="1">	  
          <tr><td>卡号</td><td><%=respXml.get("cardNo") %></td></tr>
          <tr><td>交易类型编码</td><td><%=respXml.get("txnType") %></td></tr>
          <tr><td>CardInfoContent</td><td><%=respXml.get("CardInfoContent") %></td></tr>  		     
		</table>
  	</div>
</body>
</html>