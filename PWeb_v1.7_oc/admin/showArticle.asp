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
	response.write("<script language='javascript'>alert('�Բ��������ʺ���δ����������Ա��ϵ��');location.href='../master/';//history.back(0);</script>")
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
  sql="select [id],title as ����,(iif((select menu_cn from menus where menu_en=menu) is null,(select menu_cn from sys_classConfig where menu_en=menu),(select menu_cn from menus where menu_en=menu))) as ����,"
  sql=sql&"pubTime as ����ʱ��,author as ����,"
  sql=sql&"dayCounter as �ռ���,monthCounter as �¼���,readCounter as �ܼ���"
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
  call ShowTable(sql,thepage,shownum,page,pagenum,1,alterpage,delpage,"�޸�",0)  
  %></td></tr>
<form name="searchArtic" method="post" action="showArticle.asp">
	<tr bgcolor="#EDC4FB" height="22px">
	  <td width="280" align="center"><a href="addArticle.asp">��������</a> | <a 
		href="../master/">����WinXP����</a> | <a href="quit.asp">�˳���½</a></td>
	  <td width="520" align="center" class="classTxt">���������±��������
		<input type="text" name="articName" style="width:200px;height:22px;" />
		<input type="button" value="��ѯ" onclick="checkForm()" style="height:20px;" />
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
			alert("���������±���������");
			articName.focus();
			return false;
		}
		submit();
	}
}
//-->
</script>