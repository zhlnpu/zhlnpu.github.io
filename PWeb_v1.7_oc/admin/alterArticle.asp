<%@LANGUAGE="VBSCRIPT.Encode" CODEPAGE="936"%>
<%if(session("master")="") then response.redirect("index.asp")%>
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
<%
dbstr="../"
dim conn,rs,sql,articleID
set conn=getconn()
set rs=getrs()

articleID=request("linkid")
action=request("action")
page=request("page")
sql="select * from articles where [id]="&articleID
rs.open sql,conn,1,1

dim title,topic,content,author,authorIP,fromUrl,downloadUrl,pubTime,menu_en
if not rs.bof and not rs.eof then
	title=rs("title")
	topic=rs("topic")
	content=rs("content")
	author=rs("author")
	articName=rs("articName")
	if(session("master")<>author and session("masterqx")>1) then 	'如果非作者本人且无管理权限则
%>
<script language="javascript">
<!--
	alert("对不起，您没有修改的权限！");
	history.back(0);
-->
</script>
<%
	end if
	authorIP=rs("authorIP")
	fromUrl=rs("fromUrl")
	downloadUrl=rs("downloadUrl")
	pubTime=rs("pubTime")
	menu_en=rs("menu")
	setTop=rs("setTop")
end if
rs.close

'-----see which table the article belong to-------
sql="select * from menus where menu_en='"&menu_en&"'"
rs.open sql,conn,1,1
if not rs.bof and not rs.eof then
	articBelong="menus"
else
	articBelong="sys_classConfig"
end if
rs.close
%>
<table align="center" width="800" height="100%" border="0" cellspacing="0" cellpadding="0" class="midBlue">
  <form name="addForm" method="post" action="saveAlterArticle.asp">
  <tr>
    <td width="88" height="22" align="center" bgcolor="#ECF5FF">标题：</td>
    <td width="400" valign="top" bgcolor="#ECF5FF"><input name="title" type="text" style="width:400px" value="<%=title%>" /></td>
    <td width="312" align="center" bgcolor="#F5F5F5">最新发布的文章</td>
  </tr>
  <tr>
    <td align="center" valign="top" bgcolor="#ECF5FF">摘要：</td>
    <td valign="top" bgcolor="#ECF5FF"><textarea name="topic" rows="5" style="width:400px"><%=topic%></textarea></td>
    <td rowspan="5" valign="top" bgcolor="#F5F5F5"><table border="0" cellspacing="5" cellpadding="0" class="usualText"><tr><td><%
		sql="select top 30 * from articles"
		If(Session("masterqx")>1) Then sql=sql&" where author='"&Session("master")&"'"
		sql=sql&" order by pubTime desc"
		Call shownews(sql,"id","title",28,20,"alterArticle.asp","alterArticle.asp","","_self",1,1)
	%></td></tr></table></td>
  </tr>
  <tr>
    <td height="22" align="center" bgcolor="#ECF5FF">出处：</td>
    <td valign="top" bgcolor="#ECF5FF"><input name="fromUrl" type="text" style="width:195px " value="<%=fromUrl%>" /> 置顶<input name="setTop" type="checkBox" value="1" <%if(setTop=1) then response.write("checked=true")%> />
	<span style="width:23px; height:23px;"><input type="checkbox" name="ifSelectClass" value="true" onClick="selectClass()" <%if(articBelong="sys_classConfig") then response.write("checked='true'")%>></span>
	  &nbsp;栏目:<select name="topclass" style="width:133px">
        <%
sql="select * from sys_classConfig order by [index]"
rs.open sql,conn,1,1
if not rs.bof and not rs.eof then
	for i=0 to rs.recordcount-1
		if rs.eof then exit for
		if(menu_en=rs("menu_en")) then
			optionstr="<option value="""&rs("menu_en")&""" selected='selected'>"&rs("menu_cn")&"-"&rs("menu_en")&"</option>"
		else
			optionstr="<option value="""&rs("menu_en")&""">"&rs("menu_cn")&"-"&rs("menu_en")&"</option>"
		end if
		response.Write(optionstr)
		rs.movenext
	next
	rs.close
end if
%>
      </select>
    </td>
    </tr>
  <tr>
    <td height="22" align="center" bgcolor="#ECF5FF">附件：</td>
    <td valign="middle" bgcolor="#ECF5FF"><input name="hiddenupfile" type="hidden"/><input name="downloadUrl" type="text" style="width:250px " value="<%=downloadUrl%>" />
	<IFRAME ID="eWebEditor1" SRC="../Editor/ewebeditor.asp?id=hiddenupfile&style=upload_files&savepathfilename=downloadUrl" FRAMEBORDER="0" SCROLLING="no" WIDTH="23" HEIGHT="23"></IFRAME>
	&nbsp;&nbsp;分类:<select name="menu" style="width:133px">
      <%
sql="select * from menus order by upmenu"
rs.open sql,conn,1,1
if not rs.bof and not rs.eof then
	for i=0 to rs.recordcount-1
		if rs.eof then exit for
		if(menu_en=rs("menu_en")) then
			optionstr="<option value="""&rs("menu_en")&""" selected='selected'>"&rs("menu_cn")&"-"&rs("menu_en")&"</option>"
		else
			optionstr="<option value="""&rs("menu_en")&""">"&rs("menu_cn")&"-"&rs("menu_en")&"</option>"
		end if
		response.Write(optionstr)
		rs.movenext
	next
	rs.close
end if
closeconn(conn)
%>
    </select>
    </td>
    </tr>
  <tr>
    <td height="17" colspan="2" valign="top" bgcolor="#ECF5FF" align="center">
	<input type="hidden" name="content" value="<%=server.HTMLEncode(content)%>" />
	<input type="hidden" name="content_temp" value="<%=server.HTMLEncode(content)%>" />
	<iframe ID="eWebEditor2" src="../Editor/ewebeditor.asp?id=content_temp&style=s_popup1" frameborder="0" scrolling="no" width="550" HEIGHT="340"></iframe>
    </td>
    </tr>
  <tr>
    <td colspan="2" bgcolor="#ECF5FF" align="center"><input type="button" value=" 取  消 " onclick="javascript:history.back(0);" class="handButton" />
	&nbsp;&nbsp;<input type="button" value="保存修改" onclick="saveArtic('<%=session("masterqx")%>')" class="handButton" />
	<input type="hidden" value="<%=articleID%>" name="linkid">
	<input type="hidden" value="<%=action%>" name="action">
	<input type="hidden" value="<%=articName%>" name="articName">
	<input type="hidden" value="<%=author%>" name="author">
	<input type="hidden" value="<%=pubTime%>" name="pubTime">
	<input type="hidden" value="<%=page%>" name="page">
    </td>
    </tr>  
  <tr>
    <td colspan="3"></br><%Call getFoot()%></td>
  </tr>
  </form>
</table>
</body>
</html>