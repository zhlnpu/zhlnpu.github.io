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
alert("��Ӣ�Ĳ˵����Ѿ����ڣ�");
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
	menu_en_or=rs("menu_en")		'��ѯԭ�в˵�Ӣ����
	rs.close
	sql="update menus set "
	sql=sql&"upmenu='"&upmenu&"',menu_cn='"&menu_cn&"',menu_en='"&menu_en&"',[index]="&indexstr
	sql=sql&" where [id]="&menuID
	conn.execute(sql)				'�޸����·���
	sql="update articles set menu='"&menu_en&"' where menu='"&menu_en_or&"'"	'�޸ĸ÷������������µķ���Ӣ����
elseif(action="del") then
	sql="delete from menus where [id]="&menuID	'ɾ�����·����ʱ����������µ�����
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
