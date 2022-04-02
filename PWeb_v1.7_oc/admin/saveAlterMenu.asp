<%@LANGUAGE="VBSCRIPT.Encode" CODEPAGE="936"%>
<!--#include file="../Inc/config.asp"-->
<%
if(session("master")="" or session("masterqx")>1) then response.Redirect("index.asp")
menuID=request("linkid")
menu_cn=request("menu_cn")
menu_en=request("menu_en")
indexstr=request("index")

dbstr="../"
dim sql,conn
set conn=getconn()

dim action
action=request("action")

if(action="alter") then
	set rs=getrs()
	sql="select * from sys_classConfig where [id]="&menuID
	rs.open sql,conn,1,1
	if not rs.bof and not rs.eof then
		ormenu_en=rs("menu_en")
	end if
	rs.close
	sql="update menus set upmenu='"&menu_en&"' where upmenu='"&ormenu_en&"'"
	conn.execute(sql)	'update menus
	sql="update sys_classConfig set "
	sql=sql&"menu_cn='"&menu_cn&"',menu_en='"&menu_en&"',[index]="&indexstr
	sql=sql&" where [id]="&menuID
elseif(action="del") then
	sql="delete from sys_classConfig where [id]="&menuID	'删除栏目的时候保留其栏目下的分类
end if

conn.execute(sql)
closeconn(conn)
if(action="del") then response.redirect("showTopmenus.asp")
%>
<script language="javascript">
<!--
window.opener.location.reload();
window.opener=null;
window.close();
-->
</script>
