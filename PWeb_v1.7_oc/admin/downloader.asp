<%@LANGUAGE="VBSCRIPT.Encode" CODEPAGE="936"%>
<!--#include file="../Inc/config.asp"-->
<!--#include file="../Inc/vbDecode.inc"-->
<%
fileName=replace(request("fn"),"'","")
fileName=vbDecode(fileName)
if(fileName="") then
	response.write("Wrong arguments! Please check it!")
	response.end
end if

downTime=now()
downUser=session("master")
downIP=Request.ServerVariables("remote_addr")
dbstr="../"

dim conn,sql
set conn=getconn()
sql="insert into downlog(fileName,downTime,fromIP,[user]) values("
sql=sql&"'"&fileName&"','"&downTime&"','"&downIP&"'"
if(downUser<>"") then
	sql=sql&",'"&downUser&"')"
else
	sql=sql&",'Anonymous')"
end if
conn.execute(sql)
conn.close
response.redirect("http://"&LocalHostUrl&"/downloads/"&fileName)
%>