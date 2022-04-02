<%@LANGUAGE="VBSCRIPT.Encode" CODEPAGE="65001"%>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<!--#include file="Inc/config.asp"-->
<!--#include file="Inc/showNews.inc"-->
<%
articID=request("articID")
on error resume next
Response.Expires = -1
Response.ExpiresAbsolute = Now() - 1
Response.cachecontrol = "no-cache"
sql="select top 10 * from message where articID="&articID&" order by addDate desc"
Call shownews(sql,"id","msg,author,addDate",10,18,"../admin/showMessage.asp","getArticle.asp","0","2-400-300-200-350",1,0)
%>