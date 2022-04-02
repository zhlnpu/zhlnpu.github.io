<%@LANGUAGE="VBSCRIPT.Encode" CODEPAGE="936"%>
<!-- #include file="../Inc/config.asp" -->
<%
if(session("master")="" or session("masterqx")>1) then response.Redirect("index.asp")
action=request("action")
page=request("page")
dbstr="../"
userid=request("linkid")
username=Trim(request("username"))
userpass=request("userpass")
usertype=request("usertype")
ifalive=request("ifalive")
ifalterpass=request("ifalterpass")
dim conn,sql
set conn=getconn()

if(action="alter") then	
	sql="update users set "
	sql=sql&"username='"&username&"'"
	if(CInt(usertype) >= CInt(session("masterqx"))) then sql=sql&",usertype="&usertype
	if(ifalterpass="true") then sql=sql&",userpass='"&userpass&"'"
	if(ifalive="alive") then 
		sql=sql&",alive=0"
	else
		sql=sql&",alive=1"
	end if
	sql=sql&" where [id]="&userid
	conn.execute(sql)
elseif(action="del") then	
	sql="delete from users where [id]="&userid
	conn.execute(sql)
	response.redirect("showUsers.asp?page="&page)
end if
	closeconn(conn)	
	redirectstr="showUsers.asp?page="&page
%>
<script language="javascript">
<!--
	window.opener.location.href="<%=redirectstr%>";	
	window.opener=null;
	window.close();
-->		
</script>