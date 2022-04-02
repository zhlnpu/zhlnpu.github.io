<%@LANGUAGE="VBSCRIPT.Encode" CODEPAGE="936"%>
<!--#include file="Inc/config.asp"-->
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="pragma" content="no-cache">
<META HTTP-EQUIV="expires" CONTENT="Wed, 12 Jan 2007 08:21:57 GMT">
<meta name="keywords" content="重用网,PWeb,OCChat,OCChater,源码,oncecode,reuse,技术,交流,个人网站,在线消息系统" />
<meta name="description" content="重用网,PWeb简单个人网站,OCChat在线消息系统发布,技术交流,坚持重用,包括ASP,PHP,.Net,MySQL,MSSQL" />
<meta name="robots" content="all">
<META name="verify-v1" content="3UITyBwQjsxTYwMnF2Wb48QyT5rsHnmPuegxPR+yOAg=" /> 
<title><%=Index_Title%></title>
<link href="CSS/xg.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="JS/xmlHttpRequest.js"></script>
<script type="text/javascript" src="JS/ajax.js"></script>
<script type="text/javascript" src="JS/openWithSubWindow.js"></script>
<script type="text/javascript" src="JS/setBgcolor.js"></script>
<script type="text/javascript" src="JS/default_getArtic.js"></script>
<script type="text/javascript" src="JS/MD5.js"></script>
<script type="text/javascript" src="JS/index_login.js"></script>
<script type="text/javascript" src="js/oc_titleAlert.js"></script>
<script language="javascript">
<!--
window.open('admin/ipindex.asp','ipindex');
-->
</script>
</head>
<!--#include file="foot.asp"-->
<!--#include file="Inc/RecordIP.inc"-->
<%
if(session("master")<>"") then 
	colsnum=UBound(classname)+1
	iflogin=1
else
	colsnum=UBound(classname)
	iflogin=0
end If
Call RecordIP("Default.asp","IPRecord",1)		'Record IP
linkid=request("id")
If(linkid<>"") Then Index_showMenu=linkid
%>
<body onload='setBgcolor("topic_<%=Index_showMenu%>",<%=UBound(classname)%>,"#AED7FF");' bgcolor="#D3D3D3">
<div id="quitdiv" style="position:absolute;visibility:hidden;border:1px black solid;background-color:menu;padding:10px;line-height:140%" onMouseOver="clearTimeout(timer)" onMouseOut="timer=setTimeout('hide(quitdiv)',500)">
<a href="admin/index.asp">管理网站</a><br>
<a href="quit.asp">退出系统</a>
</div>
<table align="center" width="800" height="100%" border="0" cellspacing="0" cellpadding="0" bgcolor="#FFFFFF">
  <tr>
    <td height="80" colspan="<%=colsnum%>"><img src="images/top.jpg" border="0" width="100%" height="100%" /></td>
  </tr>
  <tr height="18" bgcolor="#FFE1FF" valign="bottom">
<%'生成栏目分类
if(session("master")<>"") then
	for i=0 to UBound(classname)-1
		response.write("<td align='center' id='topic_"&i&"' width='"&(100/colsnum)&"%'><a href='javascript:void(0)' onclick='javascript:setBgcolor(""topic_"&i&""","&UBound(classname)&",""#AED7FF"");showUpmenu("""&classcode(i)&""");'>"&classname(i)&"</a></td>")
	next
	if(session("masterqx")<=1) then
		response.write("<td align='center' width='"&(100/colsnum)&"%'><a href='admin/index.asp' onmouseover='disp(quitdiv,"&colsnum&")' onmouseout='timer=setTimeout(""hide(quitdiv)"",500)'>管理网站</a></td>")
	else
		response.write("<td align='center' width='"&(100/colsnum)&"%'><a href='quit.asp'>退出系统</a></td>")
	end if
else
	for i=0 to UBound(classname)-1
		response.write("<td align='center' id='topic_"&i&"' width='"&(100/colsnum)&"%'><a href='javascript:void(0)' onclick='javascript:setBgcolor(""topic_"&i&""","&UBound(classname)&",""#AED7FF"");showUpmenu("""&classcode(i)&""");'>"&classname(i)&"</a></td>")
	next
end if
%>
  </tr>
  <tr valign="top">
    <td colspan="<%=colsnum%>"><table width="100%" height="400" border="0" cellpadding="0" cellspacing="0" bordercolorlight="#FFCAFF" bordercolordark="#FFFFFF">
      <tr>
        <td width="20%" valign="top" bgcolor="#F0F0F0"><table width="100%"  border="0" cellspacing="0" cellpadding="0">
		  <tr><td><table width="100%" height="1"  border="0" cellpadding="0" cellspacing="0"><tr><td>
		  	<img src="images/spacer.gif" width="2" height="3"></td></tr>
			</table>
		  </td></tr>
<!--class show start-->
          <tr>
            <td><table width="100%" align="right" cellpadding="0" cellspacing="0">
              <tr>
                <td width="5%"><img src="images/CT_l.gif" width="9" height="20"></td>
                <td width="90%" align="center" bgcolor="#9494FE" class="classTxt">文章分类</td>
                <td width="5%" align="right"><img src="images/CT_R.gif" width="9" height="20"></td>
              </tr>
              <tr>
                <td colspan="3"><table width="100%"  border="1" cellspacing="0" cellpadding="0" class="classTable" bordercolorlight="#FFFFFF" bordercolordark="#FFFFFF">
                    <tr>
                      <td width="90%" id="showSubPage"><p style="font-size:12px;">Loading...</p></td>
                    </tr>
                </table></td>
              </tr>
            </table></td>
          </tr>
		  <tr><td height="2px">
			<table width="100%" height="1"  border="0" cellpadding="0" cellspacing="0"><tr><td>
		  	<img src="images/spacer.gif" width="2" height="3"></td></tr>
			</table>		  
		  </td></tr>
<!--class show end-->
<!--google search show start-->
          <tr>
            <td><table width="100%" align="right" cellpadding="0" cellspacing="0">
              <tr>
                <td width="5%"><img src="images/CT_l.gif" width="9" height="20"></td>
                <td width="90%" align="center" bgcolor="#9494FE" class="classTxt">Google搜索</td>
                <td width="5%" align="right"><img src="images/CT_R.gif" width="9" height="20"></td>
              </tr>
              <tr>
                <td colspan="3"><table width="100%" height="26"  border="1" cellpadding="0" cellspacing="0" bordercolorlight="#FFFFFF" bordercolordark="#FFFFFF" class="classTable">
                    <tr>
                      <td width="90%" height="100"><iframe src="<%=AD_seacher%>" style="width:100%; height:100%" scrolling="no" frameBorder="no"></iframe></td>
                    </tr>
                </table></td>
              </tr>
            </table></td>
          </tr>
		  <tr><td><table width="100%" height="1"  border="0" cellpadding="0" cellspacing="0"><tr><td>
		  	<img src="images/spacer.gif" width="2" height="3"></td></tr>
			</table>
		  </td></tr>
<!--google search show end-->
<!--topartics show start-->
          <tr>
            <td><table width="100%" align="right" cellpadding="0" cellspacing="0">
              <tr>
                <td width="5%"><img src="images/CT_l.gif" width="9" height="20"></td>
                <td width="90%" align="center" bgcolor="#9494FE" class="classTxt">热门文章</td>
                <td width="5%" align="right"><img src="images/CT_R.gif" width="9" height="20"></td>
              </tr>
              <tr>
                <td colspan="3" valign="top"><table width="100%"  border="1" cellspacing="0" cellpadding="0" class="classTable" bordercolorlight="#FFFFFF" bordercolordark="#FFFFFF">
                    <tr>
                      <td width="90%" height="525" valign="top"><iframe src="admin/showTopArtics.asp" style="width:100%; height:100%" scrolling="no" frameBorder="no"></iframe></td>
                    </tr>
                </table></td>
              </tr>
            </table></td>
          </tr>
<!--topartics show end-->
<!--local search show start-->
		  <tr><td><table width="100%" height="1"  border="0" cellpadding="0" cellspacing="0"><tr><td>
		  	<img src="images/spacer.gif" width="2" height="3"></td></tr>
			</table>
		  </td></tr>
          <tr>
            <td><table width="100%" align="right" cellpadding="0" cellspacing="0">
              <tr>
                <td width="5%"><img src="images/CT_l.gif" width="9" height="20"></td>
                <td width="90%" align="center" bgcolor="#9494FE" class="classTxt">本站搜索</td>
                <td width="5%" align="right"><img src="images/CT_R.gif" width="9" height="20"></td>
              </tr>
              <tr>
                <td colspan="3"><table width="100%" height="100"  border="1" cellpadding="0" cellspacing="0" bordercolorlight="#FFFFFF" bordercolordark="#FFFFFF" class="classTable">
		<form name="localSearch" method="post" action="articles/default.asp" target="_blank">
                    <tr>
                      <td width="90%" align="left" class="usualText">&nbsp;Article Search<br/>&nbsp;<input type="text" name="articName" />
                      &nbsp;<input type="submit" value="搜索"/></td>
                    </tr>
		</form>
                </table></td>
              </tr>
            </table></td>
          </tr>
<!--local search show end-->
        </table></td>
        <td width="80%" align="center" valign="top">
		<table width="100%" height="100%" border="0" cellspacing="0" cellpadding="0">
<form id="loginForm" method="post">
          <tr>
        	<td width="80%" valign="top" class="subMenu" bgcolor="#F0F0F0" height="10">用户名:<input type="text" id="username" name="username" style="width:80px; height:20px;">
          密码:<input type="password" id="userpass" name="userpass" style="width:80px; height:20px;">
          <a href="javascript:void(0);" onClick="loginCheck()">登陆</a> | 
	<a href="admin/register.asp" target="_blank">注册</a> | 
	<a href="admin/resetPass.asp" target="_blank">密码重设</a> | 
	<a href="javascript:void(0);" onClick="showArticle(207)">友情链接</a> | 
	<a href="http://www.ewangit.com" target="_blank">E旺科技</a> | 
	<a href="http://bbs.oncecode.com" target="_blank"><font color="blue"><b>重用网论坛</b></font></a>
		</td>
          </tr>
</form>
          <tr>
            <td align="center" valign="top"><iframe id="showArticle" src="loading.htm" width="100%" height="100%" frameborder="0"></iframe></td>
          </tr>
        </table>
		</td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td colspan="<%=colsnum%>"><%Call getFoot()%></td>
  </tr>
</table>
<!--title alert-->
<div id="ocTitleAlert" class="title_alert">
  <table align="center" height="80%" width="95%"><tr><td id="ocTitleAlert_msg" class="title_alertMsg">点击这里开始！</td></tr></table>
</div>
<!--title alert-->
<!--#include file="Inc/qqOnline.inc"-->
</body>
</html>
<script language="javascript">
<!--
var timer=null;
function hide(mydiv) {
	mydiv.style.visibility="hidden";
}

function disp(mydiv,i){
	var adddis;
	var colnum="<%=colsnum%>";
	adddis=800/colnum;
	mydiv.style.visibility="visible";
	mydiv.style.left=(document.body.scrollWidth-800)/2+adddis*(i-0.5)-24;
	mydiv.style.top=event.srcElement.offsetTop+event.srcElement.offsetHeight+80;
}

var indexstr="showUpmenu('<%=classcode(Index_showMenu)%>');";	//显示首页内容
setTimeout(indexstr,1000);
indexstr="showArticle(<%=Index_articID%>)";	//显示首页内容
setTimeout(indexstr,7000);
-->
</script>