<%@LANGUAGE="VBSCRIPT.Encode" CODEPAGE="936"%>
<!--#include file="Inc/config.asp"-->
<!--#include file="foot.asp"-->
<%
on error resume next

articID=CInt(request("linkid"))
if(articID="") then articID=27
dim conn,rs,sql
set conn=getconn()
set rs=getrs()
sql="select top 1 * from articles where [id]="&articID

'on error resume next
rs.open sql,conn,1,1
if not rs.bof and not rs.eof then
	articPath=rs("articName")
	articTitle=rs("title")
else
	articPath="Articles/2006926184388.htm"
	articTitle="PWeb最新版源码下载"
end if
rs.close
conn.close
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="pragma" content="no-cache">
<META HTTP-EQUIV="expires" CONTENT="Wed, 12 Jan 2007 08:21:57 GMT">
<meta name="keywords" content="重用网,PWeb,OCChat,OCChater,源码,oncecode,reuse,技术,交流,个人网站,在线消息系统" />
<meta name="description" content="重用网,PWeb简单个人网站,OCChat在线消息系统发布,技术交流,坚持重用,包括ASP,PHP,.Net,MySQL,MSSQL" />
<title><%=articTitle&" from "&Index_Title%></title>
<link href="CSS/xg.css" rel="stylesheet" type="text/css">
<style type="text/css">
<!--
body {
	background-color: #DDDDDD;
}
-->
</style>
<script type="text/javascript" src="JS/openWithSubWindow.js"></script>
</head>

<body>
<table width="800" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="80" background="images/top.jpg">&nbsp;</td>
  </tr>
</table>
<table width="800" height="600" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
  <tr>
    <td width="640" height="100%" align="center" valign="top"><iframe id="showArticle" name="showArticle" frameborder="0" src="<%=articPath%>" width="100%" height="100%"></iframe></td>
    <td width="160" valign="top" bgcolor="#F7F7F7"><script type="text/javascript"><!--
google_ad_client = "pub-7076175780407848";
google_ad_width = 160;
google_ad_height = 600;
google_ad_format = "160x600_as";
google_ad_type = "image";
//2006-11-22: ajax, 个人网站, 简单个人网站, 重用网, ASP源码
google_ad_channel = "2945071128+3863965312+5437075187+0116949679+1854099870";
google_color_border = "336699";
google_color_bg = "FFFFFF";
google_color_link = "0000FF";
google_color_text = "000000";
google_color_url = "008000";
//--></script>
    <script type="text/javascript"
  src="http://pagead2.googlesyndication.com/pagead/show_ads.js">
  </script>
<!--OC AD self start-->
<iframe frameborder="0" width="160" height="100" src="Ads/ocAd_oc.htm" scrolling="no"></iframe>
<!--OC AD self end-->
	</td>
  </tr>
</table>
<table width="800" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td><%Call getFoot()%></td>
  </tr>
</table>
<script src="http://www.google-analytics.com/urchin.js" type="text/javascript">
</script>
<script type="text/javascript">
_uacct = "UA-1694921-1";
urchinTracker();
</script>
</body>
</html>