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
	'------------���û������ʼ�----------
	arrstr=Split(SmtpServer,".",-1,1)
	Set msg = Server.CreateObject("JMail.Message")
	msg.silent = true
	msg.Logging = true
	msg.Charset = "gb2312"
	msg.ContentType="text/html"
	msg.MailServerUserName = JMailServerUserName	'����smtp��������֤��½��
	msg.MailServerPassword = JMailServerPassword	'����smtp��������֤����
	msg.From = JMailServerUserName&"@"&arrstr(1)&"."&arrstr(2)		'������
	msg.FromName = JMailServerUserName
	msg.AddRecipient email
	msgstr="<font color=blue>��ӭ������<a href=http://"&LocalHostUrl&" target=_blank>"&LocalHostUrl&"</a>,<br/>лл�������ǵ�֧�֣�</font>"
	msgstr=msgstr&"<br/><br/>�����������ǣ�"&newPass
	msgstr=msgstr&"<br/>�뼰ʱ��½�޸�!"
	msgstr=msgstr&"<br/>��½��ַ��<a href=http://"&LocalHostUrl&"/admin/ target=_blank>�����½</a>"
	msg.Body = msgstr
	msg.Subject = "��������--"&LocalHostUrl
	msg.Send (SmtpServer)
	set msg2 = nothing
	'------------���û������ʼ�----------
	response.Write("100")
else
	response.Write("101")	'back error 101 status
end if
rs.close
conn.close
%>