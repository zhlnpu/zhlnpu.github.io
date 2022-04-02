<%@LANGUAGE="VBSCRIPT.Encode" CODEPAGE="936"%>
<%if(session("master")="" or Session("masterlive")="1") then response.Redirect("index.asp")%>
<!--#include file="../Inc/config.asp"-->
<!--#include file="createHtml.inc"-->
<!--#include file="../Inc/vbDecode.inc"-->
<%
ADcontent=Chr(13)&"<iframe width=""100%"" height=""60"" frameborder=""0"" src="""&LocalAd_frame&""" scrolling=""no"" style=""text-indent:0px""></iframe>"&Chr(13)
Adcontent=Adcontent&"<div style='width:100%; background-image:url(../img/xuxian_l.gif);'><IMG height='1' src='img/1x1_pix.gif'></div><br>"
dim articleID,title,topic,fromUrl,content,pubTime,downloadUrl,menu,author,authorIP,articName,dbstr
articleID=vbDecode(request("linkid"))
title=request("title")
topic=request("topic")
topic=replace(topic,"<br/>","")
topic=replace(topic,Chr(13),"<br/>")
fromUrl=request("fromUrl")
content=request("content")
content=replace(content,"'","&acute;")
downloadUrl=request("downloadUrl")
menu=request("menu")
topClass=request("topclass")	'web top class
ifClass=request("ifSelectClass")
if(ifClass="true") then menu=topClass	'if selected top class then the article belong to top class
articName=request("articName")
author=request("author")
if(author<>session("master") and author<>"" and session("masterqx")>1) then response.Redirect("index.asp")
setTop=request("setTop")
if(setTop="") then setTop=0

pubTime=request("pubTime")
authorIP=Request.ServerVariables("remote_addr")

dbstr="../"
dim sql,conn
set conn=getconn()

dim action
action=request("action")
page=request("page")
if(page="") then page=1

if(action="alter") then
	sql="update articles set "
	sql=sql&"menu='"&menu&"',title='"&title&"',topic='"&topic&"',content='"&content&"'"
	sql=sql&",authorIP='"&authorIP&"',fromUrl='"&fromUrl&"',downloadUrl='"&downloadUrl&"',setTop="&setTop&" "
	sql=sql&" where [id]="&articleID
	conn.execute(sql)
	if(IfNeedAd=1) then content=ADcontent&content	'add google ad
	Call createHtml(articleID,title,topic,fromUrl,content,pubTime,downloadUrl,author,articName,dbstr)	'生成HTML
elseif(action="del") then
	sql="select * from articles where [id]="&articleID
	set rs=getrs()
	on error resume next
	rs.open sql,conn,1,1
	articName=rs("articName")
	author=rs("author")
	rs.close
	if(author<>session("master")) then response.redirect("index.asp")
	sql="delete from message where articID="&articleID
	conn.execute(sql)	'delete messages
	set fso=Server.CreateObject("Scripting.FileSystemObject")
	filepath=server.mapPath(dbstr)
	'response.write(filepath&"\"&articName)
	fso.deleteFile(filepath&"\"&articName)	'删除HTML文件
	sql="delete from articles where [id]="&articleID
	conn.execute(sql)
end if

conn.close
response.redirect("showArticle.asp?page="&page)
%>