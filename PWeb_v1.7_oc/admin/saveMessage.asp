<%@LANGUAGE="VBSCRIPT.Encode" CODEPAGE="936"%>
<!-- #include file="../Inc/config.asp" -->
<!-- #include file="../Inc/vbDecode.inc" -->
<%
Response.Expires = -1
Response.ExpiresAbsolute = Now() - 1
Response.cachecontrol = "no-cache"

if(session("master")="" and IfNeedLogin="1") then	'if need login is true and the just user didn't login
	response.write("loginFalse")
else
	dbstr="../"
	articID=Trim(request("articID"))
	msg=Trim(request("msgcontent"))		'出于安全考虑
	if(inStr(msg,"\")>0 or inStr(msg,"/")>0 or inStr(msg,"<")>0 or inStr(msg,"&")>0) then
		'invalid letter
		response.write("e101")
	elseif(len(msg)>200) then
		'msg is too long
		response.write("e102")	
	else
		'--------------save the new msg----------------
		msg=vbDecode(msg)
		author=session("master")
		if(author="") then author="游客"	'if anonymous user pub a message
    		getIP=Request.ServerVariables("remote_addr")	 	'取客户端IP地址
    		set bs=Server.Createobject("MSWC.BrowserType") 		'获取浏览器版本
		getBrowser=bs.Browser+bs.Version
		getSys=Request.ServerVariables("HTTP_USER_AGENT") 	'获取系统版本
	
		dim conn,rs,sql
		set conn=getconn()
		'--------reply too quick--------
		set rs=getrs()
		sql="select top 1 * from message where fromIP='"&getIP&"' and articID="&articID&" order by addDate desc"
		rs.open sql,conn,1,1
		diff=-1
		if not rs.bof and not rs.eof then
			lastPubTime=rs("addDate")
			diff=DateDiff("s",lastPubTime,now)
		end if
		rs.close
		if(diff>0 and diff<180) then
			'pub msg too quick
			response.write("e103")
		else
			'--------save msg-----------
			sql="insert into message(articID,author,msg,fromIP,browserType,sysVersion) "
			sql=sql&"values('"&articID&"','"&author&"','"&msg&"','"&getIP&"','"&getBrowser&"','"&getSys&"')"
			conn.execute(sql)
			conn.close
			response.write(articID)
		end if
		'---------------------------------------------
	end if
end if
%>