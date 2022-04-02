<%@LANGUAGE="VBSCRIPT.Encode" CODEPAGE="65001"%>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<!--#include file="Inc/config.asp"-->
<!--#include file="Inc/vbDecode.inc"-->
<%
Response.Expires = -1
Response.ExpiresAbsolute = Now() - 1
Response.cachecontrol = "no-cache"

dim menu_en,submenuStr,subtitle,subid
menu_en=request("submenu")
submenuStr=""

on error resume next
dim sql,conn,rs
set conn=getconn()
set rs=getrs()

'------------update counters---------
sql="select top 1 * from menus where menu_en='"&menu_en&"'"
rs.open sql,conn,1,1
lastQuery=rs("lastQuery")
rs.close

sql="update menus set "
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
sql=sql&"allCounter=allCounter+1,lastQuery=Now() where menu_en='"&menu_en&"'"
conn.execute(sql)
'---------------------

sql="select * from articles where menu='"&menu_en&"' order by pubTime"
submenuStr="<table width='100%' class='subMenu2' border='0' cellspacing='0' cellpadding='0'>"

dim firstArticId		'--show first article by default 2006.11.30 added
firstArticId="0"
rs.open sql,conn,1,1
if not rs.bof and not rs.eof then
	firstArticId=rs("id")
	for i=0 to rs.recordcount-1
		if rs.eof then exit for
		subtitle=rs("title")
		subid=rs("id")
		tempTopic=rs("topic")
		tempTopic=execRE("</?[^>]*>|\n|\r", "", tempTopic)
		submenuStr=submenuStr&"<tr><td><span class='handpic' "
		submenuStr=submenuStr&"onMouseOver=""oc_showTitleAlert(event,'"&left(tempTopic,28)&"...','ocTitleAlert')"" "
		submenuStr=submenuStr&"onMouseOut=""oc_hideTitleAlert('ocTitleAlert')"" "
		submenuStr=submenuStr&"onclick='javascript:showArticle("&subid&");"
		submenuStr=submenuStr&"for(j=0;j<"&rs.recordcount&";j++){"
		submenuStr=submenuStr&"this.parentNode.parentNode.parentNode.childNodes[j].childNodes[0].style.backgroundColor="""";};"
		submenuStr=submenuStr&"this.parentNode.style.backgroundColor=""#E4E4E4"";'>"
		submenuStr=submenuStr&"<img src='images/Line2.gif' border='0' class='handpic'>"
		submenuStr=submenuStr&subtitle&"</span></td></tr>"
		rs.movenext
	next
	rs.close
end if
submenuStr=submenuStr&"</table>"
			
closeconn(conn)		

'--------------add first article show----2006.11.30---------------
submenuStr=submenuStr&"|"&firstArticId
response.Write(submenuStr)	
%>