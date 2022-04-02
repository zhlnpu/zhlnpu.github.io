<%@LANGUAGE="VBSCRIPT.Encode" CODEPAGE="65001"%>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<!--#include file="Inc/config.asp"-->
<%
Response.Expires = -1
Response.ExpiresAbsolute = Now() - 1
Response.cachecontrol = "no-cache"

dim upmenu,menu_cn,menu_en,outStr,submenuStr,subtitle
outStr=""
submenuStr=""
upmenu=request("upmenu")

on error resume next
dim conn,rs,sql,subrs
set conn=getconn()
set rs=getrs()
set subrs=getrs()

'------------update counters---------
sql="select top 1 * from sys_classConfig where menu_en='"&upmenu&"'"
rs.open sql,conn,1,1
lastQuery=rs("lastQuery")
rs.close

sql="update sys_classConfig set "
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
sql=sql&"allCounter=allCounter+1,lastQuery=Now() where menu_en='"&upmenu&"'"
conn.execute(sql)
'---------------------
outStr=outStr&"<img src='images/main.gif' border='0' class='handpic'>"
outStr=outStr&"<a href='default.asp' class='midBlue'>&nbsp;Main</a></br>"

dim firstClass			'record first article class name (2006.11.30 added)
firstClass="0"
sql="select top 20 * from menus where upmenu='"&upmenu&"' order by index"
rs.open sql,conn,1,1
if not rs.bof and not rs.eof then
	firstClass=rs("menu_en")
	for i=0 to rs.recordcount-1
		if rs.eof then exit for
			menu_cn=rs("menu_cn")
			menu_en=rs("menu_en")
			
			submenuStr="<span id='submenu"&i&"'></span>"
			if(i<rs.recordcount-1) then
				outStr=outStr&"<img src='images/open_pic.gif' id='upmenu"&i&"' border='0' onclick=""chengepic('"&menu_en&"',"&i&")"" class='handpic'>"
			else
				outStr=outStr&"<img src='images/openpic2.gif' id='upmenu"&i&"' border='0' onclick=""chengepic('"&menu_en&"',"&i&")"" class='handpic'>"
			end if
			outStr=outStr&"<img src='images/folder.gif' id='upmenufolder"&i&"' border='0' class='handpic'>"
			outStr=outStr&"<a href='javascript:void(0)' onclick=""chengepic('"&menu_en&"',"&i&")"" class='midBlue'>"&menu_cn&"</a></br>"
			outStr=outStr&submenuStr
		rs.movenext
	next
end if
rs.close
'---------------------
dim firstArticle			'record first article name (2006.11.30 added)
firstArticle="0"
sql="select * from articles where menu='"&upmenu&"' order by pubTime"
outStr=outStr&"<table width='100%' class='subMenu2' border='0' cellspacing='0' cellpadding='0'>"

rs.open sql,conn,1,1
if not rs.bof and not rs.eof then
	firstArticle=rs("id")
	for i=0 to rs.recordcount-1
		if rs.eof then exit for
		subtitle=rs("title")
		subid=rs("id")
		outStr=outStr&"<tr><td><div class='handpic' onclick='showArticle("&subid&");"
		outStr=outStr&"for(j=0;j<"&rs.recordcount&";j++){"
		outStr=outStr&"this.parentNode.parentNode.parentNode.childNodes[j].childNodes[0].childNodes[0].style.backgroundColor="""";};"
		outStr=outStr&"this.style.backgroundColor=""#E4E4E4"";'>"
		outStr=outStr&"<img src='images/Line2.gif' border='0' class='handpic'>"
		outStr=outStr&subtitle&"</div></td></tr>"
		rs.movenext
	next
end if
outStr=outStr&"</table>"
rs.close
'---------------------
closeconn(conn)

'--------add first article name and first article class name to show by default--------
outStr=outStr&"|"&firstClass&"|"&firstArticle
response.Write(outStr)
%>