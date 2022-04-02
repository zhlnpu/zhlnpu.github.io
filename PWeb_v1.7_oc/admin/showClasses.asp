<%@LANGUAGE="VBSCRIPT.Encode" CODEPAGE="936"%>
<!--#include file="../Inc/config.asp"-->
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title><%=Index_Title%></title>
<link href="../CSS/xg.css" rel="stylesheet" type="text/css" />
</head>
<!--#include file="../Inc/Turn.inc"-->
<!--#include file="topMenu.asp"-->
<!--#include file="foot.asp"-->
<body onload="showClass.style.backgroundColor='#AED7FF'">
<!--#include file="top.asp"-->
<table align="center" width="800" height="80%" border="0" cellspacing="0" cellpadding="0">
  <tr><td valign="top"><%
  dim sql,thepage,shownum,page,pagenum,alterpage,delpage  
  sql="select [id],(select menu_cn from sys_classConfig where menu_en=upmenu) as 栏目,menu_cn as 菜单名,"
  sql=sql&"menu_en as 英文名,[index] as 排序,addDate as 添加日期,"
  sql=sql&"dayCounter as 日计数,monthCounter as 月计数,allCounter as 总计数"
  sql=sql&" from menus order by addDate desc"
  thepage="showClasses.asp"
  shownum=16
  alterpage="alterClass.asp"
  delpage="saveAlterClass.asp"
  dbstr="../"

  call ShowTable(sql,thepage,shownum,page,pagenum,"2-250-160-212-400",alterpage,delpage,"修改",0)  
  %></td></tr>  
  <tr>
    <td><%Call getFoot()%></td>
  </tr>
</table>
</body>
</html>