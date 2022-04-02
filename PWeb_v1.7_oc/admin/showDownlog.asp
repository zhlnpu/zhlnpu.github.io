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
  sql="select [fromIP],fromIP as IP地址,fileName as 文件名,downTime as 下载时间,[user] as 下载用户 from downlog order by downTime desc"
  thepage="showDownlog.asp"
  shownum=16
  alterpage="showIPaddress.asp"
  delpage="#"
  dbstr="../"

  call ShowTable(sql,thepage,shownum,page,pagenum,"2-240-180-240-400",alterpage,delpage,"修改",1)  
  %></td></tr>  
  <tr>
    <td><%Call getFoot()%></td>
  </tr>
</table>
</body>
</html>