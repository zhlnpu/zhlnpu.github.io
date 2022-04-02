<%@LANGUAGE="VBSCRIPT.Encode" CODEPAGE="936"%>
<!--#include file="../Inc/config.asp"-->
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<meta name="keywords" content="重用网,PWeb,OCChat,OCChater,源码,oncecode,reuse,技术,交流,个人网站,在线消息系统" />
<meta name="description" content="重用网,PWeb简单个人网站,OCChat在线消息系统发布,技术交流,坚持重用,包括ASP,PHP,.Net,MySQL,MSSQL" />
<title><%=Index_Title%> 文章列表</title>
<link href="../CSS/xg.css" rel="stylesheet" type="text/css" />
<link href="../CSS/m3.css" rel="stylesheet" type="text/css" />
</head>
<%dbstr="../"%>
<!--#include file="../Inc/Turn.inc"-->
<!--#include file="../Inc/showIndexTable.asp"-->
<!--#include file="../Inc/vbDecode.inc"-->
<!--#include file="foot.asp"-->
<script language="JavaScript" type="text/JavaScript">
<!--
function MM_jumpMenu(targ,selObj,restore){ //v3.0
  eval(targ+".location='"+selObj.options[selObj.selectedIndex].value+"'");
  if (restore) selObj.selectedIndex=0;
}
//-->
</script>
<div style="display:none;">
<a href="">ajax应用、web2.0应用、快速建站、web design、asp、php、jsp简单个人网站模板整站程序下载</a>
</div>
<body>
<table align="center" width="800" height="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="80" colspan="2" background="../images/top.jpg">&nbsp;</td>
  </tr>
  <tr>
    <td colspan="2" valign="top" height="16"><script type="text/javascript"><!--
google_ad_client = "pub-7076175780407848";
google_ad_width = 728;
google_ad_height = 15;
google_ad_format = "728x15_0ads_al_s";
//2006-11-22: 简单个人网站, 开发思想, web2.0, reuse, javascript
google_ad_channel = "5437075187+3126251385+3619504181+9035589642+3335041310";
google_color_border = "336699";
google_color_bg = "FFFFFF";
google_color_link = "0000FF";
google_color_text = "000000";
google_color_url = "008000";
//--></script>
<script type="text/javascript"
  src="http://pagead2.googlesyndication.com/pagead/show_ads.js">
</script></td>
  </tr>
  <tr><td width="80%" valign="top"><%
	'on error resume next

  	articName=vbDecode(trim(request("articName")))	'decode some letters
	articName=replace(articName," ","")		'decode space
	page=CInt(request("page"))		'show page

  	dim sql,thepage
	sql="select * from articles where InStr(title,'"&articName&"')>0 order by pubTime desc"
	if(articName="") then sql="select * from articles order by pubTime desc"
	thepage="default.asp"
	if(page="") then page=1

  	Call showIndexTable(sql,8,page,18,"","","_blank")
	%></td>
    <td width="20%" align="center" valign="top"><script type="text/javascript"><!--
google_ad_client = "pub-7076175780407848";
google_ad_width = 160;
google_ad_height = 600;
google_ad_format = "160x600_as";
google_ad_type = "text_image";
//2006-11-22: ASP源码, ajax, 个人网站, 新手入门, 重用网
google_ad_channel = "1854099870+2945071128+3863965312+0971103709+0116949679";
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
<iframe frameborder="0" width="160" height="100" src="../Ads/ocAd_oc.htm" scrolling="no"></iframe>
<!--OC AD self end-->
	</td>
  </tr>
<form name="localSearch" method="post" action="default.asp">
                    <tr bgcolor="#EDC4FB" height="22">
                      <td colspan="2" align="center" class="classTxt"><a href="default.asp">显示所有文章</a> 请输入文章标题进行检索：<input type="text" name="articName" style="width:200px;height:22px;" />
                      <input type="button" value="搜索" onclick="checkForm()" style="height:22px;"/></td>
                    </tr>
</form>
  <tr>
    <td colspan="2"><%Call getFoot()%></td>
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
<script language="javascript">
<!--
function checkForm(){
	with(localSearch){
		if(articName.value==""){
			alert("请输入文章标题查询！");
			articName.focus();
			return false;
		}
		submit();
	}
}
//-->
</script>