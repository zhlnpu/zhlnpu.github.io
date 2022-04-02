<%@LANGUAGE="VBSCRIPT.Encode" CODEPAGE="936"%>
<!--#include file="../Inc/config.asp"-->
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title><%=Index_Title%></title>
<link href="../CSS/xg.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="../JS/admin_addTopmenu.js"></script>
</head>
<%dbstr="../"%>
<%
menuID=request("linkid")
action=request("action")

dim conn,rs,sql
set conn=getconn()
set rs=getrs()

sql="select * from sys_classConfig where [id]="&menuID
rs.open sql,conn,1,1
if not rs.bof and not rs.eof then
	menu_cn=rs("menu_cn")
	menu_en=rs("menu_en")
	indexstr=rs("index")	
end if
rs.close
closeconn(conn)
%>
<body>
<table align="center" border="0" cellspacing="5" cellpadding="0">
<form name="addclassForm" method="post" action="saveAlterMenu.asp">
  <tr>
    <td valign="middle">菜单名:
      <input type="text" name="menu_cn" value="<%=menu_cn%>"></td>
  </tr>
  <tr>
    <td valign="middle">英文名:
      <input type="text" name="menu_en" value="<%=menu_en%>"></td>
  </tr>
  <tr>
    <td valign="middle">排&nbsp;&nbsp;序:
      <input type="text" name="index" value="<%=indexstr%>"></td>
  </tr>
  <tr>
    <td align="center" valign="middle"><input type="button" name="cancle" value="取消" onClick="javascript:window.opener=null;window.close();">
      &nbsp;&nbsp;
      <input type="button" name="saveit" value="保存" onClick="saveMenu()">
	<input type="hidden" value="<%=menuID%>" name="linkid" />
	<input type="hidden" value="<%=action%>" name="action" />
    </td>
  </tr>
</form>
</table>
</body>
</html>
<script language="javascript" for="document" event="onkeydown"> 
<!-- 
if(event.keyCode==13){ 
	saveMenu();
}
-->
</script>