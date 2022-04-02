<%@LANGUAGE="VBSCRIPT.Encode" CODEPAGE="936"%>
<!--#include file="Inc/config.asp"-->
<%
dim articID,articStr
dim articName
articID=request("articID")
articStr=""

on error resume next
dim sql,conn,rs
set conn=getconn()
set rs=getrs()

sql="select * from articles where [id]="&articID
rs.open sql,conn,1,1
if not rs.bof and not rs.eof then
	articName=rs("articName")
end if
rs.close
closeconn(conn)

response.write(articName)
%>