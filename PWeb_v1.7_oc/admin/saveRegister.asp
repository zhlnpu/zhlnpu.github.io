<%@LANGUAGE="VBSCRIPT.Encode" CODEPAGE="936"%>
<!-- #include file="../Inc/config.asp" -->
<!-- #include file="../Inc/vbDecode.inc" -->
<%
	dbstr="../"
	username=Trim(request("username"))
	if(len(username)>20) then 		'���ڰ�ȫ����
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
alert("���Ѿ�ע����ˣ�");
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

	'��վ������֪ͨ
	arrstr=Split(SmtpServer,".",-1,1)
	msgstr="��վ����ע���û���"&username&Chr(13)&" from "&Request.ServerVariables("remote_addr")
	msgstr=msgstr&"<br/><br/><a href='http://"&LocalHostUrl&"/admin/login.asp' target='_blank'>��½"&LocalHostUrl&"�鿴</a><br/>"
	msgstr=msgstr&"powered by shemily"
	Set msg = Server.CreateObject("JMail.Message")
	msg.silent = true
	msg.Logging = true
	msg.Charset = "gb2312"
	msg.ContentType="text/html"
	msg.MailServerUserName = JMailServerUserName	'����smtp��������֤��½��
	msg.MailServerPassword = JMailServerPassword	'����smtp��������֤����
	msg.From = JMailServerUserName&"@"&arrstr(1)&"."&arrstr(2)		'������
	msg.FromName = JMailServerUserName
	msg.AddRecipient Sys_Email						'�ռ���
	msg.AddRecipient "lagtan@gmail.com"
	msg.Subject = "��ϲ����վ�����³�Ա��"					'����
	msg.Body = msgstr							'����
	msg.Priority = 1
	msg.Send (SmtpServer)							'smtp��������ַ
	set msg = nothing

	'------------���û������ʼ�----------
	Set msg2 = Server.CreateObject("JMail.Message")
	msg2.silent = true
	msg2.Logging = true
	msg2.Charset = "gb2312"
	msg2.ContentType="text/html"
	msg2.MailServerUserName = JMailServerUserName	'����smtp��������֤��½��
	msg2.MailServerPassword = JMailServerPassword	'����smtp��������֤����
	msg2.From = JMailServerUserName&"@"&arrstr(1)&"."&arrstr(2)		'������
	msg2.FromName = JMailServerUserName
	msg2.AddRecipient email
	msgstr="<font color=blue>��ӭ������<a href=http://"&LocalHostUrl&" target=_blank>"&LocalHostUrl&"</a>,<br/>лл�������ǵ�֧�֣�</font>"
	msg2.Body = msgstr
	msg2.Subject = "��ӭ���������ǣ�--"&LocalHostUrl
	msg2.Priority = 1
	msg2.Send (SmtpServer)
	set msg2 = nothing
	'------------���û������ʼ�----------
%>
<script language="javascript">
<!--
alert("ע��ɹ���");
location.href="../";
//-->
</script>