<%@LANGUAGE="VBSCRIPT.Encode" CODEPAGE="936"%>
<!--#include file="../Inc/config.asp"-->
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title><%=Index_Title%></title>
<link href="../CSS/xg.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="../JS/DeCode.js"></script>
<script type="text/javascript" src="../JS/admin_addArticle.js"></script>
</head>
<!--#include file="../Inc/shownews.inc"-->
<!--#include file="foot.asp"-->
<!--#include file="topMenu.asp"-->
<%
if(Session("master")="") then
	response.redirect("index.asp")
elseIf(Session("masterlive")<>"0") Then 
	response.write("<script language='javascript'>alert('对不起，您的帐号尚未激活，请与管理员联系！');history.back(0);</script>")
End If
%>
<body onLoad="selectClass()">
<%if(Session("masterqx")<=1) then%>
<!--#include file="top.asp"-->
<%else%>
<table align="center" width="800" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td align="center"><img src="../images/top.jpg" width="100%" border="0"></td>
  </tr>
</table>
<%end if%>
<table align="center" width="800" height="650" border="0" cellspacing="0" cellpadding="0" class="midBlue">
  <form name="addForm" method="post" action="saveArticle.asp">
  <tr>
    <td width="88" height="22" align="center" bgcolor="#ECF5FF">标题：</td>
    <td width="400" valign="top" bgcolor="#ECF5FF"><input name="title" type="text" style="width:400px " /></td>
    <td width="312" align="center" bgcolor="#F5F5F5">最新发布的文章</td>
  </tr>
  <tr>
    <td align="center" valign="top" bgcolor="#ECF5FF">摘要：</td>
    <td valign="top" bgcolor="#ECF5FF"><textarea name="topic" rows="5" style="width:400px "></textarea></td>
    <td rowspan="5" valign="top" bgcolor="#F5F5F5"><table border="0" cellspacing="5" cellpadding="0" class="usualText"><tr><td><%
		dbstr="../"
		sql="select top 30 * from articles"
		If(Session("masterqx")>1) Then sql=sql&" where author='"&Session("master")&"'"
		sql=sql&" order by pubTime desc"
		Call shownews(sql,"id","title",28,20,"alterArticle.asp","addArticle.asp","","_self",1,1)
	%></td></tr></table></td>
  </tr>
  <tr>
    <td height="22" align="center" bgcolor="#ECF5FF">出处：</td>
    <td valign="top" bgcolor="#ECF5FF"><input name="fromUrl" type="text" style="width:250px " />
	<span style="width:23px; height:23px; "><input type="checkbox" name="ifSelectClass" value="true" onClick="selectClass()"></span>
	&nbsp;栏目:<select name="topclass" style="width:133px">
      <%
dim conn,rs,sql,articletype,articletypename
set conn=getconn()
set rs=getrs()

sql="select * from sys_classConfig order by [index]"
rs.open sql,conn,1,1
if not rs.bof and not rs.eof then
	for i=0 to rs.recordcount-1
		if rs.eof then exit for
		response.Write("<option value="""&rs("menu_en")&""">"&rs("menu_cn")&"-"&rs("menu_en")&"</option>")
		rs.movenext
	next
	rs.close
end if
%>
    </select></td>
    </tr>
  <tr>
    <td height="22" align="center" bgcolor="#ECF5FF">附件：</td>
    <td valign="top" bgcolor="#ECF5FF"><input name="hiddenupfile" type="hidden"/><input name="downloadUrl" type="text" style="width:250px " />
	<IFRAME ID="eWebEditor1" SRC="../Editor/ewebeditor.asp?id=hiddenupfile&style=upload_files&savepathfilename=downloadUrl" FRAMEBORDER="0" SCROLLING="no" WIDTH="23" HEIGHT="23"></IFRAME>
	&nbsp;&nbsp;分类:<select name="menu" style="width:133px">
      <%
sql="select * from menus order by upmenu"
rs.open sql,conn,1,1
if not rs.bof and not rs.eof then
	for i=0 to rs.recordcount-1
		if rs.eof then exit for
		response.Write("<option value="""&rs("menu_en")&""">"&rs("menu_cn")&"-"&rs("menu_en")&"</option>")
		rs.movenext
	next
	rs.close
end if
closeconn(conn)
%>
    </select></td>
    </tr>
  <tr>
    <td height="17" colspan="2" valign="top" bgcolor="#ECF5FF" align="center">
	<input type="hidden" name="content" value="" />
	<input type="hidden" name="content_temp" value="" />
	<iframe ID="eWebEditor2" src="../Editor/ewebeditor.asp?id=content_temp&style=s_popup1" frameborder="0" scrolling="no" width="550" HEIGHT="340"></iframe>
    </td>
    </tr>
  <tr>
    <td colspan="2" bgcolor="#ECF5FF" align="center" valign="top"><input type="button" value=" 取  消 " onclick="javascript:history.back(0);" class="handButton" />
	&nbsp;&nbsp;<input type="button" value="发表文章" onclick="saveArtic('<%=session("masterqx")%>')" class="handButton" /></td>
    </tr>  
  <tr>
    <td colspan="3"></br><%Call getFoot()%></td>
  </tr>
  </form>
</table>
</body>
</html>