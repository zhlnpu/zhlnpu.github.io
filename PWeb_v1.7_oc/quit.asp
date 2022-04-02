<%@LANGUAGE="VBSCRIPT.Encode" CODEPAGE="936"%>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<!-- #include file="Inc/config.asp" -->
<%
on error resume next
set conn=getconn()
if(session("master")<>"") then 
	sql="update users set ifonline=0 where username='"&session("master")&"'"
	conn.execute(sql)
end if
conn.close

Session.Abandon()
response.redirect("/")
%>