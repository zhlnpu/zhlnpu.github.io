<%@LANGUAGE="VBSCRIPT.Encode" CODEPAGE="936"%>
<!--#include file="../Inc/config.asp"-->
<!--#include file="../Inc/ipCheck.inc"-->
<%
ipstr=request("ipstr")
ipfrom=request("ipfrom")
dim conn,rs,sql
dbstr="../"
set conn = server.CreateObject("ADODB.Connection")
conn.Open "Provider=Microsoft.Jet.OLEDB.4.0; Data Source=" & server.MapPath(dbstr&IPDataPath)
set rs=server.createobject("ADODB.recordset")

sql="select top 1 * from [ip] where "&cip(ipstr)&" >=ip1 and "&cip(ipstr)&"<=ip2"
rs.open sql,conn,3,3
if(not rs.bof and not rs.eof) then
	rs("addr")=ipfrom
	rs.update
	backStr="updateOK"
else
	backStr="updateFailed"
end if

rs.close
conn.close

response.write(backStr)
%>