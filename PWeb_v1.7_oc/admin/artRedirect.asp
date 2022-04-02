<%@LANGUAGE="VBSCRIPT.Encode" CODEPAGE="936"%>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<%
fileName=request("fn")

response.redirect("../"&fileName)
%>