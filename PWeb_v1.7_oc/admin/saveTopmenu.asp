<%@LANGUAGE="VBSCRIPT.Encode" CODEPAGE="936"%>
<!--#include file="../Inc/config.asp"-->
<%
if(session("master")="" or session("masterqx")>1) then response.Redirect("index.asp")
dim menu_cn,menu_en,indexstr
menu_cn=request("menu_cn")
menu_en=request("menu_en")
indexstr=request("index")

dbstr="../"
dim conn,sql
set conn=getconn()
sql="insert into sys_classConfig(menu_cn,menu_en,[index]) values("
sql=sql&"'"&menu_cn&"','"&menu_en&"',"&indexstr&")"
conn.execute(sql)
closeconn(conn)
%>
<script language="javascript">
<!--
window.opener.location.reload();
window.opener=null;
window.close();
-->
</script>