<%@LANGUAGE="VBSCRIPT.Encode" CODEPAGE="936"%>
<!--#include file="../Inc/config.asp"-->
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title><%=Index_Title%></title>
<link href="../CSS/xg.css" rel="stylesheet" type="text/css" />
</head>
<!--#include file="../Inc/Turn.inc"-->
<!--#include file="foot.asp"-->
<!--#include file="topMenu.asp"-->
<body onload="showIP.style.backgroundColor='#AED7FF'">
<!--#include file="top.asp"-->
<table align="center" width="800" height="80%" border="0" cellspacing="0" cellpadding="0">
  <tr><td valign="top"><%
  dim sql,thepage,shownum,page,pagenum,alterpage,delpage  
  sql="select userIP,userIP as IP��ַ,logTime as ����ʱ��,userBrowser as ������汾,userOS as ����ϵͳ�汾,thepage as ����ҳ�� from IPRecord order by logTime desc"
  thepage="showIPRecord.asp"
  shownum=16
  alterpage="showIPaddress.asp"
  delpage="#"
  dbstr="../"

  call ShowTable(sql,thepage,shownum,page,pagenum,"2-240-180-240-400",alterpage,delpage,"�޸�",1)  
  %></td></tr>  
  <tr>
    <td><%Call getFoot()%></td>
  </tr>
</table>
</body>
</html>