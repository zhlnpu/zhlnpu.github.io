<%@LANGUAGE="VBSCRIPT.Encode" CODEPAGE="936"%>
<!--#include file="../Inc/config.asp"-->
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title><%=Index_Title%></title>
<link href="../CSS/xg.css" rel="stylesheet" type="text/css" />
</head>
<!--#include file="../Inc/ShowNews.inc"-->
<body>

<table align="center" width="100%" height="100%" border="0" cellspacing="1" cellpadding="0" style="border-collapse:collapse;" bordercolor="#AA9FFF">
  <tr><td valign="top">
<% 
  dbstr="../"
  sql="select top 30 * from articles order by setTop desc"
  if(TopArticOrderBy=0) then
	sql=sql&",pubTime desc"
  else
	sql=sql&",dayCounter desc"
  end if
  Call shownews(sql,"id","title",26,12,"../articles.asp","showTopArtics.asp","#3399FF","_blank",1,1)
%>
<a href="../Articles" target="_blank"><font color="blue">【推荐】浏览所有文章</font></a>
<a href="ipindex.asp" target="_blank"><font color="blue">【推荐】IP来源查询</font></a>
  </td></tr>
  <tr><td align="center"><script type="text/javascript"><!--
google_ad_client = "pub-7076175780407848";
google_ad_width = 120;
google_ad_height = 60;
google_ad_format = "120x60_as_rimg";
google_cpa_choice = "CAAQme-ujAIaCHu73azYxIDbKLHM93M";
google_ad_channel = "4684849410";
//--></script>
<script type="text/javascript" src="http://pagead2.googlesyndication.com/pagead/show_ads.js">
</script></td></tr>
</table>
</body>
</html>