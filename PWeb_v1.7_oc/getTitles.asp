<%@LANGUAGE="VBSCRIPT.Encode" CODEPAGE="65001"%>
<!--#include file="Inc/config.asp"-->
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<%
menu_en=request("menu_en")
brNum=request("brNum")
dim conn,rs,sql
set conn=getconn()
set rs=getrs()

on error resume next
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

sql="select top 20 * from articles where menu='"&menu_en&"' order by pubTime desc"
outStr=""
i=0
rs.open sql,conn,1,1
if not rs.bof and not rs.eof then
	while not rs.eof
		if((i mod brNum)=0) then outStr=outStr&"<br/>"
		outStr=outStr&"<font size='2'><a href='javascript:void(0);' onclick='showArticle("&rs("id")&");'>"&rs("title")&"</a> | </font>"
		rs.movenext
		i=i+1
	wend
end if

rs.close
conn.close
response.Write(outStr)
%>