<%@LANGUAGE="VBSCRIPT.Encode" CODEPAGE="936"%>
<!--#include file="../Inc/config.asp"-->
<%
articPath=request("linkid")
response.redirect("http://"&LocalHostUrl&"/"&articPath)
%>