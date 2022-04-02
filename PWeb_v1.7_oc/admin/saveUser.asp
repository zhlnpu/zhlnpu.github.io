<%@LANGUAGE="VBSCRIPT.Encode" CODEPAGE="936"%>
<!-- #include file="../Inc/config.asp" -->
<%
if(session("master")="" or session("masterqx")>1) then response.Redirect("index.asp")
	dbstr="../"
	username=Trim(request("username"))
	if(len(username)>20) then 		'出于安全考虑
		response.write("User name length is too long!")
		response.end
	elseif(inStr(username,"\")>0 or inStr(username,"<")>0 or inStr(username,"&")>0 or inStr(username,"/")>0 or IsNumeric(left(username,1))) then
		response.write("User name is invalid!")
		response.end	
	end if
	username=replace(username,"<","")
	username=replace(username,"&","")
	username=replace(username,"'","&acute;")
	username=Server.HTMLencode(username)
	userpass=Trim(request("userpass"))
	usertype=Trim(request("usertype"))
	dim conn,sql
	set conn=getconn()
	
	sql="insert into users(username,userpass,usertype) "
	sql=sql&"values('"&username&"','"&userpass&"',"&usertype&")"
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