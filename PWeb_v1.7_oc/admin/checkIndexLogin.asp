<%@LANGUAGE="VBSCRIPT.Encode" CODEPAGE="936"%>
<!-- #include file="../Inc/config.asp" -->
<!-- #include file="../Inc/vbDecode.inc" -->
<%
	dbstr="../"
	username=vbDecode(Trim(request("username")))
	if(len(username)>20) then response.end
	userpass=Trim(request("userpass"))
	dim conn,rs,sql
	set conn=getconn()
	set rs=getrs()
	
	sql="select * from users where username='"&username&"'"
	rs.open sql,conn,3,3
	if rs.bof and rs.eof then 
		errormsg="Wrong user name!"
	else
		if userpass<>rs("userpass") then 
			errormsg="Wrong password!"
		else 
			Session("master")=username			'��¼�û���
			Session("masterqx")=rs("usertype")		'��¼�û�Ȩ��
			Session("masterlive")=rs("alive")		'��¼�û�״̬
			Session("masterid")=rs("id")			'��¼�û�ID
			rs("ifonline")=1
			rs.update
			redirectstr="admin/"				
		end if
	end if
	
	if errormsg<>"" then 
		response.write(errormsg)
	else
		response.write("100|"&redirectstr)			
	end if
	
	rs.close
	closeconn(conn)	
%>