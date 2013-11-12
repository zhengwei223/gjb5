<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
Double value = (Double)session.getAttribute("progress_value");
if(value==null){
	value=0.0;
}
String msg = (String)session.getAttribute("progress_msg_sub");
String total_msg = (String)session.getAttribute("progress_msg");
if(msg==null){
	msg="";
}
//msg="存储完成";
String result = "{\"value\":\""+value+"\",\"msg\":\""+msg+"\",\"total_msg\":\""+total_msg+"\"}";
if(msg.equals("存储完成")||msg.startsWith("采集错误")||msg.startsWith("存储错误")){
session.removeAttribute("progress_value");
session.removeAttribute("progress_msg_sub");
session.removeAttribute("progress_msg");
}
out.print(result);
out.flush();
%>    
