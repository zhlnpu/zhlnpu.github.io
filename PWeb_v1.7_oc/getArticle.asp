<%@LANGUAGE="VBSCRIPT.Encode" CODEPAGE="65001"%>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<!--#include file="Inc/config.asp"-->
<!--#include file="Inc/showNews.inc"-->
<!--#include file="admin/addMessage.asp"-->
<!--#include file="Inc/RecordIP.inc"-->
<%
Response.Expires = -1
Response.ExpiresAbsolute = Now() - 1
Response.cachecontrol = "no-cache"
Call RecordIP("Index.asp","IPRecord",1)		'Record IP

dim articID,articStr
dim title,topic,content,author,pubTime,fromUrl,downloadUrl
articID=request("articID")
articStr=""

'--------------------------
dim adminstr
if(session("master")<>"" and session("masterlive")=0) then
	adminstr="<a href='admin/addArticle.asp' target='_blank'>&#x53D1;&#x8868;&#x65B0;&#x6587;&#x7AE0;</a>&nbsp;&nbsp;"
else
	adminstr="&nbsp;"
end if
'--------------------------

on error resume next
dim sql,conn,rs
set conn=getconn()
set rs=getrs()

'-------update readCounter
sql="select top 1 * from articles where [id]="&articID
rs.open sql,conn,1,1
lastQuery=rs("lastQuery")
rs.close

sql="update articles set "
if(dateDiff("d",lastQuery,now)=0) then	'日计数
	sql=sql&"dayCounter=dayCounter+1,"
else
	sql=sql&"dayCounter=1,"
end if
if(dateDiff("m",lastQuery,now)=0) then	'月计数
	sql=sql&"monthCounter=monthCounter+1,"
else
	sql=sql&"monthCounter=1,"
end if
sql=sql&"readCounter=readCounter+1,lastQuery=Now() where [id]="&articID
conn.execute(sql)
'------------------------
sql="select * from articles where [id]="&articID
articStr="<table align='center' width='98%' border='0' cellspacing='0' cellpadding='0' class='artic'>"

rs.open sql,conn,1,1
if not rs.bof and not rs.eof then
	if(session("master")=rs("author") or (session("masterqx")<>"" and session("masterqx")<=1)) then
		adminstr=adminstr&"<a href='admin/alterArticle.asp?linkid="&articID&"&action=alter'>&#x7F16;&#x8F91;&#x6587;&#x7AE0;</a>&nbsp;&nbsp;"
		delStr="admin/saveAlterArticle.asp?linkid="&articID&"&action=del"
		'adminstr=adminstr&"<a href='"&delStr&"'>&#x5220;&#x9664;</a>"		
	end if
	title=rs("title")
	topic=rs("topic")
	content=rs("content")
	pubTime="&#x53D1;&#x8868;&#x65E5;&#x671F;: "&rs("pubTime")
	fromUrl="&#x51FA;&#x5904;: "&rs("fromUrl")
	author="&#x4F5C;&#x8005;: "&rs("author")
	downloadUrl=rs("downloadUrl")
	tempstr="&#x4E0B;&#x8F7D;&#x5730;&#x5740;: "
	readCounter="&#x9605;&#x8BFB;&#x6B21;&#x6570;: "&rs("readCounter")
	
	articStr=articStr&"<tr><td colspan='2' class='articTitle' height='28' valign='bottom'>"&title&"</td></tr>"
	articStr=articStr&"<tr><td colspan='2'><hr size='1' width='100%' class='xuxian'></hr></td></tr>"
	articStr=articStr&"<tr><td colspan='2' align='right'>"&author&" | "&fromUrl&" | "&pubTime&" | "&readCounter&"</td></tr>"
	articStr=articStr&"<tr><td colspan='2' class='articTopic'>"
	articStr=articStr&"<table align='center' width='98%' border='0' cellspacing='5' cellpadding='0' class='articTopic'><tr><td>"&topic&"</br></br>"
	if(downloadUrl<>"") then
		articStr=articStr&tempstr&"<a href='http://"&LocalHostUrl&"/"&downloadUrl&"' style='color:#3399FF;'>http://"&LocalHostUrl&"/"&downloadUrl&"</a>"
	end if	
	articStr=articStr&"</td></tr></table></td></tr>"
	articStr=articStr&"<tr><td colspan='2' align='right'>"&adminstr&"<hr size='1' width='100%' class='xuxian'></hr>"
	articStr=articStr&"</td></tr>"
	articStr=articStr&"<tr class='articText'><td colspan='2'>"&content&"</td></tr>"
end if
rs.close
articStr=articStr&"<tr><td colspan='2' align='right'>"&adminstr&"</td></tr></table>"
			
closeconn(conn)	

response.Write(articStr)
if(IfNeedMsg=1) then	'if live msg is allowed
%>
<hr size='1' width='98%' class='xuxian'></hr>
<table width="98%" border="0" cellspacing="0" cellpadding="0" align="center">
  <tr><td class='articMsg'>
  <table align='center' width='98%' border='0' cellspacing='5' cellpadding='0' class='articMsg'>
    <tr><td>&#x6700;&#x65B0;&#x7559;&#x8A00;:</td></tr>
    <tr><td id='showReaderMsg'>
<%
sql="select top 10 * from message where articID="&articID&" order by addDate desc"
Call shownews(sql,"id","msg,author,addDate",20,18,"admin/showMessage.asp","getArticle.asp",MsgLinkColor,"2-400-300-200-350",1,0)
%>
  </td></tr></table></td></tr>
</table>
<%
Call addMessage(articID)

end if		'if live msg is allowed
%>
<br/>