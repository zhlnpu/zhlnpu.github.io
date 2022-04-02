<%
function oc_sendMail(recMail,smtpSev,user,pass,content,subj,atFile)
	on error resume next
	Set msg = Server.CreateObject("JMail.Message")
	arrstr=Split(smtpSev,".",-1,1)
	msg.silent = true
	msg.Logging = true
	msg.Charset = "utf-8"
	msg.ContentType="multipart/mixed"
	'msg.ContentType="text/html"
	msg.MailServerUserName = user				'user name
	msg.MailServerPassword = pass				'user password
	msg.From = user&"@"&arrstr(1)&"."&arrstr(2)		'send mail
	msg.FromName = user
	if(inStr(recMail,"|")>0) then
		mailArr=split(recMail,"|")
		for i=0 to UBound(mailArr)
			msg.AddRecipient mailArr(i)
		next
	else
		msg.AddRecipient recMail			'recive list
	end if
	
	msg.Priority = 1
	msg.Subject = subj					'subject
	msg.Body = content					'content
	if(atFile<>"") then msg.AddAttachment atFile		'attach file
	msg.Send (smtpSev)					'smtp server
	msg.close()
	set msg = nothing
end function
%>