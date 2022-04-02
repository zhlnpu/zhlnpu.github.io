<%@LANGUAGE="VBSCRIPT.Encode" CODEPAGE="936"%>
<!--#include file="Inc/config.asp"-->
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="pragma" content="no-cache">
<META HTTP-EQUIV="expires" CONTENT="Wed, 12 Jan 2007 08:21:57 GMT">
<meta name="robots" content="all" />
<META name="verify-v1" content="3UITyBwQjsxTYwMnF2Wb48QyT5rsHnmPuegxPR+yOAg=" />
<title><%=Index_Title%></title>
<link href="CSS/xg.css" rel="stylesheet" type="text/css" />
</head>
<!--#include file="foot.asp"-->
<script type="text/javascript" src="Inc/setInnerHTML.js"></script>
<script language="javascript" src="JS/xmlHttpRequest.js"></script>
<script type="text/javascript" src="JS/ajax.js"></script>
<script type="text/javascript" src="JS/openWithSubWindow.js"></script>
<script type="text/javascript" src="JS/setBgcolor.js"></script>
<script type="text/javascript" src="JS/index_getArtic.js"></script>
<script language="javascript">
<!--
//window.open('admin/ipindex.asp','ipindex');
-->
</script>
<%
Response.Expires = -1
Response.ExpiresAbsolute = Now() - 1
Response.cachecontrol = "no-cache"

if(session("master")<>"") then 
	colsnum=UBound(classname)+1
	iflogin=1
else
	colsnum=UBound(classname)
	iflogin=0
end if
%>
<body onload='setBgcolor("topic_<%=Index_showMenu%>",<%=UBound(classname)%>,"#AED7FF");' bgcolor="#DEE2FE">
<div id="quitdiv" style="position:absolute;visibility:hidden;border:1px black solid;background-color:menu;padding:10px;line-height:140%" onMouseOver="clearTimeout(timer)" onMouseOut="timer=setTimeout('hide(quitdiv)',500)">
<a href="admin/index.asp">管理网站</a><br>
<a href="quit.asp">退出系统</a>
</div>
<table align="center" width="800" height="100%" border="0" cellspacing="0" cellpadding="0" bgcolor="#FFFFFF">
  <tr>
    <td height="80" colspan="<%=colsnum%>" background="images/top.jpg">&nbsp;</td>
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
    <td colspan="<%=colsnum%>"><table width="100%" height="498" border="0" cellpadding="0" cellspacing="0" bordercolorlight="#FFCAFF" bordercolordark="#FFFFFF">
      <tr>
        <td width="20%" valign="top" bgcolor="#F0F0F0"><table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td><table width="100%" height="1"  border="0" cellpadding="0" cellspacing="0">
                <tr>
                  <td><img src="images/spacer.gif" width="2" height="3"></td>
                </tr>
            </table></td>
          </tr>
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
          <tr>
            <td height="2px"><table width="100%" height="1"  border="0" cellpadding="0" cellspacing="0">
                <tr>
                  <td><img src="images/spacer.gif" width="2" height="3"></td>
                </tr>
            </table></td>
          </tr>
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
                        <td width="90%" height="100"><iframe src="<%=AD_seacher%>" style="width:100%; height:100%" scrolling="no" frameBorder="no"> </iframe></td>
                      </tr>
                  </table></td>
                </tr>
            </table></td>
          </tr>
          <tr>
            <td><table width="100%" height="1"  border="0" cellpadding="0" cellspacing="0">
                <tr>
                  <td><img src="images/spacer.gif" width="2" height="3"></td>
                </tr>
            </table></td>
          </tr>
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
                        <td width="90%" height="500" valign="top"><iframe src="admin/showTopArtics.asp" style="width:100%; height:100%" scrolling="no" frameBorder="no"></iframe></td>
                      </tr>
                  </table></td>
                </tr>
            </table></td>
          </tr>
          <!--topartics show end-->
          <!--local search show start-->
          <tr>
            <td><table width="100%" height="1"  border="0" cellpadding="0" cellspacing="0">
                <tr>
                  <td><img src="images/spacer.gif" width="2" height="3"></td>
                </tr>
            </table></td>
          </tr>
          <tr>
            <td><table width="100%" align="right" cellpadding="0" cellspacing="0">
                <tr>
                  <td width="5%"><img src="images/CT_l.gif" width="9" height="20"></td>
                  <td width="90%" align="center" bgcolor="#9494FE" class="classTxt">本站搜索</td>
                  <td width="5%" align="right"><img src="images/CT_R.gif" width="9" height="20"></td>
                </tr>
                <tr>
                  <td colspan="3"><table width="100%" height="100"  border="1" cellpadding="0" cellspacing="0" bordercolorlight="#FFFFFF" bordercolordark="#FFFFFF" class="classTable">
                      <form name="localSearch" method="post" action="articles/default.asp" onSubmit="checkForm()" target="_blank">
                        <tr>
                          <td width="90%" align="left" class="usualText">&nbsp;Article Search<br/>
						  &nbsp;<input type="text" name="articName" /><br/>
						  &nbsp;<input type="submit" value="搜索"/></td>
                        </tr>
                      </form>
                  </table></td>
                </tr>
            </table></td>
          </tr>
          <script language="javascript">
<!--
function checkForm(){
	with(localSearch){
		if(articName.value==""){
			alert("请输入文章标题查询！");
			articName.focus();
			return false;
		}
	}
}
//-->
        </script>
          <!--local search show end-->
        </table></td>
        <td width="80%" id="showArticle" valign="top"><p style="font-size:12px;">Loading...</p></td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td colspan="<%=colsnum%>"><%Call getFoot()%></td>
  </tr>
</table>
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

var indexstr="showUpmenu('<%=classcode(Index_showMenu)%>')";
setTimeout(indexstr,1000);
indexstr="showArticle(<%=Index_articID%>)";	//显示首页内容
setTimeout(indexstr,7000);
-->
</script>