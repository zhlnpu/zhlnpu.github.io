<%@LANGUAGE="VBSCRIPT.Encode" CODEPAGE="936"%>
<!-- #include file="../Inc/config.asp" -->
<%
if(session("master")="" or session("masterqx")>1) then response.Redirect("index.asp")
	action=request("action")
	dbstr="../"
	msgid=request("linkid")
	page=request("page")
	dim conn,sql
	set conn=getconn()

	if(action="del") then	
		sql="delete from message where [id]="&msgid
		conn.execute(sql)
		response.redirect("showMsg.asp?page="&page)
	end if
	closeconn(conn)	
%>
