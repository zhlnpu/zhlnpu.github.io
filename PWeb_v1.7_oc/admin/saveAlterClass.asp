<%@LANGUAGE="VBSCRIPT.Encode" CODEPAGE="936"%>
<!--#include file="../Inc/config.asp"-->
<%
if(session("master")="" or session("masterqx")>1) then response.Redirect("../index.asp")
menuID=request("linkid")
upmenu=request("upmenu")
menu_cn=request("menu_cn")
menu_en=request("menu_en")
indexstr=request("index")

dbstr="../"
dim sql,conn,rs
set conn=getconn()
Set rs=getrs()
'---check menu name EN
On Error Resume Next
sql="select top 1 * from menus where menu_en='"&menu_en&"' and [id]<>"&menuID
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

dim action
action=request("action")

if(action="alter") Then
	sql="select * from menus where [id]="&menuID
	rs.open sql,conn,1,1
	menu_en_or=rs("menu_en")		'查询原有菜单英文名
	rs.close
	sql="update menus set "
	sql=sql&"upmenu='"&upmenu&"',menu_cn='"&menu_cn&"',menu_en='"&menu_en&"',[index]="&indexstr
	sql=sql&" where [id]="&menuID
	conn.execute(sql)				'修改文章分类
	sql="update articles set menu='"&menu_en&"' where menu='"&menu_en_or&"'"	'修改该分类下所有文章的分类英文名
elseif(action="del") then
	sql="delete from menus where [id]="&menuID	'删除文章分类的时候保留其分类下的文章
end if

conn.execute(sql)
closeconn(conn)
if(action="del") then response.redirect("showClasses.asp")
%>
<script language="javascript">
<!--
window.opener.location.reload();
window.opener=null;
window.close();
-->
</script>
