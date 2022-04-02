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
<body onload="showTopmenu.style.backgroundColor='#AED7FF'">
<!--#include file="top.asp"-->
<table align="center" width="800" height="80%" border="0" cellspacing="0" cellpadding="0">
  <tr><td valign="top"><%
  dim sql,thepage,shownum,page,pagenum,alterpage,delpage  
  sql="select [id],menu_cn as 栏目名,menu_en as 英文名,[index] as 排序,"
  sql=sql&"dayCounter as 日计数,monthCounter as 月计数,allCounter as 总计数"
  sql=sql&" from sys_classConfig order by [index]"
  thepage="showTopmenus.asp"
  shownum=16
  alterpage="alterTopmenu.asp"
  delpage="saveAlterMenu.asp"
  dbstr="../"

  call ShowTable(sql,thepage,shownum,page,pagenum,"2-250-140-212-400",alterpage,delpage,"修改",0)  
  %></td></tr>  
  <tr>
    <td><%Call getFoot()%></td>
  </tr>
</table>
</body>
</html>