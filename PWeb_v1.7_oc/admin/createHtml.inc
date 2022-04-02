<%
'--------生成HTML文本-------2006.09.26----alter at 2006.11.20
Function createHtml(articID,title,topic,fromUrl,content,pubTime,downloadUrl,author,articName,thepath)
on error resume next
set fso=Server.CreateObject("Scripting.FileSystemObject")
filesavepath=server.mapPath(thepath)
set filesave=fso.CreateTextFile(filesavepath&"\"&articName,true)
filesave.WriteLine("<html>")
filesave.WriteLine("<head>")
filesave.WriteLine("<meta http-equiv=""Content-Type"" content=""text/html; charset=gb2312"">")
filesave.WriteLine("<meta http-equiv=""cache-control"" content=""no-cache"">")
filesave.WriteLine("<meta http-equiv=""pragma"" content=""no-cache"">")
filesave.WriteLine("<META HTTP-EQUIV=""expires"" CONTENT=""Wed, 12 Jan 2007 08:21:57 GMT"">")
filesave.WriteLine("<link href=""../CSS/xg.css"" rel=""stylesheet"" type=""text/css"" />")
filesave.WriteLine("<title>"&title&" from "&Index_Title&"</title>")
'--------生成xmlHttprequest--------
filesave.WriteLine("<script language='javascript' src='../JS/xmlHttpRequest.js'></script>")
filesave.WriteLine("<script language='javascript' src='../JS/ajax_article.js'></script>")
'--------------------------
filesave.WriteLine("</head>")

bodyStr="<body onload=""javascript:resizeParentPage();"">"
filesave.WriteLine(bodyStr)

filesave.WriteLine("<table align='center' width='620' border='0' cellspacing='0' cellpadding='0' class='artic'>")
pubTime="&#x53D1;&#x8868;&#x65E5;&#x671F;: "&pubTime
fromUrl="&#x51FA;&#x5904;: "&fromUrl
author="&#x4F5C;&#x8005;: "&author
tempstr="&#x4E0B;&#x8F7D;&#x5730;&#x5740;: "
	
filesave.WriteLine("<tr><td colspan='2' class='articTitle' height='28' valign='bottom'>"&title&"</td></tr>")
filesave.WriteLine("<tr><td colspan='2'><hr size='1' width='100%' class='xuxian'></hr></td></tr>")
filesave.WriteLine("<tr><td colspan='2' align='right'>"&author&" | "&fromUrl&" | "&pubTime&" | 阅读次数: <span id='readCounter'>...</span></td></tr>")
filesave.WriteLine("<tr><td colspan='2' class='articTopic'>")
filesave.WriteLine("<table align='center' width='98%' border='0' cellspacing='5' cellpadding='0' class='articTopic'><tr><td>"&topic&"</br></br>")
if(downloadUrl<>"") then
	filesave.WriteLine(tempstr&"<a href='http://"&LocalHostUrl&"/"&downloadUrl&"'>http://"&LocalHostUrl&"/"&downloadUrl&"</a>")
end if	
filesave.WriteLine("</td></tr></table></td></tr>")
filesave.WriteLine("<tr><td colspan='2' align='right'>"&adminstr&"<hr size='1' width='100%' class='xuxian'></hr></td></tr>")
filesave.WriteLine("<tr><td colspan='2' class='articText'>"&content&"</td></tr>")
filesave.WriteLine("<tr><td colspan='2' align='right'>"&adminstr&"</td></tr></table>")

'----生成读者评论---
if(IfNeedMsg=1) then	'if live msg is allowed

filesave.WriteLine("<hr size='1' width='620' class='xuxian'></hr>")
filesave.WriteLine("<table width=""620"" border=""0"" cellspacing=""0"" cellpadding=""0"" align=""center"">")
filesave.WriteLine("<tr><td class='articMsg'>")
filesave.WriteLine("<table align='center' width='98%' border='0' cellspacing='5' cellpadding='0' class='articMsg'>")
filesave.WriteLine("<tr><td>&#x6700;&#x65B0;&#x7559;&#x8A00;:</td></tr>")
filesave.WriteLine("<tr><td id='showReaderMsg'>&nbsp;</td></tr></table></td></tr>")
filesave.WriteLine("</table>")
'----生成留言框---
filesave.WriteLine("<table width='600' border='0' cellspacing='0' cellpadding='0' align='center' class='usualText'><tr><td>")
filesave.WriteLine("<table width='98%' border='0' cellspacing='5' cellpadding='0' align='center' class='usualText'>")
filesave.WriteLine("<form name='addMessageForm' method='post'>")
filesave.WriteLine("  <tr>")
filesave.WriteLine("    <td>&#x53D1;&#x8868;&#x7559;&#x8A00;:</td><td>&nbsp;</td>")
filesave.WriteLine("  </tr>")
filesave.WriteLine("  <tr>")
if(IfNeedAdbyMsg=1) then
	filesave.WriteLine("	<td width='130' align='center' valign='top'><iframe src='"&ADbyMsg_frame&"' frameborder=0 width=125 height=110 scrolling=no allowtransparency=true></iframe></td>")
else
	filesave.WriteLine("	<td>&nbsp;</td>")
end if
filesave.WriteLine("    <td align='center'><table width='10'  border='1' cellspacing='0' cellpadding='0' bordercolorlight='#FFCAFF' bordercolordark='#FFFFFF'><tr>")
filesave.WriteLine("    <td align='center'><textarea id='msgcontent' name='msgcontent' style='width:350px; height:100px; border-color:#C8BFFB;border:0px;background-color:#EFEEFF;'></textarea></td>")
filesave.WriteLine("      </tr></table></td>")
filesave.WriteLine("  </tr>")
filesave.WriteLine("  <tr>")
filesave.WriteLine("	<td>&nbsp;</td>")
filesave.WriteLine("    <td align='center'><input type='reset' name='resetit' value='重置' style='height:22px;width:48px;'>")
filesave.WriteLine("      <input type='button' name='saveit' value='发表' style='height:22px;width:48px;' onclick='javascript:saveMessage(addMessageForm.articID.value);'>")
filesave.WriteLine("      <input type='hidden' name='articID' value='"&articID&"'>")
filesave.WriteLine("    </td>")
filesave.WriteLine("  </tr>")
filesave.WriteLine("</form>")
filesave.WriteLine("</table>")
filesave.WriteLine("</td></tr></table>")

end if	'if live msg is allowed
'------------------------------
filesave.WriteLine("</body>")
filesave.WriteLine("</html>")
'--------生成脚本------
filesave.WriteLine("<script language='javascript'>")
filesave.WriteLine("<!--")

filesave.WriteLine("var indexstr=""getCounter('"&articID&"')"";")
filesave.WriteLine("setTimeout(indexstr,2000);")
if(IfNeedMsg=1) then		'if live a msg is allowed
	filesave.WriteLine("indexstr=""showMsgs('"&articID&"');""")
	filesave.WriteLine("setTimeout(indexstr,4000);")
end if

filesave.WriteLine("-->")
filesave.WriteLine("</script>")
'---------------------
filesave.close
End Function
%>