<%@LANGUAGE="VBSCRIPT.Encode" CODEPAGE="936"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>�鿴����</title>
<link href="../CSS/xg.css" rel="stylesheet" type="text/css">
</head>
<!--#include file="../Inc/config.asp"-->
<body>
<%
msgID=request("linkid")
dbstr="../"
dim conn,rs,sql
set conn=getconn()
set rs=getrs()
sql="select * from message where [id]="&msgID
rs.open sql,conn,1,1

if not rs.bof and not rs.eof then
	author=rs("author")
	addDate=rs("addDate")
	msg=rs("msg")
end if

rs.close
closeconn(conn)
%>
<table width="400" height="282" border="0" cellspacing="3" cellpadding="0" class="usualText">
  <tr>
    <td>���ߣ�<%=author%>&nbsp;&nbsp;&nbsp;&nbsp;����ʱ�䣺<%=addDate%></td>
  </tr>
  <tr>
    <td>���ݣ�</td>
  </tr>
  <tr bgcolor="#E8E8E8">
    <td height="220" valign="top"><table width="96%" border="0" cellspacing="5" cellpadding="0">
	<tr><td class="subMenu" style="word-break: break-all;word-wrap:break-word;"><%=msg%></td></tr></table>
    </td>
  </tr>
  <tr>
    <td align="center">
      <input type="button" name="Submit" value="�ر�" onClick="javascript:window.opener=null;window.close();">
    </td>
  </tr>
</table>
</body>
</html>