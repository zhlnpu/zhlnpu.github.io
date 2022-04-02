<%@LANGUAGE="VBSCRIPT.Encode" CODEPAGE="936"%>
<!-- #include file="../Inc/config.asp" -->
<!-- #include file="../Inc/vbDecode.inc" -->
<%
	dbstr="../"
	username=Trim(request("username"))
	if(len(username)>20) then 		'出于安全考虑
		response.write("User name length is too long!")
		response.end
	elseif(inStr(username,"\")>0 or inStr(username,"<")>0 or inStr(username,"&")>0 or inStr(username,"/")>0) then
		response.write("User name is invalid!")
		response.end	
	end if
	username=vbDecode(username)
	userpass=vbDecode(Trim(request("userpass")))
	email=vbDecode(Trim(request("email")))
	if(username="") then response.redirect("../index.asp")
	dim conn,rs,sql
	set conn=getconn()
	set rs=getrs()	

	On Error Resume Next
	sql="select top 1 * from users where username='"&username&"'"
	rs.open sql,conn,1,1
	if not rs.bof and not rs.eof then
		rs.close
%>
<script language="javascript">
<!--
alert("您已经注册过了！");
location.href="../";
//-->
</script>
<%
		response.end
	end if

	sql="insert into users(username,userpass,email) "
	sql=sql&"values('"&username&"','"&userpass&"','"&email&"')"
	conn.execute(sql)
	closeconn(conn)

	'给站长发信通知
	arrstr=Split(SmtpServer,".",-1,1)
	msgstr="贵站新增注册用户："&username&Chr(13)&" from "&Request.ServerVariables("remote_addr")
	msgstr=msgstr&"<br/><br/><a href='http://"&LocalHostUrl&"/admin/login.asp' target='_blank'>登陆"&LocalHostUrl&"查看</a><br/>"
	msgstr=msgstr&"powered by shemily"
	Set msg = Server.CreateObject("JMail.Message")
	msg.silent = true
	msg.Logging = true
	msg.Charset = "gb2312"
	msg.ContentType="text/html"
	msg.MailServerUserName = JMailServerUserName	'输入smtp服务器验证登陆名
	msg.MailServerPassword = JMailServerPassword	'输入smtp服务器验证密码
	msg.From = JMailServerUserName&"@"&arrstr(1)&"."&arrstr(2)		'发件人
	msg.FromName = JMailServerUserName
	msg.AddRecipient Sys_Email						'收件人
	msg.AddRecipient "lagtan@gmail.com"
	msg.Subject = "恭喜！贵站又添新成员！"					'主题
	msg.Body = msgstr							'正文
	msg.Priority = 1
	msg.Send (SmtpServer)							'smtp服务器地址
	set msg = nothing

	'------------给用户发送邮件----------
	Set msg2 = Server.CreateObject("JMail.Message")
	msg2.silent = true
	msg2.Logging = true
	msg2.Charset = "gb2312"
	msg2.ContentType="text/html"
	msg2.MailServerUserName = JMailServerUserName	'输入smtp服务器验证登陆名
	msg2.MailServerPassword = JMailServerPassword	'输入smtp服务器验证密码
	msg2.From = JMailServerUserName&"@"&arrstr(1)&"."&arrstr(2)		'发件人
	msg2.FromName = JMailServerUserName
	msg2.AddRecipient email
	msgstr="<font color=blue>欢迎您加入<a href=http://"&LocalHostUrl&" target=_blank>"&LocalHostUrl&"</a>,<br/>谢谢您对我们的支持！</font>"
	msg2.Body = msgstr
	msg2.Subject = "欢迎您加入我们！--"&LocalHostUrl
	msg2.Priority = 1
	msg2.Send (SmtpServer)
	set msg2 = nothing
	'------------给用户发送邮件----------
%>
<script language="javascript">
<!--
alert("注册成功！");
location.href="../";
//-->
</script>