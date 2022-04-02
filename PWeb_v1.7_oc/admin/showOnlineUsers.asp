<%@LANGUAGE="VBSCRIPT.Encode" CODEPAGE="936"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>查看在线用户</title>
<link href="../CSS/xg.css" rel="stylesheet" type="text/css">
</head>
<!--#include file="../Inc/config.asp"-->
<body>
<%
dbstr="../"
onusers=""
dim conn,rs,sql
set conn=getconn()
set rs=getrs()
sql="select * from users where [ifonline]=1"
rs.open sql,conn,1,1
while not rs.bof and not rs.eof
	onusers=onusers&rs("username")&"、"
	rs.movenext
wend
rs.close
closeconn(conn)
if(onusers="") then onusers="目前暂无会员在线！"
%>
<table width="400" height="282" border="0" cellspacing="3" cellpadding="0" class="usualText">
  <tr>
    <td>统计时间：<%=Now()%></td>
  </tr>
  <tr>
    <td>在线用户：</td>
  </tr>
  <tr bgcolor="#E8E8E8">
    <td height="220" valign="top"><table width="96%" border="0" cellspacing="5" cellpadding="0">
	<tr><td class="subMenu"><%=onusers%></td></tr></table>
    </td>
  </tr>
  <tr>
    <td align="center">
      <input type="button" name="close" value="关闭" onClick="javascript:window.opener=null;window.close();">
    </td>
  </tr>
</table>
</body>
</html>