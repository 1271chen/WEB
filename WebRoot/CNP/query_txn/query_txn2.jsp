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
    //消费信息
    String version = request.getParameter("version");    //版本号
    String txnType = request.getParameter("txnType");    //交易类型
    String merchantId = request.getParameter("merchantId");    //商户编号
    String terminalId = request.getParameter("terminalId");    //终端编号
    String externalRefNumber = request.getParameter("externalRefNumber");    //外部跟踪编号
//    String refNumber = request.getParameter("refNumber");    //系统参考号   
//    String txnStatus = request.getParameter("txnStatus");    //交易状态
  
    //设置消费交易的两个节点
   transInfo.setRecordeText_1("TxnMsgContent");
	transInfo.setRecordeText_2("ErrorMsgContent");
    
    //Tr1报文拼接
    String str1Xml = "";

   
        str1Xml += "<?xml version=\"1.0\" encoding=\"UTF-8\"?>";
        str1Xml += "<MasMessage xmlns=\"http://www.99bill.com/mas_cnp_merchant_interface\">";
        str1Xml += "<version>"+version+"</version>";
        
        str1Xml += "<QryTxnMsgContent>";
        str1Xml += "<txnType>" + txnType + "</txnType>";
        str1Xml += "<merchantId>" + merchantId + "</merchantId>";
        str1Xml += "<terminalId>" + terminalId + "</terminalId>";
        str1Xml += "<externalRefNumber>" + externalRefNumber + "</externalRefNumber>";
//        str1Xml += "<refNumber>" + refNumber + "</refNumber>";
//        str1Xml += "<txnStatus>" + txnStatus + "</txnStatus>";  
        str1Xml += "</QryTxnMsgContent>";
        str1Xml += "</MasMessage>";      
    System.out.println("tr1报文  str1Xml = " + str1Xml);
    
    String url = "https://sandbox.99bill.com:9445/cnp/query_txn";    //测试环境地址
    //String url = "https://mas.99bill.com/cnp/query_txn";     //生产环境地址
    
    //TR2接收的数据
    HashMap respXml = Post.sendPost(url,str1Xml,transInfo);
	System.out.println("respXml = " + respXml);
	
	if(respXml==null)
	{
	    System.out.println("读取内容出错");
    }
    else
    {
		//如果TR2获取的应答码responseCode的值为00时，成功
		if("00".equals((String)respXml.get("responseCode")))
		{
			/*************************************
			 *进行数据库的逻辑操作，比如更新数据库或插入记录。
			 *************************************/
			System.out.println("交易成功");
	    }
    }
    
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
    <center>
        <font size=6>查询交易流水结果</font>
        <table width="350" border="1">
           <%
		  	if(respXml.get("responseCode")!=null){
		   %>
		  
          <tr><td>交易类型</td><td><%=respXml.get("txnType") %></td></tr>
          <tr><td>交易状态</td><td><%=respXml.get("txnStatus") %></td></tr>
          <tr><td>交易金额</td><td><%=respXml.get("amount") %></td></tr>  
          <tr><td>商户编号</td><td><%=respXml.get("merchantId") %></td></tr>
          <tr><td>终端编号</td><td><%=respXml.get("terminalId") %></td></tr>
          <tr><td>客户端交易时间</td><td><%=respXml.get("entryTime") %></td></tr>
          <tr><td>外部跟踪号</td><td><%=respXml.get("externalRefNumber") %></td></tr> 
          <tr><td>交易传输时间</td><td><%=respXml.get("transTime") %></td></tr>
		  <tr><td>撤销标志</td><td><%=respXml.get("voidFlag") %></td></tr>
		  <tr><td>系统参考号</td><td><%=respXml.get("refNumber") %></td></tr>
		  <tr><td>授权码</td><td><%=respXml.get("authorizationCode") %></td></tr>

		  
		  <tr>
		    <td><font color="#ff0000">应答码</font></td>
		    <td><font color="#ff0000"><%=respXml.get("responseCode") %></font></td>
		  </tr>
		  <tr>
		    <td><font color="#ff0000">应答码文本消息</font></td>
		    <td><font color="#ff0000"><%=respXml.get("responseTextMessage") %></font></td>
		  </tr>
		  
		  <%
		  	}else{
		  %>
 		  <tr><td>错误代码（errorCode）</td><td><%=respXml.get("errorCode") %></td></tr>
		  <tr><td>错误信息（errorMessage）</td><td><%=respXml.get("errorMessage") %></td></tr>
		  <%
		  }
		  %>    
        </table></br>
    </center><br>
  </body>
</html>