<%@LANGUAGE="VBSCRIPT.Encode" CODEPAGE="936"%>
<%if(session("master")="" or Session("masterlive")="1") then response.Redirect("index.asp")%>
<!--#include file="../Inc/config.asp"-->
<!--#include file="createHtml.inc"-->
<%
on error resume next
ADcontent=Chr(13)&"<iframe width=""100%"" height=""60"" frameborder=""0"" src="""&LocalAd_frame&""" scrolling=""no"" style=""text-indent:0px""></iframe>"&Chr(13)
Adcontent=Adcontent&"<div style='width:100%; background-image:url(../img/xuxian_l.gif);'><IMG height='1' src='img/1x1_pix.gif'></div><br>"
dim articID,title,topic,fromUrl,content,pubTime,downloadUrl,menu,author,authorIP,articName

page=request("page")
title=request("title")
topic=request("topic")
topic=replace(topic,"<br/>","")
topic=replace(topic,Chr(13),"<br/>")
fromUrl=request("fromUrl")
content=request("content")
content=replace(content,"'","&acute;")
downloadUrl=request("downloadUrl")
menu=request("menu")
topClass=request("topClass")	'web top class
ifClass=request("ifSelectClass")
if(ifClass="true") then menu=topClass	'if selected top class then the article belong to top class

pubTime=now()
author=session("master")
authorIP=Request.ServerVariables("remote_addr")
articName=year(now)&month(now)&day(now)&hour(now)&minute(now)&second(now)&".htm"

dbstr="../"
dim sql,conn,rs
set conn=getconn()
set rs=getrs()

sql="insert into articles(articName,menu, title, topic, content, pubTime, author, authorIP, fromUrl, downloadUrl) "
sql=sql&"values('"&ArticleSavePath&articName&"','"&menu&"','"&title&"','"&topic&"','"&content&"',"
sql=sql&"'"&pubTime&"','"&author&"','"&authorIP&"','"&fromUrl&"','"&downloadUrl&"')"
conn.execute(sql)	'保存数据

sql="select top 1 * from articles order by [id] desc"
rs.open sql,conn,1,1
articID=rs("id")
rs.close
closeconn(conn)
if(IfNeedAd=1) then content=ADcontent&content	'add google ad
Call createHtml(articID,title,topic,fromUrl,content,pubTime,downloadUrl,author,articName,dbstr&ArticleSavePath)	'生成HTML
response.redirect("showArticle.asp?page="&page)
%>
