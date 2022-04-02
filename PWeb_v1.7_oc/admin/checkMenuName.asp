<%@LANGUAGE="VBSCRIPT.Encode" CODEPAGE="936"%>
<!--#include file="../Inc/config.asp"-->
<%
dbstr="../"
Dim conn,rs,sql
Set conn=getconn()
Set rs=getrs()

menu_en=request("menu_en")
menuid=request("id")

sql="select top 1 * from menus where menu_en='"&menu_en&"'"
If(menuid<>"") Then sql=sql&" and [id]<>"&menuid

On Error Resume Next
rs.open sql,conn,1,1
If Not rs.bof And Not rs.eof Then
	response.write("1")	'如果存在则返回1
Else
	response.write("0")
End If 
%>