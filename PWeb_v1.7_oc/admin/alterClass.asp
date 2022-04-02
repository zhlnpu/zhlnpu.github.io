<%@LANGUAGE="VBSCRIPT.Encode" CODEPAGE="936"%>
<!--#include file="../Inc/config.asp"-->
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title><%=Index_Title%></title>
<link href="../CSS/xg.css" rel="stylesheet" type="text/css">
<script language="javascript" src="../JS/xmlHttpRequest.js"></script>
<script language="javascript" src="../JS/admin_addClass.js"></script>
</head>
<%dbstr="../"%>
<!--#include file="../Inc/ClassConfig.inc"-->
<%
menuID=request("linkid")
action=request("action")

dim conn,rs,sql
set conn=getconn()
set rs=getrs()

sql="select * from menus where [id]="&menuID
rs.open sql,conn,1,1
if not rs.bof and not rs.eof then
	upmenu=rs("upmenu")
	menu_cn=rs("menu_cn")
	menu_en=rs("menu_en")
	indexstr=rs("index")	
end if

closeconn(conn)
%>
<body>
<table align="center" border="0" cellspacing="5" cellpadding="0">
<form name="addclassForm" method="post" action="saveAlterClass.asp">
  <tr>
    <td valign="middle">栏&nbsp;&nbsp;目:<select name="upmenu"><%for i=0 to UBound(classname)-1
	if(upmenu=classcode(i)) then
		selectstr="<option value="&classcode(i)&" selected='selected'>"&classname(i)&"</option>"
	else
		selectstr="<option value="&classcode(i)&">"&classname(i)&"</option>"
	end if
		response.Write(selectstr)
	next%>
        </select>
    </td>
	<td id="showCheckResult">&nbsp;</td>
  </tr>
  <tr>
    <td valign="middle" colspan="2">菜单名:<input type="text" name="menu_cn" value="<%=menu_cn%>" style="width:150px"></td>
  </tr>
  <tr>
    <td valign="middle">英文名:<input type="text" name="menu_en" value="<%=menu_en%>" style="width:90px"></td>
	<td><a href="javascript:void(0);" onclick="alterCheckMenuName(document.getElementById('menu_en').value,<%=menuID%>)">检查重复</a></td>
  </tr>
  <tr>
    <td valign="middle" colspan="2">排&nbsp;&nbsp;序:<input type="text" name="index" value="<%=indexstr%>" style="width:150px"></td>
  </tr>
  <tr>
    <td align="center" valign="middle" colspan="2"><input type="button" name="cancle" value="取消" onClick="javascript:window.opener=null;window.close();">&nbsp;&nbsp;<input type="button" name="saveit" value="保存" onClick="saveClass()"><input type="hidden" value="<%=menuID%>" name="linkid" /><input type="hidden" value="<%=action%>" name="action" />
    </td>
  </tr>
</form>
</table>
</body>
</html>
<script language="javascript" for="document" event="onkeydown"> 
<!-- 
if(event.keyCode==13){ 
	saveClass();
}
-->
</script>