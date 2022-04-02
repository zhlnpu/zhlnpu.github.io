<%@LANGUAGE="VBSCRIPT.Encode" CODEPAGE="936"%>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<!--#include file="../Inc/config.asp"-->
<%
if(session("master")="" or session("masterqx")>1) then response.Redirect("index.asp")
dim upmenu,menu_cn,menu_en,indexstr
upmenu=request("upmenu")
menu_cn=request("menu_cn")
menu_en=request("menu_en")
indexstr=request("index")

dbstr="../"
dim conn,rs,sql
set conn=getconn()
Set rs=getrs()
'---check menu name EN
On Error Resume Next
sql="select top 1 * from menus where menu_en='"&menu_en&"'"
rs.open sql,conn,1,1
If Not rs.bof And Not rs.eof Then
%>
<script language="javascript">
<!--
alert("此英文菜单名已经存在！");
history.back(0);
//-->
</script>	
<%
	response.End
End If 
rs.close	'------

sql="insert into menus(upmenu,menu_cn,menu_en,[index]) values("
sql=sql&"'"&upmenu&"','"&menu_cn&"','"&menu_en&"',"&indexstr&")"
conn.execute(sql)
closeconn(conn)
%>
<script language="javascript">
<!--
window.opener.location.reload();
window.opener=null;
window.close();
//-->
</script>