<%@LANGUAGE="VBSCRIPT.Encode" CODEPAGE="936"%>
<!--#include file="../Inc/config.asp"-->
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title><%=Index_Title%></title>
<link href="../CSS/xg.css" rel="stylesheet" type="text/css" />
</head>
<!--#include file="../Inc/Turn.inc"-->
<!--#include file="foot.asp"-->
<!--#include file="topMenu.asp"-->
<%
if(Session("master")="") then
	response.redirect("index.asp")
elseIf(Session("masterlive")<>"0") Then 
	response.write("<script language='javascript'>alert('对不起，您的帐号尚未激活，请与管理员联系！');location.href='../master/';//history.back(0);</script>")
End If
%>
<body>
<%if(Session("masterqx")<=1) then%>
<!--#include file="top.asp"-->
<%else%>
<table align="center" width="800" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td align="center"><img src="../images/top.jpg" width="100%" border="0"></td>
  </tr>
</table>
<%end if%>
<table align="center" width="800" height="80%" border="0" cellspacing="0" cellpadding="0">
  <tr><td valign="top" colspan="2"><%
  titleStr=trim(request("articName"))
  
  dim sql,thepage,shownum,page,pagenum,alterpage,delpage  
  sql="select [id],title as 标题,(iif((select menu_cn from menus where menu_en=menu) is null,(select menu_cn from sys_classConfig where menu_en=menu),(select menu_cn from menus where menu_en=menu))) as 分类,"
  sql=sql&"pubTime as 发布时间,author as 作者,"
  sql=sql&"dayCounter as 日计数,monthCounter as 月计数,readCounter as 总计数"
  sql=sql&" from articles where [id]>0 "
  if(session("masterqx")>1) then sql=sql&" and author='"&session("master")&"' "
  if(titleStr<>"") then sql=sql&" and InStr([title],'"&titleStr&"')>0 "
  sql=sql&" order by pubTime desc;"
  'response.write(sql)

  thepage="showArticle.asp"
  shownum=16
  alterpage="alterArticle.asp"
  delpage="saveAlterArticle.asp"
  dbstr="../"  
  call ShowTable(sql,thepage,shownum,page,pagenum,1,alterpage,delpage,"修改",0)  
  %></td></tr>
<form name="searchArtic" method="post" action="showArticle.asp">
	<tr bgcolor="#EDC4FB" height="22px">
	  <td width="280" align="center"><a href="addArticle.asp">发表文章</a> | <a 
		href="../master/">进入WinXP桌面</a> | <a href="quit.asp">退出登陆</a></td>
	  <td width="520" align="center" class="classTxt">请输入文章标题检索：
		<input type="text" name="articName" style="width:200px;height:22px;" />
		<input type="button" value="查询" onclick="checkForm()" style="height:20px;" />
	</td></tr>
</form>
  <tr>
    <td colspan="2"><%Call getFoot()%></td>
  </tr>

</table>
</body>
</html>
<script language="javascript">
<!--
function checkForm(){
	with(searchArtic){
		if(articName.value==""){
			alert("请输入文章标题搜索！");
			articName.focus();
			return false;
		}
		submit();
	}
}
//-->
</script>