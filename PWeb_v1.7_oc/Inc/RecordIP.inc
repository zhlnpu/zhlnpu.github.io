<%
function RecordIP(thepage,tablename,recordpage)  		'记录访问者IP
  dim conn,sql,rs
  set conn=getconn()
  set rs=getrs()
  if Request.Cookies("visited")<>"True" then 	'判断是否为初次访问
	on error resume next
    	getIP=Request.ServerVariables("remote_addr")	 	'取客户端IP地址
    	set bs=Server.Createobject("MSWC.BrowserType") 		'获取浏览器版本
	getBrowser=bs.Browser+bs.Version
	getSys=Request.ServerVariables("HTTP_USER_AGENT") 	'获取系统版本
    	getTime=Year(Date())&"-"&Right("0"&Month(Date()),2)&"-"&Right("0"&Day(Date()),2)&" "&Right("0"&Hour(Time()),2)&":"&Right("0"&Minute(Time()),2)&":"&Right("0"&Second(Time()),2)
	sql="insert into "&tablename&"(userIP,logTime,userBrowser,userOS,thepage) values('"&getIP&"','"&getTime&"','"&getBrowser&"','"&getSys&"','"&thepage&"')"
	conn.execute(sql)

	sql="select top 1 * from "&tablename&" order by [id] desc"
	rs.open sql,conn,1,1
	if not rs.bof and not rs.eof then
		Response.Cookies("visitedID")=rs("id")		'记录该用户的访问ID
	end if
	rs.close
    	Response.Cookies("visited")="True" 			'设置客户端已访问状态为True
  end if

  if(recordpage="0") then					'记录用户的访问页面
	if(Request.Cookies("visitedID")<>"") then
		sql="update "&tablename&" set thepage=thepage + '->' + '"&thepage&"' where [id]="&Request.Cookies("visitedID")
		conn.execute(sql)
	end if
  end if
  closeconn(conn)
end function
%>