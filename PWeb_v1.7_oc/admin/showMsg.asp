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
<body onload="showMsg.style.backgroundColor='#AED7FF'">
<!--#include file="top.asp"-->
<table align="center" width="800" height="80%" border="0" cellspacing="0" cellpadding="0">
  <tr><td valign="top"><%
  dim sql,thepage,shownum,page,pagenum,alterpage,delpage  
  sql="select [id],(select title from articles where [id]=articID) as 文章标题,author as 留言者,addDate as 发表日期,fromIP as IP地址 from message"
  sql=sql&" order by addDate desc"
  thepage="showMsg.asp"
  shownum=16
  alterpage="showMessage.asp"
  delpage="saveAlterMsg.asp"
  dbstr="../"

  call ShowTable(sql,thepage,shownum,page,pagenum,"2-400-300-200-350",alterpage,delpage,"查看",0)  
  %></td></tr>  
  <tr>
    <td><%Call getFoot()%></td>
  </tr>
</table>
</body>
</html>