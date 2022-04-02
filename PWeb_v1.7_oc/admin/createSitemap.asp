<%@LANGUAGE="VBSCRIPT.Encode" CODEPAGE="936"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>FSO create Pages for model sky</title>
</head>
<!--#include file="../Inc/config.asp"-->
<body>
<%
	on error resume next
	dim conn,rs,sql
	dbstr="../"
	set conn=getConn()
	set rs=getRs()

    	modelFileAddr=Server.mapPath("../Inc/sitemap.txt") 			'get model file
    	set mFS=Server.createObject("Scripting.FileSystemObject") 		'create fso object
    	set mFile=mFS.openTextFile(modelFileAddr,1) 			'read the model file

	m=mFile.ReadAll
	'------------replace model html------------------
	dim re,replStr
	Set re = New RegExp
	dim thisday
	thisday=year(now)&"-"&month(now)&"-"&day(now)

	'-----add article pathes start----------
	flStr=""
	flStr=flStr&"<url>"&Chr(13)
	flStr=flStr&"  <loc>http://"&LocalHostUrl&"/</loc>"&Chr(13)
	flStr=flStr&"  <lastmod>"&thisday&"</lastmod>"&Chr(13)
	flStr=flStr&"  <changefreq>daily</changefreq>"&Chr(13)
	flStr=flStr&"  <priority>1.0</priority>"&Chr(13)
	flStr=flStr&"</url>"&Chr(13)

	sql="select * from articles order by [id]"
	rs.open sql,conn,1,1
	while not rs.bof and not rs.eof
		flStr=flStr&"<url>"&Chr(13)
		flStr=flStr&"  <loc>http://"&LocalHostUrl&"/articles.asp?linkid="&rs("id")&"</loc>"&Chr(13)
		flStr=flStr&"  <lastmod>"&thisday&"</lastmod>"&Chr(13)
		flStr=flStr&"  <changefreq>daily</changefreq>"&Chr(13)
		flStr=flStr&"  <priority>1.0</priority>"&Chr(13)
		flStr=flStr&"</url>"&Chr(13)

		flStr=flStr&"<url>"&Chr(13)
		flStr=flStr&"  <loc>http://"&LocalHostUrl&"/"&rs("articName")&"</loc>"&Chr(13)
		flStr=flStr&"  <lastmod>"&thisday&"</lastmod>"&Chr(13)
		flStr=flStr&"  <changefreq>daily</changefreq>"&Chr(13)
		flStr=flStr&"  <priority>1.0</priority>"&Chr(13)
		flStr=flStr&"</url>"&Chr(13)
	
		rs.movenext
	wend
	rs.close
	conn.close

	re.Pattern="<!--&articles-->[\s\S]*<!--&articles-->"
	re.IgnoreCase = True
	m=re.replace(m,flStr)		
	'-----add article pathes end----------
	
	fileName="sitemap.xml"
	filePath=Server.MapPath("../")
	set filesave=mFS.CreateTextFile(filePath&"\"&fileName,true)
	filesave.write(m)		'write it
	
	response.Write(fileName&" has been created!<br>")
%>
<input type="button" onClick="closeThis()" value="Close" />
<script language="javascript">
<!--
function closeThis(){
	window.opener=null;
	window.close();
}
//-->
</script>
</body>
</html>