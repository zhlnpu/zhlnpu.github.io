<%@LANGUAGE="VBSCRIPT.Encode" CODEPAGE="936"%>
<!--#include file="../Inc/config.asp"-->
<!--#include file="../Inc/VB_MD5.asp"-->
<%'reset user password
username=request("username")
email=request("email")

dbstr="../"
dim conn,rs,sql
set conn=getConn()
set rs=getrs()
sql="select top 1 * from users where username='"&username&"' and email='"&email&"'"

rs.open sql,conn,1,1
if not rs.bof and not rs.eof then	'reset password
	newPass=month(now)&day(now)&hour(now)&minute(now)&second(now)
	am_newPass=MD5(newPass)		'md5
	sql="update users set userpass='"&am_newPass&"' where username='"&username&"'"
	conn.execute(sql)		'alter password
	'------------给用户发送邮件----------
	arrstr=Split(SmtpServer,".",-1,1)
	Set msg = Server.CreateObject("JMail.Message")
	msg.silent = true
	msg.Logging = true
	msg.Charset = "gb2312"
	msg.ContentType="text/html"
	msg.MailServerUserName = JMailServerUserName	'输入smtp服务器验证登陆名
	msg.MailServerPassword = JMailServerPassword	'输入smtp服务器验证密码
	msg.From = JMailServerUserName&"@"&arrstr(1)&"."&arrstr(2)		'发件人
	msg.FromName = JMailServerUserName
	msg.AddRecipient email
	msgstr="<font color=blue>欢迎您加入<a href=http://"&LocalHostUrl&" target=_blank>"&LocalHostUrl&"</a>,<br/>谢谢您对我们的支持！</font>"
	msgstr=msgstr&"<br/><br/>您的新密码是："&newPass
	msgstr=msgstr&"<br/>请及时登陆修改!"
	msgstr=msgstr&"<br/>登陆网址：<a href=http://"&LocalHostUrl&"/admin/ target=_blank>点击登陆</a>"
	msg.Body = msgstr
	msg.Subject = "密码重设--"&LocalHostUrl
	msg.Send (SmtpServer)
	set msg2 = nothing
	'------------给用户发送邮件----------
	response.Write("100")
else
	response.Write("101")	'back error 101 status
end if
rs.close
conn.close
%>