<%Function showAdminMenu()
if(session("master")="" or session("masterqx")>1) then response.redirect("index.asp")
%>
<table width="800" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFE1FF">
      <tr align="center" height="18" valign="bottom">
        <td width="100" id="showIP"><a href="showIPRecord.asp" onmouseover="disp(div1,1)" onmouseout="timer=setTimeout('hide(div1)',500)">���ʼ�¼</a></td>
        <td width="100" id="showArtic"><a href="showArticle.asp" onmouseover="disp(div2,2)" onmouseout="timer=setTimeout('hide(div2)',500)">���¹���</a></td>
        <td width="100" id="showClass"><a href="showClasses.asp" onmouseover="disp(div3,3)" onmouseout="timer=setTimeout('hide(div3)',500)">�������</a></td>
        <td width="100" id="showTopmenu"><a href="showTopmenus.asp" onmouseover="disp(div4,4)" onmouseout="timer=setTimeout('hide(div4)',500)">��Ŀ����</a></td>
        <td width="100" id="showMsg"><a href="showMsg.asp">���Թ���</a></td>
        <td width="100" id="showUser"><a href="showUsers.asp" onmouseover="disp(div5,6)" onmouseout="timer=setTimeout('hide(div5)',500)">�߼�����</a></td>
        <td width="100" id="quitsys"><a href="../" onmouseover="disp(div6,7)" onmouseout="timer=setTimeout('hide(div6)',500)">�˳�����</a></td>
        <td width="100">&nbsp;</td>
      </tr>
</table>
<%End Function%>
<div id="div1" style="position:absolute;visibility:hidden;border:1px black solid;background-color:menu;padding:10px;line-height:140%" onMouseOver="clearTimeout(timer)" onMouseOut="timer=setTimeout('hide(div1)',500)">
<a href="showIPRecord.asp">���ʼ�¼</a><br>
<a href="showDownlog.asp">���ؼ�¼</a>
</div>
<div id="div2" style="position:absolute;visibility:hidden;border:1px black solid;background-color:menu;padding:10px;line-height:140%" onMouseOver="clearTimeout(timer)" onMouseOut="timer=setTimeout('hide(div2)',500)">
<a href="addArticle.asp">��������</a><br>
<a href="showArticle.asp">��������</a>
</div>
<div id="div3" style="position:absolute;visibility:hidden;border:1px black solid;background-color:menu;padding:10px;line-height:140%" onMouseOver="clearTimeout(timer)" onMouseOut="timer=setTimeout('hide(div3)',500)">
<a href="javascript:void(0)" onClick="ClickAlter('addClass.asp',250,160,212,400)">��ӷ���</a><br>
<a href="showClasses.asp">�������</a>
</div>
<div id="div4" style="position:absolute;visibility:hidden;border:1px black solid;background-color:menu;padding:10px;line-height:140%" onMouseOver="clearTimeout(timer)" onMouseOut="timer=setTimeout('hide(div4)',500)">
<a href="javascript:void(0)" onClick="ClickAlter('addTopmenu.asp',250,140,212,400)">�����Ŀ</a><br>
<a href="showTopmenus.asp">������Ŀ</a>
</div>
<div id="div5" style="position:absolute;visibility:hidden;border:1px black solid;background-color:menu;padding:10px;line-height:140%" onMouseOver="clearTimeout(timer)" onMouseOut="timer=setTimeout('hide(div5)',500)">
<a href="javascript:void(0)" onClick="ClickAlter('login.asp?action=add',228,130,212,400)">����ʺ�</a><br>
<a href="showUsers.asp">�����ʺ�</a><br>
<a href="createSitemap.asp" target="_blank">����sitemap</a>
</div>
<div id="div6" style="position:absolute;visibility:hidden;border:1px black solid;background-color:menu;padding:10px;line-height:140%" onMouseOver="clearTimeout(timer)" onMouseOut="timer=setTimeout('hide(div6)',500)">
<a href="../">�˳�����</a><br>
<a href="../quit.asp">�˳�ϵͳ</a>
</div>
<script language="javascript">
<!--
var timer=null;
function hide(mydiv) {
	mydiv.style.visibility="hidden";
}

function disp(mydiv,i){
	mydiv.style.visibility="visible";
	
	var evtX=event.x;
	var evtY=event.y;

	mydiv.style.pixelLeft=mydiv.clientLeft + evtX -20 - document.body.scrollLeft;
	mydiv.style.pixelTop=mydiv.clientTop + evtY + document.body.scrollTop;
}
-->
</script>
