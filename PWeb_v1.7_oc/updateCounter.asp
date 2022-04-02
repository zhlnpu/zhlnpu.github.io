<%@LANGUAGE="VBSCRIPT.Encode" CODEPAGE="65001"%>
<!--#include file="Inc/config.asp"-->
<%
on error resume next
articID=request("articID")
set conn=getconn()
set rs=getrs()
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

sql="select top 1 * from articles where [id]="&articID
rs.open sql,conn,1,1
readCounter=rs("readCounter")
rs.close
conn.close

Response.Expires = -1
Response.ExpiresAbsolute = Now() - 1
Response.cachecontrol = "no-cache"
response.write(readCounter)
%>